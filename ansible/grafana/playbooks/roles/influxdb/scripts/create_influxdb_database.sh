#!/bin/sh
influx -e 'drop database traffic1'
influx -e 'CREATE DATABASE traffic1'
influx -e 'CREATE RETENTION POLICY traffic ON traffic1 DURATION 4w REPLICATION 1 DEFAULT'
