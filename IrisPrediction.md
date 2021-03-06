Iris Prediction
========================================================
author: Vadim Zaigrin
date: Wed Nov 12 20:04:48 2014

Summary
========================================================

* **IrisPrediction** is a [Shiny](http://shiny.rstudio.com) application.
* It trains Iris flower data set for prediction specie of iris by its features.
* It uses Random forest method for classification.
* Running application available here: http://vzaigrin.shinyapps.io/IrisPrediction
* Application source code available here: http://github.com/vzaigrin/IrisPrediction

Iris flower data set
========================================================

The [Iris flower data set](http://en.wikipedia.org/wiki/Iris_flower_data_set), which dates back to seminal work by the eminent statistician R. A. Fisher in the mid-1930s and is arguably the most famous dataset used in data mining, contains 50 examples of each of three types of plant: *Iris setosa*, *Iris versicolor*, and *Iris virginica*. There are four attributes: *sepal length*, *sepal width*, *petal length*, and *petal width* (all measured in centimeters).

We load this data set and prepare it for training:

```r
data(iris)
train<-iris[,-5]
labels<-iris[,5]
```

Random forests
========================================================

[Random forest](http://en.wikipedia.org/wiki/Random_forest) is an ensemble-based method focus only on ensembles of decision trees. This method was championed by Leo Breiman and Adele Cutler, and combines the base principles of bagging with random feature selection to add additional diversity to the decision tree models. After the ensemble of trees (the forest) is generated, the model uses a vote to combine the trees predictions.

We load this method and we build a predictive model:

```r
library(randomForest)
rf<-randomForest(train,labels,
            importance=TRUE,ntree=1000)
```

Classification
========================================================

User enters new data and we use our predictive model for classification.


```r
test<-data.frame(5.9,3,5.1,1.8)
names(test)<-c("Sepal.Length",
        "Sepal.Width","Petal.Length",
        "Petal.Width")
levels(labels)[predict(rf,newdata=test)]
```

```
[1] "virginica"
```

*We use concrete values just for example.*
