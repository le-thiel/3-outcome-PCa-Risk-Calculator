
options(shiny.reactlog=TRUE)
library(shiny)

options(shiny.error = browser)

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
      
        warning(test)
        warnText("Error")
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
              h1("Individualized Risk Assessment of Prostate Cancer")
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
  
  
#  session$onFlushed(function() {
    
#    removePopover(session, "age")
#    addPopover(session, "age", title = "Age", content = tooltip_age_en,
#               placement = "right", trigger = "hover")
    
#    removePopover(session, "psa")
#    addPopover(session, "psa", title = "PSA", content = tooltip_psa_en,
#              placement = "right", trigger = "hover")
    
#    removePopover(session, "volume")
#    addPopover(session, "volume", title = "Prostate Volume", content = tooltip_volume_en,
#               placement = "right", trigger = "hover")
    
#    removePopover(session, "priobiop")
#    addPopover(session, "priobiop", title = "Prior biopsy", content = tooltip_priobiop_en,
#               placement = "right", trigger = "hover")
    
#    removePopover(session, "pirads")
#    addPopover(session, "pirads", title = "PI-RADS", content = tooltip_pirads_en,
#               placement = "right", trigger = "hover")
    
#  }, once = TRUE)
  
  
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