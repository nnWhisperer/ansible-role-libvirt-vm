#!/bin/bash
# Example script: Create a VM and get SSH access
# Usage: ./create-and-connect.sh [vm-name]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VM_NAME="${1:-my-example-vm}"

echo "=== Creating VM: $VM_NAME ==="

# Run the playbook
ansible-playbook \
    -i "${SCRIPT_DIR}/inventory" \
    "${SCRIPT_DIR}/create-vm-and-ssh.yml" \
    -e "vm_name=$VM_NAME" \
    -v

echo ""
echo "=== VM Created Successfully ==="
echo ""
echo "To connect to the VM, run:"
echo "  /tmp/${VM_NAME}-connection.sh"
echo ""
echo "Or use the connection script with commands:"
echo "  /tmp/${VM_NAME}-connection.sh 'uname -a'"
