gcloud dataproc clusters create trial-cluster \
    --region=us-east1 \
    --zone=us-east1-b \
    --master-machine-type=e2-standard-2 \
    --master-boot-disk-size=50GB \
    --num-workers=2 \
    --worker-machine-type=e2-standard-2 \
    --worker-boot-disk-size=50GB \
    --image-version=2.3-debian12
