#!/bin/bash

# Set the name of the README file
README="README.md"

# Check if the README file already exists
if [ -f "$README" ]; then
    echo "$README already exists."
else
    # Create the README file with some initial content
    echo "# Project Title" > "$README"
    echo "A brief description of the project." >> "$README"
    echo "Created $(date)" >> "$README"
    echo "$README created."
fi

# Add the README file to the Git repository
git add "$README"

# Commit the README file to the repository
git commit -m "Add README file"

# Push the commit to the remote repository (optional)
if git config --get remote.origin.url > /dev/null; then
    git push origin $(git branch --show-current)
else
    echo "No remote repository configured. Skipping push."
fi

