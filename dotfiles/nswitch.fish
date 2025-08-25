#!/usr/bin/env fish

# nswutch - wrapper for nixos-rebuild switch with generation labeling
#
# Usage:
#   nswitch [-m "message"] [extra nixos-rebuild flags]
#
# Options:
#   -m, --message TEXT  Add a descriptive message to the generation label
#   -h, --help          Show this help message and exit
#
# Examples:
#   nswitch
#     -> builds with label "Build YYYY-MM-DD at HH:MM:SS"
#
#   nswitch -m "Message"
#     -> builds with label "Build YYYY-MM-DD at HH:MM:SS: Message"
#
#   nswitch --verbose --no-build-nix
#     -> passes flags through to nixos-rebuild
#
#   nswitch -m "Message" --verbose
#     -> combines message and passes flags through

set timestamp (date +"%Y-%m-%d at %H:%M:%S")

# Default: no message
set msg ""
set remaining_args

# Parse args for -m/--message flag
for i in (seq (count $argv))
    set arg $argv[$i]
    switch $arg
        case -h --help
            echo "Usage: nswitch [-m \"message\"] [extra nixos-rebuild flags]"
            echo ""
            echo "Options:"
            echo "  -m, --message TEXT  Add a descriptive message to the generation label"
            echo "  -h, --help          Show this help message and exit"
            echo "Examples:"
            echo "  nswitch"
            echo "    -> builds with label \"Build YYYY-MM-DD at HH:MM:SS\""
            echo ""
            echo "  nswitch -m \"Message\""
            echo "    -> builds with label \"Build YYYY-MM-DD at HH:MM:SS: Message\""
            echo ""
            echo "  nswitch --verbose --no-build-nix"
            echo "    -> passes flags through to nixos-rebuild"
            echo ""
            echo "  nswitch -m \"Message\" --verbose"
            echo "    -> combines message and passes flags through"
            exit 0
        case -m --message
            if test (count $argv) -ge (math $i + 1)
                set msg $argv[(math $i + 1)]
                set i (math $i + 1) # Skip message value
            else
                echo "Error: -m/--message flag requires an argument"
                exit 1
            end
        case "*"
            set remaining_args $remaining_args $arg
    end
end

# Construct label
if test -z "$msg"
    set label "Build $timestamp"
else
    set label "Build $timestamp: $msg"
end

echo ">>> Building with label: $label"

# Echo flags 
if test (count $remaining_args) -gt 1
    echo ">>> Passing extra flags to nixos-rebuild: $remaining_args[2..-1]"
else
    echo ">>> No flags passed to nixos-rebuild"
end

# Pass remaining args ($argv) as extra flags to nixos-rebuild
sudo nixos-rebuild switch --flake /etc/nixos\#pro --generation-label "$label" $argv
