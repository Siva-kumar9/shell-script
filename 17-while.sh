#?/bin/bash

while read -r filepath
do
    echo "Deleting Files:: $filepath"
    rm -rf $filepath
    echo "Deleted Files:: $filepath"
done <<< $FILES_TO_DELETE