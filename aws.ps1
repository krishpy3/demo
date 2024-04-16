Install-Module -Name AWSPowerShell -Scope CurrentUser -Force
Set-DefaultAWSRegion -Region us-west-2
New-EC2Instance -ImageId 'ami-0c55b159cbfafe1f0' -InstanceType 't2.micro' -MinCount 1 -MaxCount 1 -KeyName 'your-key-name'
New-DynamoDBTable -TableName 'MyTable' -AttributeDefinition @{AttributeName = 'Id'; AttributeType = 'S'} -KeySchema @{AttributeName = 'Id'; KeyType = 'HASH'} -ProvisionedThroughput @{ReadCapacityUnits = 1; WriteCapacityUnits = 1}
New-S3Bucket -BucketName 'my-unique-bucket-name'
New-ECSCluster -ClusterName 'MyCluster'
