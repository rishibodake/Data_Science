#Simple Linear Regression

#Importing the dataset
dataset = read.csv('Salary_Data.csv')


#Splitting the data set into the Traing set & Test Set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Simple Linear Regression to the Traing set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the Test Set
y_prediction = predict(regressor, newdata = test_set)


#Visualising the Training Set
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience , y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set') +
  xlab('Years Of Experience') +
  ylab('Salary')


#Graph for Test Set
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience , y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set') +
  xlab('Years Of Experience') +
  ylab('Salary')








