
#This imports the data from the csv and just looks at it. 

Claresparkruns <- read.csv(file = 'input/Claresparkruns.csv')
#could possibly save the output dataset here

View(`Claresparkruns`)
str(Claresparkruns)

#what I wanted to do here was rename the column headings but I am struggling so I renamed them in the csv first
#Julian recommends the rename function which I will add here if needed

#this is a plot of parkrun attendance by event attended

library(ggplot2)
events <- ggplot(data = `Claresparkruns`, aes(event) ) +
  geom_bar(fill="#1380A1") +
  coord_flip() +
  labs(title = "Parkrun Attendance",
       x = "Parkrun name", y = "count")
ggsave('output/plots/events.jpg', plot = events, device = jpeg)

#this is is a plot of finishing time in seconds  

library(ggplot2)
stopwatch <- ggplot(data = `Claresparkruns`, aes(secs) ) +
  geom_bar() +
  labs(title = "Stopwatch bingo",
       x = "Finishing time, seconds only", y = "count") 
ggsave('output/plots/stopwatch.jpg', plot = stopwatch, device = jpeg)

#I now want to sort this by the count of events so the most attended is first.

library(dplyr)
library(ggplot2)
Claresparkruns %>%
  count(event) %>%
  ggplot(aes(reorder(event, n), n)) +
                  geom_col(fill="#1380A1")+
                  coord_flip()+
                  labs(title = "Parkrun Attendance",
                  x = "Parkrun name", y = "count")  

#not sure how to get this to save

#next suggestion to try a line chart of my times, but first need to sort out the formatting of the time variable

