#!/bin/bash

# Install pyenv
curl https://pyenv.run | bash

# Configure pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc

# Reload the shell
source ~/.bashrc

# Install Python 3.10.0 with automatic "yes" responses
yes | pyenv install 3.10.0

# Set Python 3.10.0 as the global version
pyenv global 3.10.0

# Verify the installation
python --version