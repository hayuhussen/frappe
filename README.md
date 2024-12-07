# frappe

# Install Frappe with PostgreSQL and Multitenancy (Shared Database)

Welcome to the Frappe Project! This repository contains the source code and resources for setting up and running a Frappe application.
This repository contains the Frappe framework, a full-stack web application framework built with Python and JavaScript. It is designed to help you build applications quickly and efficiently.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Operating System:** Ubuntu 20.04 or later
- **Python:** Version 3.8 or higher
- **Node.js:** Version 18.x
- **PostgreSQL:** Version 16.x
- **Redis:** Version 7.x
- **Git:** Version 2.20 or higher


**Key Installation Components**

- Core installations include Git, Python dev tools, PostgreSQL, Redis, Node.js 18.x, and Yarn
- PostgreSQL is configured with a custom user and database specifically for Frappe
- Frappe Bench is installed and initialized with version-15 branch

**Configuration and Deployment**

- Sets up multitenancy with PostgreSQL, configures Nginx and Supervisor
- Creates a new site ([site1.com](http://site1.com)) with PostgreSQL database and default admin credentials


## Installation

Follow these steps to set up your Frappe environment:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/hayuhussen/frappe.git
   cd frappe
2. **Run the Setup Script: Execute the setup script to install dependencies and configure your environment:**


   ```bash
      ./setup_frappe.sh



```method 2
go to....
   https://www.notion.so/frappe-installation-155f5bba860f8028bc13df33ccadd165






This script will:

         Install necessary packages (Git, Python development tools, Node.js, PostgreSQL, Redis, etc.)
         Set up the Frappe Bench instance.

