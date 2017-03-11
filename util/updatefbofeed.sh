#!/bin/bash

FBO_DATA_DIR="/Users/stephen/Development/fbo_data"
lftp -e "set sync-mode off; mirror -v -e --parallel=100 --exclude FBOFullXML.xml -- / $FBO_DATA_DIR; quit" ftp.fbo.gov