#!/bin/bash

psql -c "delete from presol;" -d fboparser
psql -c "copy presol from '/Users/stephen/Development/fboparser.git/output.csv' WITH CSV HEADER;" -d fboparser

