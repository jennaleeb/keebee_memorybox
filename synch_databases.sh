# drop local db (should check if it's in use first)
dropdb development_database

# pull down server database
heroku pg:pull DATABASE_URL development_database --app memory-box

# copy images from Amazon Web Services Bucket to a folder called Images
aws s3 sync s3://keebee-memory-box Images