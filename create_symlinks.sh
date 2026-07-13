#!/bin/bash

source ./files.sh

current_dir=$(pwd)
home_dir=$(realpath ~)

t="  "

printf "Creating symlinks:\n"

for file in ${files[@]}
do
  file_path="$current_dir/$file"
  target_path="$home_dir/$file"

  printf "${t}File \`$file\`:"

  if test -L "$target_path" ; then
    # Target already exists and it's a symlink
    current_pointed_path=$(readlink "$target_path")

    if test "$file_path" -ef "$current_pointed_path" ; then
      printf " Already done."
    else
      printf " Skiping.\n"
      printf "${t}${t}A symlink already exists pointing to '$current_pointed_path'"
    fi

  elif test -f "$target_path" ; then
    # Target already exists and it's a file
    printf " Skiping.\n"
    printf "${t}${t}Already exists a file in '$target_path'"
  elif test -d "$target_path" ; then
    # Target already exists and it's a directory
    printf " Skiping.\n"
    printf "${t}${t}Already exists a directory in '$target_path'"
  else
    # Target does not exist
    parent_folder=$(dirname "$target_path")
    mkdir -p "$parent_folder"

    ln -s $file_path $target_path

    printf " Done.\n"
    printf "${t}${t}Created symlink '$file_path' -> '$target_path'."
  fi
  printf "\n"
done
