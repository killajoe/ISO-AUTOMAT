#!/bin/bash

RamUsage() {
    local data=$(free --mebi | grep ^Mem)
    printf "[total=%s] " "$(echo "$data" | awk '{print $2}')MB"
    printf "[used=%s] "  "$(echo "$data" | awk '{print $3}')MB"
    printf "[free=%s]"   "$(echo "$data" | awk '{print $4}')MB"
}

LoadAverage() {
    local loadav=$(uptime | sed 's|.*load average: ||')
    printf "[1 min=%s] " "$(echo "$loadav" | awk '{printf $1}' | sed 's|,$||')"
    printf "[5 min=%s] " "$(echo "$loadav" | awk '{printf $2}' | sed 's|,$||')"
    printf "[15 min=%s]" "$(echo "$loadav" | awk '{printf $3}' | sed 's|,$||')"
}


Main() {
    local kernelrelease=$(uname -r)
    local ramusage=$(RamUsage)
    local cpuusage=$($HOME/.local/bin/cpu)
    local loadaverage=$(LoadAverage)
    local uptime=$(uptime -p)
    local updates=$(checkupdates)
    local quote=$(fortune hitchhiker)

    local html_page=(   # an array variable supports quote characters as well

        "<HTML>"
        "<HEAD>"
        "<TITLE>ISO-AUTOMAT :: Status</TITLE>"
        "</HEAD>"
        "<BODY alink=#0066ff bgcolor=#46b6ff link=#0000ff text=#293f5e vlink=#0033ff>"
        "<meta http-equiv='refresh' content='60'>"
        "<CENTER><H1>ISO-AUTOMAT server status</H1></CENTER>"

        "<center>"

        # Check Kernel Release
        "<b>Kernel Release</b>:"
        "<br>"
        " $kernelrelease"
        "<br>"
        "<br>"

        # check RAM usage
        "<b>Ram usage</b>:"
        "<br>"
        "$ramusage"
        "<br>"
        "<br>"

        # cpu usage
        "<b>CPU usage</b>:"
        "<br>"
        " $cpuusage"
        "<br>"
        "<br>"

        # Check Load Average
        "<b>Load Average</b> :"
        "<br>"
        "$loadaverage"
        "<br>"
        "<br>"

        # Check System Uptime
        "<b>System Uptime</b>:"
        "<br>"
        " $uptime"
        "<br>"
        "<br>"

        # Check updates
        "<b>checkupdates</b>:"
        "<br>"
        " $updates"
        "<br>"
        "<br>"

        # fun quote
        "<b>Quote of the minute</b>:<br>"
        " $quote"
        "<br>"
        "<br>"
        "<img src="http://endeavouros.sytes.net/images/eos-rocket-small.png" alt="eos" />"
        
        "</center>"
        "</BODY>"
        "</HTML>"
    )

    echo "${html_page[@]}"
}

Main
