#!/bin/bash

while getopts ":p:r:z:b:" opt; do
    case $opt in
        p) GOOGLE_PROJECT="$OPTARG"
        ;;
        r) GOOGLE_REGION="$OPTARG"
        ;;
        z) GOOGLE_ZONE="$OPTARG"
        ;;
        b) BUCKET_NAME="$OPTARG"
        ;;
        \?) echo "Invalid option -$OPTARG" >&2
        exit 1
        ;;
    esac
done

gcloud config set project $GOOGLE_PROJECT
gcloud config set compute/region $GOOGLE_REGION
gcloud config set compute/zone $GOOGLE_ZONE
SIZE=$(gsutil du -s gs://$BUCKET_NAME | cut -d" " -f1)
echo "Bucket size is: $SIZE"
if [ "$SIZE" -ge "20000000" ]; then
    echo "Bucket size is bigger than 20MiB"
    gcloud rm -r gs://$BUCKET_NAME
else
    echo "Bucket size is not bigger than 20MiB"
fi