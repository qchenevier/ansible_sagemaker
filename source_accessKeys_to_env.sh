
# read access keys
access_keys_file=$(tail accessKeys.csv -n 1)
IFS=\, read -a access_keys <<< "$access_keys_file" # IFS to split string on ','

# export env variables
export AWS_ACCESS_KEY_ID=${access_keys[0]}
export AWS_SECRET_ACCESS_KEY=${access_keys[1]}
