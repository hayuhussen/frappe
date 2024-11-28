#!/bin/bash

# Step 1: Install git
echo "Installing Git..."
sudo apt-get update
sudo apt-get install -y git

# Step 2: Install Python development tools
echo "Installing Python development tools..."
sudo apt-get install -y python3-dev

# Step 3: Install setuptools and pip
echo "Installing setuptools and pip..."
sudo apt-get install -y python3-setuptools python3-pip

# Step 4: Install virtualenv
echo "Installing virtualenv..."
sudo apt install -y python3.12-venv

# Step 5: Install PostgreSQL (Replacing MariaDB with PostgreSQL)
echo "Installing PostgreSQL..."
sudo apt-get install -y postgresql postgresql-contrib libpq-dev
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Configure PostgreSQL
echo "Configuring PostgreSQL..."
# Creating a user and database for Frappe
sudo -u postgres createuser --interactive --pwprompt postgres
sudo -u postgres createdb frappe

# Step 6: Install Redis
echo "Installing Redis..."
sudo apt-get install -y redis-server

# Step 7: Install Node.js 18.x
echo "Installing Node.js 18.x..."
sudo apt install -y curl
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Step 8: Install Yarn
echo "Installing Yarn..."
sudo apt-get install -y npm
sudo npm install -g yarn

# Step 9: Install wkhtmltopdf
echo "Installing wkhtmltopdf..."
sudo apt-get install -y xvfb libfontconfig wkhtmltopdf

# Step 10: Install Frappe Bench
echo "Installing Frappe Bench..."
sudo -H pip3 install frappe-bench --break-system-packages

# Verify installation
bench --version

# Step 11: Initialize Frappe Bench
echo "Initializing Frappe Bench..."
bench init frappe-bench --frappe-branch version-15

# Step 12: Configure Multitenancy with PostgreSQL
echo "Configuring Multitenancy and PostgreSQL for Frappe..."
cd frappe-bench
bench set-config -g db_type postgres
bench setup supervisor
bench setup nginx

# Step 13: Start Bench and Create Site
echo "Starting Bench and Creating Site..."
bench start &
sleep 10 # Allow the bench server to start
bench new-site site1.com --db-type postgres --admin-password admin123
bench --site site1.com add-to-hosts

# Step 14: Configure Nginx and Supervisor for Frappe
echo "Configuring Nginx and Supervisor for Frappe..."
sudo cp apps/frappe/config/nginx.conf /etc/nginx/sites-available/frappe
sudo ln -s /etc/nginx/sites-available/frappe /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo systemctl enable supervisor
sudo systemctl restart supervisor

# Step 15: Final Setup
echo "Setup Complete. Open the following URL to access Frappe:"
echo "http://site1.com:8000"

