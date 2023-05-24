#!/bin/bash

# Prompt user for script name
echo "Enter a name for the new script:"
read SCRIPT_NAME

# Create new script file with dynamic name
touch "${SCRIPT_NAME}.sh"

# Make the script file executable
chmod +x "${SCRIPT_NAME}.sh"


echo "New script created: ${SCRIPT_NAME}.sh and is executable "
