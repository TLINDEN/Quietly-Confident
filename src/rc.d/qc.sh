#!/bin/sh
#
# qc.sh to start/stop Quietly Confident during boot.

# PROVIDE: qc
# REQUIRE: DAEMON
# BEFORE: LOGIN
# KEYWORD: perl
#
# Add the following line to /etc/rc.conf to enable qc:
#
#  qc_enable="YES"
#  # optional
#  qc_workingdir="/home/bob/mysite"
#  qc_user="bob"
. "/etc/rc.subr"

# Set some defaults
qc_enable=${qc_enable:-"NO"}
qc_workingdir=${qc_workingdir:-"/usr/local/data/qc"}
qc_user=${qc_user:-"nobody"}

name=qc
rcvar=`set_rcvar`
load_rc_config $name
pidfile="${qc_workingdir}/${name}.pid"
command=/usr/local/bin/qc
command_interpreter="/usr/bin/perl"
command_args="daemon ${qc_workingdir}"

start_cmd="echo \"Starting ${name}.\"; su ${qc_user} -c \"${command} ${command_args}\""

run_rc_command "$1"

