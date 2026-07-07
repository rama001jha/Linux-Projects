#!/bin/bash

# ==========================================
# Automated User Management System
# ==========================================

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root."
    exit 1
fi

while true
do
    clear

    echo "======================================"
    echo " Automated User Management System"
    echo "======================================"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Lock User"
    echo "4. Unlock User"
    echo "5. Add User to Group"
    echo "6. Remove User from Group"
    echo "7. Show User Details"
    echo "8. Generate Password"
    echo "9. Show Login History"
    echo "10. Generate User Report"
    echo "11. Exit"
    echo "======================================"

    read -p "Enter your choice: " choice

    case $choice in

    1)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User already exists."
        else
            useradd "$username"
            passwd "$username"
            echo "User created successfully."
        fi
        ;;

    2)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            userdel -r "$username"
            echo "User deleted successfully."
        else
            echo "User does not exist."
        fi
        ;;

    3)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            passwd -l "$username"
            echo "User locked successfully."
        else
            echo "User does not exist."
        fi
        ;;

    4)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            passwd -u "$username"
            echo "User unlocked successfully."
        else
            echo "User does not exist."
        fi
        ;;

    5)
        read -p "Enter username: " username
        read -p "Enter group name: " group

        if ! getent group "$group" > /dev/null
        then
            groupadd "$group"
            echo "Group created."
        fi

        usermod -aG "$group" "$username"
        echo "User added to group."
        ;;

    6)
        read -p "Enter username: " username
        read -p "Enter group name: " group

        gpasswd -d "$username" "$group"
        ;;

    7)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo ""
            echo "========== USER DETAILS =========="
            id "$username"
            echo ""
            grep "^$username:" /etc/passwd
            echo ""
            passwd -S "$username"
        else
            echo "User does not exist."
        fi
        ;;

    8)
        mkdir -p passwords

        password=$(openssl rand -base64 12)

        echo "$password" >> passwords/generated-passwords.txt

        echo ""
        echo "Generated Password:"
        echo "$password"
        echo "Password saved to passwords/generated-passwords.txt"
        ;;

    9)
        read -p "Enter username: " username
        last "$username"
        ;;

    10)

        mkdir -p reports

        report="reports/users-report.txt"

        echo "===================================" > "$report"
        echo "Linux Users Report" >> "$report"
        echo "Generated on: $(date)" >> "$report"
        echo "===================================" >> "$report"
        echo "" >> "$report"

        while IFS=: read -r username password uid gid comment home shell
        do
            if [ "$uid" -ge 1000 ] && [ "$uid" -ne 65534 ]
            then
                echo "Username : $username" >> "$report"
                echo "UID      : $uid" >> "$report"
                echo "GID      : $gid" >> "$report"
                echo "Home Dir : $home" >> "$report"
                echo "Shell    : $shell" >> "$report"
                echo "Groups   : $(id -nG "$username")" >> "$report"
                echo "Status   : $(passwd -S "$username")" >> "$report"
                echo "-----------------------------------" >> "$report"
            fi
        done < /etc/passwd

        echo "User report generated successfully."
        echo "Location: reports/users-report.txt"
        ;;

    11)
        echo "Thank you for using Automated User Management System."
        exit 0
        ;;

    *)
        echo "Invalid choice."
        ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
done
