HeightInCm <- function(HeightValue,HeightUnit) {
        if (HeightUnit=="Centimeters") { HeightValue } else
        round(HeightValue*2.54,1)
}

WeightInKg <- function(WeightValue,WeightUnit) {
        if (WeightUnit=="Kilograms") { WeightValue } else
                round(WeightValue/2.2,1)
}


BMI <- function(Height,Weight) round(Weight/(Height/100)^2,1)
BSA <- function(Height,Weight) round(0.007184*Weight^0.425*Height^0.725,2)
LBM <- function(Height,Weight,Sex) {
  if (Sex=="Male")   LBM<- (0.32810 * Weight) + (0.33929 * Height) - 29.5336
  if (Sex=="Female") LBM<- (0.29569 * Weight) + (0.41813 * Height) - 43.2933
  return(round(LBM,1))
}

BMIcat <- function(BMI) {
        if (BMI < 15)   {dum <- "Very severely underweight"} else
        if (BMI < 16)   {dum <- "Severely underweight"} else
        if (BMI < 18.5) {dum <- "Underweight"} else
        if (BMI < 25)   {dum <- "Normal (healthy weight)"} else
        if (BMI < 30)   {dum <- "Overweight"} else
        if (BMI < 35)   {dum <- "Moderately obese"} else
        if (BMI < 40)   {dum <- "Severely obese"} else
                        {dum <- "Very severely obese"}
        return(dum)
}

shinyServer(
        function(input, output) {

              
          OutHeight <- function() HeightInCm(input$Height,input$HeightUnit)
          OutWeight <- function() WeightInKg(input$Weight,input$WeightUnit)
          OutBMI    <- function() BMI(OutHeight(),OutWeight())
          OutBSA    <- function() BSA(OutHeight(),OutWeight())
          OutLBM    <- function() LBM(OutHeight(),OutWeight(),input$Sex)
          
          output$BMIcat <- renderText({BMIcat(OutBMI())})
          #output$BMIcat <- renderPrint({OutBMI()})
#          output$Height <- renderPrint({OutHeight()})
#          output$Weight <- renderPrint({OutWeight()})
#           output$Sex    <- renderPrint({input$Sex})
#           output$BMI <- renderPrint({BMI(OutHeight(),OutWeight())})
#        }
# )

measuresIn <- reactive({

# Compose data frame
data.frame(
        Name = c("Height (cm)", 
                 "Weight (kg)",
                 "Sex"),
        Value = as.character(c(OutHeight(), 
                               OutWeight(),
                               input$Sex)), 
        stringsAsFactors=FALSE)
        })

measuresOut <- reactive({
        
        # Compose data frame
        data.frame(
                Name = c("Body Mass Index (kg/m^2)",
                         "Body Surface Area (m^2)",
                         "Lean Body Mass (kg)"),
                Value = as.character(c(OutBMI(),
                                       OutBSA(),
                                       OutLBM())), 
                stringsAsFactors=FALSE)
}) 

#Show the values using an HTML table
output$valuesIn <- renderTable({
       measuresIn()
})
output$valuesOut <- renderTable({
        measuresOut()
})

})