#!/bin/sh

sqlite3 /vw-data/db.sqlite3 ".backup '/backup/db-$(date '+%Y%m%d-%H%M').sqlite3'"
