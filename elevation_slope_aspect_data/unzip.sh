#use to unzip slope data downloads

for file in *.zip; do
    if [ -f "$file" ]; then
        unzip "$file"
    else
        echo "No .zip files found."
    fi
done

