# AzureCronBlobUploader
This container will upload a folder on a given time schedule to a Blobcontainer on a Azure Storage Account

# How to use

There are a few ENV vars to be set:
 - UPLOAD_CRON_EXPRESSION - this one expecs a valid CRON expression
 - BLOB_DESTINATIONCONTAINER_URL - https://<storageaccountname>.blob.core.windows.net/<containername>
 - BLOB_DESTINATIONKEY - This accesskey can be found in your storage account under "Access keys".

The data to be uploaded should be mounted at /data.

## Example
docker run --name=myuploader -e UPLOAD_CRON_EXPRESSION='*/2 * * * *' -e BLOB_DESTINATIONCONTAINER_URL="https://mystorageaccount.blob.core.windows.net/mycontainer" -e BLOB_DESTINATIONKEY="mOIUoumoimUOImuoyb9696d93q8m9+asd+1f==" -v /some/data/path/on/host:/data -d robhofmann/azurecronblobuploader:latest