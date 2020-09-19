FOLDER="/data"
mkdir $FOLDER
echo "Container URL: $BLOB_DESTINATIONCONTAINER_URL"
echo "Container Key: $BLOB_DESTINATIONKEY"
azcopy --source $FOLDER --destination $BLOB_DESTINATIONCONTAINER_URL --dest-key $BLOB_DESTINATIONKEY --recursive --quiet