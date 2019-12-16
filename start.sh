#!/bin/sh
# cores in classpath, thanks to lkxyyjx
export CLASSPATH=".:dist/*"
java -server -Dnet.sf.odinms.wzpath=wz server.Start