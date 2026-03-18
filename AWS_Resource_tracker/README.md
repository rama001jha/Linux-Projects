<h1>AWS Resource Tracker using Shell Script and Cron Job</h1>

<h2>Project Overview</h2>
<p>
In this project, I created a shell script to track AWS resources using AWS CLI.
I automated the script using a cron job so that it runs every 5 minutes and stores the output in a log file.
</p>

<hr>

<h2>Step 1: Install AWS CLI (Ubuntu)</h2>

<pre>
sudo apt update
sudo apt install awscli -y
</pre>

<p>Verify installation:</p>

<pre>
aws --version
</pre>

<hr>

<h2>Step 2: Configure AWS CLI</h2>

<pre>
aws configure
</pre>

<p>Enter details like this:</p>

<pre>
AWS Access Key ID: ***************
AWS Secret Access Key: ***************
Default region name: ap-south-1
Default output format: json
</pre>

<hr>

<h3>NOTE: wherever it is written "abc" in cronjob or in shell script you need to change it to the username of your linux environment. e.g, your linux environment could be /home/john   , so change accordingly</h3>

<h2>Step 3: Create Shell Script</h2>

<pre>
vim /home/abc/scripts/aws_resource_tracker.sh
</pre>

<p>Add the following script:</p>

<pre>
#!/bin/bash

############################
# Author: abc
# Date: 18 March 2026
#
# This script reports AWS resource usage
############################

set -x

# list S3 buckets
echo "Printing S3 buckets"
aws s3 ls

# list EC2 instances
echo "Printing EC2 instances"
aws ec2 describe-instances

# list Lambda functions
echo "Printing Lambda functions"
aws lambda list-functions

# list IAM users
echo "Printing IAM users"
aws iam list-users
</pre>

<p>Make the script executable:</p>

<pre>
chmod +x /home/abc/scripts/aws_resource_tracker.sh
</pre>

<hr>

<h2>Step 4: Setup Cron Job</h2>

<p>Open crontab editor:</p>

<pre>
crontab -e
</pre>

<p>Add the following line:</p>

<pre>
*/5 * * * * /home/abc/scripts/aws_resource_tracker.sh >> /home/abc/aws_log.txt 2>&1
</pre>

<p>This will:</p>
<ul>
<li>Run the script every 5 minutes</li>
<li>Append output to aws_log.txt</li>
<li>Store errors in the same file</li>
</ul>

<hr>

<h2>Step 5: Verify Cron Job</h2>

<pre>
crontab -l
</pre>

<p>Check logs:</p>

<pre>
cat /home/rama001/aws_log.txt
</pre>

<hr>

<h2>Conclusion</h2>
<p>
In this project, I learned how to install and configure AWS CLI, write shell scripts, and automate tasks using cron jobs on Ubuntu.
</p>
