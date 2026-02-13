
library(shiny)


shinyServer(function(input, output,session) {
  
  data <- reactive({
    input$calcRisk
    isolate({
      if (input$age>=30 & input$age <=90 & input$psa <= 400 & input$psa > 0 & input$volume <=400
          & input$volume >=10 &input$priobiop != "" & input$pirads != "" ) {
        
        Age    <- as.numeric(input$age)
        
        PSA    <- as.numeric(input$psa)
        
        Volume <- as.numeric(input$volume)
        
        PIRADS <- as.numeric(input$pirads)
        
        
        Prior_neg_biopsy <- ifelse(input$priobiop == "Prior negative biopsy", 
                                   1,0)
        
        
        myrisk <- risk(Age = Age, PSA = PSA, Volume = Volume, 
                       PIRADS = PIRADS,Prior_neg_biopsy = Prior_neg_biopsy)
        
        myrisk
      }
      
      else {
      
        
        HTML("<h1> Error </h1>")
      }
      
    })
  })
  
  output$smile_en <- renderUI({
    out <- ""
    if(input$calcRisk){
      isolate({
        if (!is.na(input$age) & !is.na(input$psa) & !is.na(input$volume) &
            input$priobiop != "" & input$pirads != "") {
          
          if (input$age < 30 | input$age > 90) {
            out <- warnText(warning_age_en)
          }
          
          else if (input$psa <= 0 | input$psa > 400) {
            out <- warnText(warning_psa_en)
          }
          
          else if (input$volume < 10 | input$volume > 400) {
            out <- warnText(warning_volume_en)
          }
          else {
            dat <- data()
            if (sum(dat) == 100) {
              br()
              out <- HTML(calcSmiley(unlist(dat)))
            }
          }
        }
        else {
          out <- warnText(warning_overall_en)
        }
      })
    }
    out
  })
  
    
  
  output$switchTab2 <- renderUI({
    if(input$calcRisk){
    HTML("<script>
    tabs = $('.tabbable .nav.nav-tabs li');
    tabs.removeClass('active');
    $(tabs[0]).addClass('active');

    tabsContents = $('.tabbable .tab-content .tab-pane');
    tabsContents.removeClass('active');
    $(tabsContents[0]).addClass('active');
    </script>")
    }
  })
})