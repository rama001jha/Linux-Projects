#!/bin/bash


############################
# Author: Rama
# Date: 10 march 2026
#
# Version: v1
#
# This resource will report the AWS resource usage
############################

set -x   # Running a Bash script in debug mode helps you see what the script is doing step-by-step while it runs.

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users


# list S3 buckets
echo "print s3 buckets"
aws s3 ls

# list EC2 Instances
echo "print ec2 instances"
aws ec2 describe-instances

# list lambda
echo "print lambda functions"
aws lambda list-functions

# list IAM users
echo "print IAM users"
aws iam list-users
