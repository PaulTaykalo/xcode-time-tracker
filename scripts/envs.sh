#!/bin/sh
# This is the helper script, that will dump all environment variables that can be used in these scripts
# If you're wondering what else can you use

# Apple_PubSub_Socket_Render=/private/tmp/com.apple.launchd.HP4CX6m2JQ/Render
# HOME=/Users/theuser
# IDEAlertMessage=Build Started
# LOGNAME=theuser
# MallocNanoZone=0
# PATH=/Applications/Xcode-8.2.1.app/Contents/Developer/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin
# PWD=/Users/theuser/Projects/my-app
# SHELL=/bin/zsh
# SHLVL=1
# SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.JjnXwrX2yo/Listeners
# TMPDIR=/var/folders/bn/y30ftznn187c4stck0jfk9t00000gn/T/
# USER=theuser
# XPC_FLAGS=0x0
# XPC_SERVICE_NAME=0
# XcodeDeveloperApplicationsDirectory=/Applications/Xcode-8.2.1.app/Contents/Developer/Applications
# XcodeDeveloperDirectory=/Applications/Xcode-8.2.1.app/Contents/Developer
# XcodeDeveloperPlatformsDirectory=/Applications/Xcode-8.2.1.app/Contents/Developer/Platforms
# (Optional) XcodeProject=MyProject.xcodeproj
# XcodeWorkspace=MyProject.xcworkspace
# XcodeWorkspacePath=/Users/theuser/Projects/my-app/MyProject.xcworkspace
# _=/usr/bin/env
# __CF_USER_TEXT_ENCODING=0x1F5:0x0:0x0

env | sort > ~/Xcode_behaviors.out