#! /bin/bash
sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0 ::/g"


tail -f /dev/null
