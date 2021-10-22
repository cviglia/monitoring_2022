# this is my first code in github

# here are the input data
# costanza data on stream
water <-c (100, 200, 300, 400, 500)

# marta data on fishes genomes
fishes <-c (10, 50, 60, 100, 200)

# plot the diversity of fishes (y) versus the amount of water (x)
# a function is used with arguments inside ()
# plot(water, fishes)

# the data we developed can be stored in a table
# a table in R is called data frame

streams <- data.frame(water, fishes)

View(streams)

# we are going to export
# setwd("C:/lab/")
setwd("C:/lab/")

# let's export our table
write.table(streams, file="my_first_table.txt")

# import a file
read.table("my_first_table.txt")
# let's assign it to an object inside R
cvtable <- read.table("my_first_table.txt")

# the first statistics for lazy beautiful people
summary(cvtable)

# Marta hates water
# Marta wants info only about fishes
summary(cvtable$fishes)

# histogram
hist(cvtable$fishes)
hist(cvtable$water)
