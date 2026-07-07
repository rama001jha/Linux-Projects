# Automated User Management System

A menu-driven Bash script to automate Linux user management tasks.

## Features

- Create User
- Delete User
- Lock User
- Unlock User
- Add User to Group
- Remove User from Group
- Show User Details
- Generate Random Password
- View Login History
- Generate Linux User Report

## Technologies

- Bash
- Linux
- User Management
- Groups
- Permissions

## Requirements

- Linux
- Root (sudo) access
- OpenSSL

## Run

```bash
chmod +x user-management.sh
sudo ./user-management.sh
```

## Project Structure

```
automated-user-management/
│
├── user-management.sh
├── README.md
├── reports/
├── passwords/
└── screenshots/
```

## Sample Report

```
Username : john
UID : 1001
GID : 1001
Home Dir : /home/john
Shell : /bin/bash
Groups : john developers
Status : john P ...
```
