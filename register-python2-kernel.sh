# Exit if an error occurs
set -e

# Activate the environment
source activate python2

# Register the kernel
ipython kernel install --user
