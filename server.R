data(iris)
train<-iris[,-5]
labels<-iris[,5]
suppressPackageStartupMessages(library(randomForest))
rf<-randomForest(train,labels,importance=TRUE,ntree=1000)

shinyServer(
    function(input, output) {
        output$olevel<-renderText({
            x1<-as.numeric(input$id1)
            x2<-as.numeric(input$id2)
            x3<-as.numeric(input$id3)
            x4<-as.numeric(input$id4)
            test<-data.frame(x1,x2,x3,x4)
            names(test)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
            levels(labels)[predict(rf,newdata=test)]
        })    
    }
)