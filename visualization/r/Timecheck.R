library(readr)
library(anytime)
library(ggplot2)
source("multiplot.r")

build_times <- read_csv(
  "~/.timecheck/results",
#  "/Users/paultaykalo/Projects/stats/stats.csv",
  col_names = c(
    "Project",
    "Workspace",
    "EventStart",
    "EventEnd",
    "Event",
    "Duration"
  )
)

# Fill up times and dates
build_times <- transform(
  build_times,
  EventStartDateTime = as.Date(anytime(build_times$EventStart)),
  EventStartDate = as.Date(anytime(build_times$EventStart)),
  EventStartMonth = format(as.Date(anytime(
    build_times$EventStart
  )), "%y-%m"),
  EventStartWeekDay = weekdays(as.Date(anytime(
    build_times$EventStart
  )))
  
)

#Filter out unneded events
filtered_build_times = subset(build_times, (Event != "Run Completed"))

aggregated_times <- function(times, aggregation_function) {
  aggregate(
    times$Duration,
    by = list(
      Workspace = times$Workspace,
      Event = times$Event,
      Date = times$EventStartDateTime
    ),
    FUN = aggregation_function
  )
}


event_graph <- function(datasource, yaxis) {
  ggplot(datasource, aes(x = Date, y = x, fill = datasource$Event)) + 
    geom_bar(stat = "identity") + 
    ylab(c(yaxis)) +
    labs(fill = "")
}


workspace_graph <- function(datasource, yaxis) {
  ggplot(datasource, aes(x = Date, y = x, fill = datasource$Workspace)) + 
    geom_bar(stat = "identity") + 
    ylab(c(yaxis)) +
    labs(fill = "")
}


ep1 <- event_graph(aggregated_times(filtered_build_times, sum), yaxis = "Time Spent(s)")
ep2 <- event_graph(aggregated_times(filtered_build_times, length), yaxis = "Count")
wp1 <- workspace_graph(aggregated_times(filtered_build_times, sum), yaxis = "Time Spent(s)") + guides(fill=FALSE)
wp2 <- workspace_graph(aggregated_times(filtered_build_times, length), yaxis = "Count") + guides(fill=FALSE)

png("image.png", width = 1024, height = 768)
multiplot(ep1, ep2, wp1, wp2, cols = 2)