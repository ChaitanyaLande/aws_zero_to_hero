#!/bin/bash

###########################
# Author - Chaitanya
# Date - 16 th sep 2024
#
# version - v1
#
## SIMPLE This script will report the AWS resources usage
#####################################################
#
# AWS S3
# AWS Lambda
# AWS EC2
# AWS IAM users
set -x
# list s3 buckets
echo "Print list of s3 buckets"
/usr/local/bin/aws s3 ls > /chaitanya/resourceTracker

# list EC2 instances
echo "Print list of ec2 instances"
/usr/local/bin/aws ec2 describe-instances | /usr/bin/jq '.Reservations[].Instances[].InstanceId' >> /chaitanya/resourceTracker

# list lambda functions
echo "Print lsit of lambda functions"
/usr/local/bin/aws lambda list-functions >> /chaitanya/resourceTracker

# list IAM users
echo "Print list of Iam users"
/usr/local/bin/aws iam list-users
