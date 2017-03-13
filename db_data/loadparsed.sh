#!/bin/bash

psql -f parsed/load.sql -d fboparser
