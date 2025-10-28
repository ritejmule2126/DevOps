#!/bin/bash
# Script: update_system.sh
# Description: Update and upgrade all system packages

echo "Starting system update on $(date)..."

sudo apt update -y && sudo apt upgrade -y

echo "System update completed successfully on $(date)"
