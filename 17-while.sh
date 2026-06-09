#?/bin/bash

while read -r file
do
    echo "Deleting Files"
    rm -rf $file
done <<< $FILES_TO_DELETE