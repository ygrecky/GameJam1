#!/bin/sh
printf '\033c\033]0;%s\a' Game jam octobre
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Jeu.x86_64" "$@"
