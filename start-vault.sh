#!/bin/bash

echo "Select an action:"
echo "1. Encrypt host_vars"
echo "2. Decrypt host_vars"
read -p "Enter your choice: " choice

# Get host list from inventory.ini (lines not starting with [ or ;)
hosts=($(grep -vE '^\[|^;|^$' inventory.ini | awk '{print $1}'))

echo "Select a host to limit:"
for i in "${!hosts[@]}"; do
    echo "$((i + 1)). ${hosts[$i]}"
done
read -p "Enter host number: " host_choice

selected_host="${hosts[$((host_choice - 1))]}"

case "$choice" in
1)
    ansible-vault encrypt host_vars/$selected_host.yml
    ;;
2)
    ansible-vault decrypt host_vars/$selected_host.yml
    ;;
*)
    echo "Invalid choice!"
    exit 1
    ;;
esac
