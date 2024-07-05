#!/bin/bash

# folder name
FOLDER_NAME="$HOME/script_genrated_folder"

# fine name
FILE_NAME="$FOLDER_NAME/script_genrated_file.txt"


# folder creation
mkdir -p "$FOLDER_NAME"

# file creation
touch "$FILE_NAME"


# Print the welcome message
echo "Welcome to shell scripting learning."

# Write an message into the file.
echo "Welcome to shell scripting learning." > "$FILE_NAME"

