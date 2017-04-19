# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# Install (if you haven't already) and load the `dplyr`package
library(fueleconomy)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acuras <- filter(vehicles, make == 'Acura', year == 2015)
best.acura <- filter(acuras, hwy == max(hwy))
best.model <- select(best.acura, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)


# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.model <- filter(vehicles, make == 'Acura', year == 2015) %>% filter(hwy == max(hwy)) %>% select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
