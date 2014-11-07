shinyUI(fluidPage(
    
    titlePanel("Iris prediction"),
    p("This is a prediction of iris type by iris features based on the ",
        a("Iris flower data set",href="http://en.wikipedia.org/wiki/Iris_flower_data_set")),
    
    sidebarLayout(

        sidebarPanel(
            h3('Input'),
            p('Enter the length and the width of the sepals and petals, in centimetres:'),
            sliderInput("id1", label = strong("Sepal Length"), min = 4.3, max = 7.9, value = 5.1, step = 0.1),
            sliderInput("id2", label = strong("Sepal Width"), min = 2, max = 4.4, value = 3.5, step = 0.1),
            sliderInput("id3", label = strong("Petal Length"), min = 1, max = 6.9, value = 1.4, step = 0.1),
            sliderInput("id4", label = strong("Petal Width"), min = 0.1, max = 2.5, value = 0.2, step = 0.1),
            submitButton('Submit')
        ),    

        mainPanel(
            h3('Prediction:'),
            verbatimTextOutput("olevel")
        )
    )
))