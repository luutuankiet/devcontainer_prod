#!/bin/bash
# Set working directory
ENV_WORK_DIR="$(pwd)"
VIRTUAL_ENV="$ENV_WORK_DIR/.venv"

# Function to print a section header

print_section() {
    local section_title=$1
    echo
    echo "================================="
    echo "================================="
    echo "================================="
    echo "   $section_title"
    echo "================================="
    echo "================================="
    echo "================================="
    echo
}


#  =======================================================================================================================
#  =======================================================================================================================
#  ================================================= DEFAULTS - PYTHON	======================================
#  =======================================================================================================================
#  =======================================================================================================================
#  =======================================================================================================================



#### sets up python
print_section "SETUP PYTHON"
apt-get update && apt-get install -y python3-venv

# init then source env vars
print_section "INIT & SOURCE ENV VARS"
chmod +x ./env.sh

. ./env.sh



# create env
print_section "CREATE VENV & INSTALL REQUIREMENTS"
python3 -m venv --clear $VIRTUAL_ENV



# # install reqs. each lines is a separate process hence neeeds a source .venv in front
source .venv/bin/activate && \
pip install -r requirements.txt



# fix for deactivate script : https://github.com/microsoft/vscode-python/wiki/Fixing-%22deactivate%22-command-for-Virtual-Environments
curl -o $ENV_WORK_DIR/deactivate https://gist.githubusercontent.com/karrtikr/963469ba74c9b7632d2c43224ffa2f25/raw/deactivate
echo "source $ENV_WORK_DIR/deactivate" >> ~/.zshrc




#  =======================================================================================================================
#  =======================================================================================================================
#  ================================================= ZSH	======================================
#  =======================================================================================================================
#  =======================================================================================================================
#  =======================================================================================================================


### sets up zsh terminal
print_section "SETUP ZSH TERMINAL"
curl -o- https://gist.githubusercontent.com/luutuankiet/fbb70fca0f7f948c4e102442d76c363e/raw/terminal-utils-setup | bash



#  =======================================================================================================================
#  =======================================================================================================================
#  ================================================= NPM	======================================
#  =======================================================================================================================
#  =======================================================================================================================
#  =======================================================================================================================

# deps for sqltools - duckdb driver
npm install duckdb-async@0.9.2

# LD CLI
npm install -g @lightdash/cli