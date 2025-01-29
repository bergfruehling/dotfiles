#!/bin/sh

rsync -vrh --progress hc@vpn.henning-carstens.de:/backup/ /Users/hc/backup --delete -b --backup-dir=/Users/hc/backup/old --ignore-existing
