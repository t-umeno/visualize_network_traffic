#!/bin/sh
influx --execute 'drop database traffic1'
influx --execute 'CREATE DATABASE traffic1'
influx --execute 'CREATE RETENTION POLICY traffic ON traffic1 DURATION 4w REPLICATION 1 DEFAULT'
