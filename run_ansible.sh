#!/bin/bash
# filepath: ./run_ansible.sh

echo "Select an action:"
echo "1. Deploy infrastructure (deploy_infra.yml)"
echo "2. Setup"
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
    ansible-playbook -i inventory.ini ./infra/deploy_infra.yml --ask-vault-pass --limit "$selected_host"
    ;;
2)
    # Continue ask for setup
    echo "Select a setup to run:"
    echo "1. Setup and install docker"
    read -p "Enter your choice: " setup_choice
    case "$setup_choice" in
    1)
        ansible-playbook -i inventory.ini ./setup/setup-docker.yml --ask-vault-pass --limit "$selected_host"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
    esac
    ;;
*)
    echo "Invalid choice!"
    exit 1
    ;;
esac
