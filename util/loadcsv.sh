#!/bin/bash

cd db_data
psql -f loadcsv.sql -d fboparser
