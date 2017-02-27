#!/bin/bash

MNT_DIR="/Users/stephen/Development"
FBO_DATA_DIR="$MNT_DIR/fbo_data"
lftp -e "set sync-mode off; mirror -v -e --parallel=100 --include 'FBOFeed' -- / $FBO_DATA_DIR; quit" ftp.fbo.gov