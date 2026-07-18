#!/bin/bash

# Checks that the student's project passes norminette (42's norm
# checker). Run by test.sh with the mini-moul directory as cwd; the
# student's project is at ../

source ./config.sh
source ./utils/norminette_check.sh

check_norminette
