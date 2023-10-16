#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1

GLOBIGNORE=".:.."

link_file() {
    src="$1"
    dst="$2"

    # Recursively link every file in directory
    if [ -d "$src" ]; then
        mkdir -pv "$dst"
        for file in "$src"/*; do
            link_file "$file" "$dst/$(basename "$file")"
        done
        
    else
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
        # update all installed dotfiles + scripts. If you have
        # made any local changes, they will need to be merged.
        ln -v "$src" "$dst"
    fi    
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
