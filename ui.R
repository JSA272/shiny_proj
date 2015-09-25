
shinyUI(pageWithSidebar(
        headerPanel("Child Hunger in the United States"),
        sidebarPanel(
                numericInput("guess", "Guess how many food insecure children live in the United States (in millions):", value = 1),
                br(),
                actionButton("goButton", "Go!"),
                p("Click the button to make your guess.")
        ),
        mainPanel(
                h3("A response to your guess will appear here:"),
                verbatimTextOutput("nText"),
                plotOutput('myHist'),
                verbatimTextOutput("box2")
        )
))