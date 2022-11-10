# -*- coding: utf-8 -*-
"""
Created on Mon Jan 25 16:00:26 2021

@author: juan m ramírez
"""

from google.cloud import storage

def upload_blob(bucket_name, source_file_name, destination_blob_name):
    """Uploads a file to the bucket."""
    bucket_name = "my-photos"
    source_file_name = "./puppy.png"
    estination_blob_name = "puppy01"

    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    blob.upload_from_filename(source_file_name)

    print(
        "File {} uploaded to {}.".format(
            source_file_name, destination_blob_name
        )
    )
