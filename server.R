library(shiny)
library(UsingR)
library(dplyr)
require(Hmisc)

data("reaction.time")
myDB <- reaction.time

dbControl <- filter(myDB, control == "C")
dbTel <- filter(myDB, control == "T")

regModCon <- lm(time ~ age + gender, data = dbControl)
regModTel <- lm(time ~ age + gender, data = dbTel)


shinyServer(
  function(input, output) {
      output$oGen = renderPrint({input$inGen})
      output$oAge = renderPrint({input$inAge})
      output$oCtime = renderText({
        df <- data.frame(age = input$inAge, gender = input$inGen)
        cTime <- predict(regModCon, newdata = df)
              })
      output$oTtime = renderText({
        df <- data.frame(age = input$inAge, gender = input$inGen)
        tTime <- predict(regModTel, newdata = df)
      })
      output$oItime = renderText({
        df <- data.frame(age = input$inAge, gender = input$inGen)
        cTime <- predict(regModCon, newdata = df)
        tTime <- predict(regModTel, newdata = df)
        iTime <- tTime - cTime
      })
  }
)
    