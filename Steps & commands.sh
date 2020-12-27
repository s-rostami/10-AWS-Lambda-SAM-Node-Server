# The following steps should be performed on the AWS cli. 

# 1- create an s3 bucket:
aws s3 mb <bucket_name>

# 2- packege our cloudformation
aws cloudformation package --s3-bucket <bucket_name> --template-file template.yaml --output-template-file template-generated.yaml

# 3- Deploy the package into cloudformation :

aws cloudformation deploy --template-file template-generated.yaml --stack-name <stack_name> --capabilities CAPABILITY_IAM

# at this stage, the stack should be created on the cloudformation. In aoder to use postman to test the API gateway and the lambda, we need to get id token using the following seps. the token will be feed into the header of the post on postman and data will be added to the database using.

# Details of the commands can be find at this address: https://docs.aws.amazon.com/cli/latest/reference/cognito-idp/index.html

# 1- new user sign up:
aws cognito-idp sign-up --client-id <client_id> --username <username> --password <password>

# 2- confirming the user data
2- aws cognito-idp admin-confirm-sign-up --user-pool-id <user-pool-id> --username <username>

# 3- admin initiate auth: first create the file data structure using 3.1 command and then copy and pase in json file. then run the command 3.2 for admin initiate auth. after than we will get the ID-token.

# 3.1) 
aws cognito-idp admin-initiate-auth --generate-cli-skeleton

# 3.2)

aws cognito-idp admin-initiate-auth --cli-input-json file://user_auth.json

# The token can be reviewed. use the https://jwt.io/ to see details of the token.

#Next step is creating Cognito Authorizer on the API Gateway console using Authorizers panel. it can be test on the same place using the idtoken.
