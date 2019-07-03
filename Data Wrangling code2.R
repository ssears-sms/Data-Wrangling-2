getwd()
setwd("/Users/stephaniesears/Documents/Clark Atlanta University/Introduction to Data Science")

titanic_original <- read.csv("titanic_original.csv")
titanic_new <- titanic_original %>% 
  mutate(embarked = ifelse(grepl(" ", embarked, ignore.case = TRUE), "S", embarked)) %>%
  replace_na(list(embarked = "S"))


titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==1,"S" )
titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==4,"S" )
titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==2,"C" )


titanic_new %>% 
  summarise(avg_age = mean(age, na.rm = TRUE))


titanic_new <- titanic_new %>% 
  mutate(boat = ifelse(grepl(" ", boat, ignore.case = TRUE), "NA", boat)) %>%
  replace_na(list(embarked = "Na"))

titanic_new$boat<-replace(titanic_new$boat,titanic_new$boat==1,"NA" )


titanic_new <- titanic_new %>% 
  mutate(has_cabin_number = ifelse(grepl(" ", cabin), 0, 1))
write.csv(titanic_new, file = "titanic_new.csv")
