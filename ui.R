library (shiny)
shinyUI(fluidPage(
  headerPanel("Prediction of increase in Reaction Time with cell phone usage while driving"),
  sidebarPanel(
    helpText("This application predicts the increase in reaction time because of using cellphones while driving"),
    h4("Please indicate your Gender & Age below"),
    radioButtons("inGen", "Gender", c("Female" = "F", "Male" = "M"), inline = TRUE),
    radioButtons("inAge", "Age", c("16 to 24" = "16-24", "25 & above" = "25+"), inline = TRUE)
  ),
  mainPanel(
    h4("You entered:"),
    verbatimTextOutput("oGen"),
    h4("You entered:"),
    verbatimTextOutput("oAge"),
    h4("Your average normal reaction time (in seconds) while driving is :"),
    verbatimTextOutput("oCtime"),
    h4("Your average reaction time (in seconds) due to cellphone usage while driving is :"),
    verbatimTextOutput("oTtime"),
    h4("Your average increase in reaction time (in seconds) due to cellphone usage is :"),
    verbatimTextOutput("oItime")
      )
))