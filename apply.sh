#!/usr/bin/bash
##
## 1. File applyer
## .. 1. Check if exists in ~/
## .. 2. backup it with cp $filename $filename.old
## .. 3. rm $filename
## .. 4. ln -s $filename ./$filename
## 2. Flow
## .. 1. If thero arguments - apply all
## .. 2. if arguments - apply matching
##
apply_file() {
    FILE=~/.${1%%/}
    DOTFILE=~/dotfiles/.${1%%/}
    echo "Processing:   " $FILE
    # Backup
    if [[ -f "$FILE" ]]; then
        cp $FILE $FILE.old
        rm $FILE
    fi
    if [[ -L "$FILE" ]]; then
        unlink $FILE
    fi

    ln -s $DOTFILE $FILE
}

apply_many() {
    for i in $1; do
        if [[ ! -x "$i" ]]; then
            apply_file $i
        fi
    done;
}

if [ $# -eq 0 ]; then
    # Iterate over non-executables and non hidden files in dir
    echo "Applying over all dotfiles"
    apply_many "$(ls)"
else
    # Iterate over dotilenames. provided in arguments
    echo "Applying over $@ only"
    apply_many "$@"
fi
