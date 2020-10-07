# This script will output the accumulated time you've spend building projects on Xcode within the current day.
#
# Output looks like:
#    *********
#    You've spent 27min 24s building <your-project-name>.xcworkspace today
#
#
# To use it:
# 1. Follow the installation process from https://github.com/PaulTaykalo/xcode-time-tracker
# 2. Copy this script to `~/.timecheck` folder.
# 3. Run `ruby ~/.timecheck/report_time.rb`
#
# This is a never ending script that will keep reporting updated times as soon as a build/run is finished.
# To stop it, just use Ctrl+C

require 'Listen'
require 'Date'

path = "#{Dir.home}/.timecheck"

def report_time(path)
	data = File.read("#{path}/results")
	rows = data.split("\n")

	projects = {}

	for i in 0...rows.count
		values = rows[i].split(",")
		project = (values[0].include? "xcodeproj") ? values[0] : nil 
		workspace = (values[1].include? "xcworkspace") ? values[1] : nil
		start = values[3]
		event = values[4]
		duration = values[5]

		object = {
			"event": event,
			"start": start,
			"duration": duration
		}

		project_name = project ||= workspace
		projects[project_name] = (projects[project_name] ||= []).append(object)
	end

	puts "*********"
	projects.each do |project, events|
		time_spent_on_build = 0
		for i in 0...events.count
			event = events[i]
			date = Date.strptime(event[:start].to_s, '%s')
			if date == Date.today
				time_spent_on_build += event[:duration].to_i
			end
		end
	seconds = time_spent_on_build % 60
	minutes = time_spent_on_build / 60

	puts "You've spent #{minutes}min #{seconds}s building #{project} today"
	end
end

report_time(path)

listener = Listen.to(path) { |modified, added, removed|
	report_time(path)
}
listener.start
sleep