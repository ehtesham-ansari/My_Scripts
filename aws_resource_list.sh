#!/bin/bash
 
###########################################################
#
# purpose: generating the aws resource list.
# date: 07-09-2024
# author: Md Ehtesham
# version:  v0.0.1
#
# following are the supported aws services by the script.
# EC2
# S3
# RDS
# DynamoDB
# Lambda
# VPC
# Route53
# IAM
# ELB
#
# Uasge: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 EC2


###########################################################

# check if the required arguments are passed or not.

if [ $# -ne 2 ]; then
echo "please pass region and service as arguments"
echo "Uasge: ./aws_resource_list.sh <region> <service_name>"
exit 1
fi


# check if the aws-cli is installed or not

if ! command -v aws &> /dev/null; then
echo "Aws Cli is not installed. please install and try again."
exit 1
fi 

# check if the aws-cli is configured or not.

if [ ! -d ~/.aws ]; then
echo "Aws-Cli is not configured"
exit 1
fi

# Execute the AWS CLI command based on the service name
case $2 in
EC2)
    aws ec2 describe-instances --region $1
    ;;
S3)
    aws s3api list-buckets --region $1
    ;;
RDS)
    aws describe-db-instances --region $1
    ;;
IAM)
    aws iam list-users --region $1
    ;;
VPC)
    aws ec2 describe-vpcs --region $1
    ;;
DynamoDB)
    aws dynamodb list-tables --region $1
    ;;
Lambda)
    aws lambda list-functions --region $1
    ;;
ELB)
    aws elb describe-load-balancers --region $1
    ;;
EBS)
    aws ec2 dwscribe-volumes --region $1
    ;;
*)
    echo "Invalid service name. plesae provide a valid service name."
    exit 1
    ;;
esac



