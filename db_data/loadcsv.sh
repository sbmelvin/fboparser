#!/bin/bash

psql --set CSV_DIR=hello -f loadgenerics.sql -d fboparser
