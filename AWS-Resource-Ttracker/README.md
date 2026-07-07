<h1 align="center">AWS Resource Tracker</h1>

<p align="center">
  A simple Bash script that reports AWS resource usage using the AWS CLI.
</p>

<hr>

<h2>📌 Project Overview</h2>

<p>
The <strong>AWS Resource Tracker</strong> is a beginner-friendly Bash automation project that retrieves information about commonly used AWS resources from your AWS account.
</p>

<p>
It is designed to help beginners learn:
</p>

<ul>
  <li>Bash scripting</li>
  <li>AWS CLI</li>
  <li>AWS service automation</li>
  <li>Basic DevOps scripting</li>
</ul>

<hr>

<h2>🚀 Features</h2>

<ul>
  <li>Lists all Amazon S3 buckets</li>
  <li>Lists all Amazon EC2 instances</li>
  <li>Lists all AWS Lambda functions</li>
  <li>Lists all IAM users</li>
  <li>Runs in debug mode using <code>set -x</code></li>
</ul>

<hr>

<h2>📂 Project Structure</h2>

<pre>
AWS-Resource-Tracker/
│
├── aws-resource-tracker.sh
└── README.md
</pre>

<hr>

<h2>🛠 Technologies Used</h2>

<ul>
  <li>Bash</li>
  <li>AWS CLI</li>
  <li>Linux</li>
  <li>AWS</li>
</ul>

<hr>

<h2>📋 Prerequisites</h2>

<ul>
  <li>Linux or WSL</li>
  <li>AWS CLI installed</li>
  <li>An AWS account</li>
  <li>A configured AWS CLI profile (<code>aws configure</code>)</li>
</ul>

<hr>

<h2>⚙️ Installation</h2>

<pre><code>git clone https://github.com/rama001jha/AWS-Projects.git

cd AWS-Projects

chmod +x aws-resource-tracker.sh
</code></pre>

<hr>

<h2>▶️ Usage</h2>

<pre><code>./aws-resource-tracker.sh
</code></pre>

Or run with:

<pre><code>bash aws-resource-tracker.sh
</code></pre>

<hr>

<h2>📊 Resources Reported</h2>

<table>
<tr>
<th>AWS Service</th>
<th>AWS CLI Command</th>
</tr>

<tr>
<td>Amazon S3</td>
<td><code>aws s3 ls</code></td>
</tr>

<tr>
<td>Amazon EC2</td>
<td><code>aws ec2 describe-instances</code></td>
</tr>

<tr>
<td>AWS Lambda</td>
<td><code>aws lambda list-functions</code></td>
</tr>

<tr>
<td>AWS IAM</td>
<td><code>aws iam list-users</code></td>
</tr>

</table>

<hr>

<h2>📷 Sample Output</h2>

<pre><code>print s3 buckets
2026-03-10  my-demo-bucket

print ec2 instances
Reservations
...

print lambda functions
Functions
...

print IAM users
Users
...
</code></pre>

<hr>


<hr>

<h2>👨‍💻 Author</h2>

<p>
<strong>Rama Shankar Jha</strong><br>
Aspiring Cloud & DevOps Engineer
</p>

<hr>

<h2>⭐ If you found this project useful, consider giving it a star!</h2>
