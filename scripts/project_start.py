#!/usr/bin/python
# Simple as a hell - writing current seconds to the file
import sys,time,os
from os.path import expanduser

seconds = int(round(time.time()))
with open (expanduser("~/.timecheck/start_time"), 'w') as f: f.write (str(seconds))