set.seed(1)
answer <- 15.3
oldguesses <- rnorm(50, mean = answer, sd = 5)

rateguess <- function(guess, oldguesses){
        sum(abs(answer - oldguesses) < abs(answer - guess))
}
makeoutput <- function(input){
        output <- paste("You guessed ", input, " million children. The correct answer is ", answer, " million children. That's a difference of ", abs(answer - input), " million. Of the previous users, there were ", rateguess(input, oldguesses), " guesses closer than yours. Look at the histogram below--the red line shows your guess, and the blue line shows the true value." , sep = "")
}

answersource <- "http://www.feedingamerica.org/hunger-in-america/impact-of-hunger/hunger-and-poverty/hunger-and-poverty-fact-sheet.html"

shinyServer(function(input, output) {
        
        ntext <- eventReactive(input$goButton, {
                input$guess
        })
        
        output$box2 <- eventReactive(input$goButton, {
                paste("Source: ", answersource, sep = "")
        })
        
        output$myHist <- renderPlot({
                hist(oldguesses, xlab='Previous Guesses', col='lightblue',main='Histogram')
                mu <- as.numeric(ntext())
                lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                lines(c(answer, answer), c(0, 200),col="blue",lwd=5)
                
        })
        
        output$nText <- renderText({
               makeoutput(ntext())
                
        })
        
})


