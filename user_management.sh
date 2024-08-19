#!/bin/bash

# Function to create a user
create_user() {
    local username=$1
    local password=$2

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        # Create the user
        useradd -m "$username"
        echo "$username:$password" | chpasswd
        echo "User '$username' created successfully."
    fi
}

# Function to delete a user
delete_user() {
    local username=$1

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Delete the user
        userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

# Function to list all users
list_users() {
    cut -d: -f1 /etc/passwd
}

# Main script logic
case $1 in
    create)
        create_user "$2" "$3"
        ;;
    delete)
        delete_user "$2"
        ;;
    list)
        list_users
        ;;
    *)
        echo "Usage: $0 {create|delete|list} [username] [password]"
        ;;
esac

#./user_management.sh create username password   # Create a new user
#./user_management.sh delete username            # Delete an existing user
#./user_management.sh list                       # List all users

