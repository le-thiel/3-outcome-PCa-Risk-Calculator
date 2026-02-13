#user interface TUM APP

library(shiny)
 
shinyUI(fluidPage(    
  includeCSS("Design.css"),
    navbarPage(title = "TUM 3-outcome Risk Calculator",
             inverse = T,
             tabPanel("Home",
             sidebarLayout(
               sidebarPanel(
                 h2("Characteristics"),
                 numericInput("age","Age", NA, min = 30, max = 90.0),
                 numericInput("psa","PSA [ng/ml]", NA, min = 0),
                 numericInput("volume","Prostate Volume [ml]",NA, min=10),
                 selectInput("priobiop", "Prior negative biopsy", selectize = F,
                               choices = c("","Never had a prior biopsy", "Prior negative biopsy")),
                  
                 selectInput("pirads","Pi-RADS",selectize = F,
                               choices = c("","1","2","3","4","5")),
                 
                 br(),
                 
                 actionButton("calcRisk","Calculate Risk","primary",c("btn-large", "meheh")),
                 uiOutput("switchTab2"),
                 
                 
                 bsPopover(id = "age",title= "Age", content = tooltip_age_en, placement = "right", trigger = "hover"),
                 bsPopover(id = "psa", title = "PSA", content = tooltip_psa_en, placement = "right", trigger = "hover"),
                 bsPopover(id = "priobiop", title ="Prior Biopsy", content = tooltip_priobiop_en, placement = "right", trigger = "hover"),
                 bsPopover(id = "pirads", title = "Pi-RADS", content = tooltip_pirads_en, placement = "right", trigger = "hover"),
                 bsPopover(id="volume", title="Prostate Volume",content= tooltip_volume_en,placement = "right", trigger = "hover")
                 ),
               
               mainPanel(
                 tabsetPanel(
                   tabPanel("Result",
                            conditionalPanel(
                              condition="input.calcRisk",
                              h1(""),
                              htmlOutput("smile_en",inline = T),
                              br()), 
                              HTML(" <br /> <p>Developed using a cohort from a tertiary-care
                                   urology center, where prostate cancer prevalence is high. 
                                   Results may not generalize to other settings and must be interpreted by a clinician!<p>")
                   ),
                   
                   tabPanel("More Information",info_en
                            )
                 )
                )
               )
              ),
             tabPanel("Disclaimer",
                      h1("Disclaimer"), br(), disclaimer
             )
           )
          )
         
       
)   
             
                            