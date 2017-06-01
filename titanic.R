titanic <- read.csv(file = 'titanic_original.csv', stringsAsFactors = FALSE)
str(titanic)

embarked <- titanic$embarked
index <- which(embarked == '')
embarked[index] <- 'S'
titanic['embarked'] <- embarked

mean_age <- mean(titanic$age, na.rm = TRUE)
age <- titanic$age
index <- is.na(age)
age[index] <- mean_age
titanic$age <- age

boat <- titanic$boat
index <- which(boat == '')
boat[index] <- 'None'
titanic$boat <- boat

cabin <- titanic$cabin
cabin[which(cabin != '')] <- 1
cabin[which(cabin == '')] <- 0
titanic['has_cabin_number'] <- has_cabin_number

write.csv(titanic, file = 'titanic_clean.csv')
