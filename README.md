# SAM-Serverless-Application-Model-Example-1
The following services were created using SAM: Lambda, API gateway, Cognito Uaer Pool and client 

In this example the following steps needed to be followed using cli:

1- A S3 bucket needs to be created
aws s3 mb s3://bucket name

2- The SAM cloudformation packege needed to be created:
aws cloudformation package --s3-bucket <s3 bucket name> --template-file template.yaml --output-template-file template-generated.yaml

3- and then the stack can be deployed using the following command:
aws cloudformation deploy --template-file template-generated.yaml --stack-name <stack name> --capabilities CAPABILITY_IAM

important to note that CAPABILITY_IAM should be defined.



