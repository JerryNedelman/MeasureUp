shinyUI(pageWithSidebar(
        headerPanel("How do you measure up?"),
        sidebarPanel(
                p("If you provide your height, weight and sex,
                   this application will calculate three additional 
                   measures of body size:"),
                p("1. Body Mass Index (BMI)"),
                p("2. Body Surface Area (BSA)"),
                p("3. Lean Body Mass (LBM)"),
                p(""),
                p("For each of height and weight, select the units 
                  you prefer to use,
                  and then enter the values of your height and weight 
                  in those units. Then select your sex. Then hit the
                  Submit button."),
                h3("Height"),
                selectInput("HeightUnit", "Height Unit", 
                            choices=c("Centimeters","Inches"),
                            selected="Centimeters"),
                numericInput('Height',"Height Value",175),
                p(""),
                h3("Weight"),
                selectInput("WeightUnit", "Weight Unit", 
                            choices=c("Kilograms","Pounds"),
                            selected="Kilograms"),
                numericInput('Weight', 'Weight Value', 70),
                p(""),
                h3("Sex"),
                selectInput('Sex','Sex', c("Male","Female")),
                submitButton("Submit")
        ),
        mainPanel(
                h4("Your height, weight, and sex are:"),
                tableOutput("valuesIn"),
                h4("Derived from them, your BMI, BSA, and LBM are:"),
                tableOutput("valuesOut"),
                p(""), p(""),
                h4("BMI is often used as an indicator of whether a person is 
                        overweight, underweight, or of normal weight for their 
                        height."),
                h4("According to the World Health Organization,
                   with your BMI you are:"),
                verbatimTextOutput("BMIcat"),
                p("(This assessment is valid only if you are an adult, and some
                  countries have their own local standards.)"),
                p(""), p(""),
                h4("BSA and LBM do not lend themselves to such interpretations."),
                h4("They are sometimes used to adjust doses of drugs, to assure
                   that patients do not get too much or too little for their
                   body size.")
                
        )
))