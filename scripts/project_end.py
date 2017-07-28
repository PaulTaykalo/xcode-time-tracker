#!/usr/bin/python
# Simly calling pyton to finish the task
import sys,time,os
from os.path import expanduser

seconds = int(round(time.time()))
line = ""
with open (expanduser("~/.timecheck/end_time"), 'w') as f: f.write (str(seconds))
with open (expanduser("~/.timecheck/start_time"), 'r') as f: line = f.readline()
start_time = int(line)
diff = seconds - start_time

activity = os.environ.get("IDEAlertMessage", "No message")
project_name = os.environ.get("XcodeWorkspace", "No workspace")
workspace_name = os.environ.get("XcodeProject", "No project")
#user_name = os.environ.get("USER", "No user")

print "It took " + str(diff) + " seconds to [" + activity + "] for " + project_name

with open (expanduser("~/.timecheck/results"), 'a') as f: 
	f.write(workspace_name + "," + project_name + ","+ str(start_time) + "," +  str(seconds) + "," + activity + "," + str(diff) + "\n")

# Upload th results somewhere	
