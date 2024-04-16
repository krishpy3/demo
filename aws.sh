#!/bin/bash

# Define the table name and key schema
TABLE_NAME="ExampleTable"
HASH_KEY="Id"
HASH_KEY_TYPE="S"  # 'S' stands for String, 'N' for Number

# Create DynamoDB table
aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions AttributeName=$HASH_KEY,AttributeType=$HASH_KEY_TYPE \
    --key-schema AttributeName=$HASH_KEY,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1

echo "DynamoDB table $TABLE_NAME created successfully."
