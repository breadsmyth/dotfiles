#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1

GLOBIGNORE=".:.."

link_file() {
    src="$1"
    dst="$2"

    if [ -e "$dst" ]; then
        read -p "  Warning: $dst already exists! Overwrite? (y/N) " yn
        case "$yn" in
            y)
                rm -v "$dst";;
            *)
                return;;
        esac
    fi

    # Note: using a hard link here means that performing
    # a 'git pull' on this repository will automatically
    # update all installed dotfiles + scripts
    ln -v "$src" "$dst"
}

for file in home/*; do
    link_file "$file" "$HOME/$(basename "$file")"
done

for file in config/*; do
    link_file "$file" "$HOME/.config/$(basename "$file")"
done

for file in bin/*; do
    link_file "$file" "$HOME/.bin/$(basename "$file")"
done

