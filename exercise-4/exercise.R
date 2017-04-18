# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
install.packages("nycflights13")
install.packages("dplyr")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
nrow(flights)
ncol(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights$time.gained <- flights$arr_delay - flights$dep_delay

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(time.gained))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>% mutate(gain = arr_delay - dep_delay) %>% arrange(desc(gain))

# Make a histogram of the amount of gain using the `hist` command
hist(flights$gain)

# On average, did flights gain or lose time?
mean(flights$gain, na.rm = TRUE) #lost 5 mins

# Create a data.frame that is of flights headed to seatac ('SEA'), 
sea.flights <- flights[flights$dest=='SEA',]

# On average, did flights to seatac gain or loose time?
mean(sea.flights$gain, na.rm = TRUE) #lost 11 minutes

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation
OriginDestInterest <- function(my_origin, my_dest, interest) {
  results <- flights %>% filter(origin == my_origin, dest == my_dest) %>% select_(interest)
  return(results)
}

# Retireve the air_time column for flights from JFK to SEA
jfk.to.sea <- OriginDestInterest('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
mean(jfk.to.sea$air_time, na.rm = TRUE)/60

# What was the min/max average air time for the JFK to SEA flights?
min(jfk.to.sea$air_time, na.rm = TRUE)/60
max(jfk.to.sea$air_time, na.rm = TRUE)/60
