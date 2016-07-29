#!/bin/bash
set -x
if [ ! -d data ] ;then
		mkdir data 
fi
/usr/bin/flarei --data-dir=data --server-name=localhost --server-port=20001 --monitor-interval=1 --monitor-threshold=2 &
sleep 3
sudo netstat -anp | grep flare
/usr/bin/flared --data-dir=data --index-server-name=localhost --index-server-port=20001 --server-name=localhost --server-port=20002 &
sleep 3
sudo netstat -anp | grep flare
$ echo stats nodes| nc localhost 20001
STAT localhost:20002:role proxy
STAT localhost:20002:state active
STAT localhost:20002:partition -1
STAT localhost:20002:balance 0
STAT localhost:20002:thread_type 16
END

