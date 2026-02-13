
library(shinyBS)




encode <- function(x){
  Encoding(x) <- "UTF-8"
  x
}

source("messages_en.r", encoding="UTF-8")

actionButton <- function(inputId, label, btn.style = "" , css.class = "") {
  if ( btn.style %in% c("primary","info","success","warning","danger","inverse","link")) {
    btn.css.class <- paste("btn",btn.style,sep="-")
  } else btn.css.class = ""
  
  tags$button(id=inputId, type="button", class=paste("btn action-button",btn.css.class,css.class,collapse=" "), label)
}


warnText <- function(txt){
  div(
    div(txt, style = "display: inline"),
    br(), br(),
    class = "warning_text"
  )
}


source(file = "riskcalcTUM.R")



calcSmiley <-  function(risk){
  start = "<table><tr><td width='50%' height=400 valign='top'>"
  greenFace = "<td> <img src='cancer_gr.PNG' width='35' height='35' alt='green face'> </td>"  
  yellowFace = "<td> <img src='cancer_yel.PNG' width='35' height='35' alt='yellow face'> </td>"  
  redFace = "<td> <img src='cancer_red.PNG' width='35' height='35' alt='red face'> </td>"
  end = "</tr></table>"

    
  res0_en <- "Based on the provided risk factors a prostate biopsy performed would have a:"
    
  res1_en <- "<br>
             <table height=80% width=90%>
                 <tbody><tr>
                   <td><img src='cancer_gr_trim.PNG' width='65' height='65' alt='red face'></td><td>"
    
  res2_en <- "% chance that the biopsy is negative for clinical significant cancer,</td>
                 </tr><tr>
                 <td class='center'><img src='cancer_yel_trim.PNG' width='65' height='65' alt='yellow face'></td><td>"
    
  res3_en <- "% chance of lower-graded clinical significant cancer (ISUP=2),</td>
      </tr><tr>
        <td class='center'><img src='cancer_red_trim.PNG' width='65' height='65' alt='virus red'></td><td>"
    
  res4_en <- "% chance of agressive prostate cancer (ISUP>2).</td>
      </tr><tr> "
        
    
  res5_en <- "</tr><tr>
      <td colspan=2>Please consult your physician concerning these results.</td>"
  
  
  div_en <- "<div style='display:inline-block;height:100%'>"
  div_end = "</div>"
    
  htmlString <- paste0(res0_en,res1_en, risk[1],res2_en, risk[2],res3_en, 
                          risk[3],res4_en,res5_en,end)
  htmlString <-  paste0(start,div_en,htmlString,div_end)
  htmlString <- paste0(htmlString,"</td><td><table><tbody><tr>")
  counter = 1
    if(risk[1] > 0){
    for(i in 1:risk[1]){
        htmlString <-  paste0(htmlString,greenFace)
      if(counter %% 10 == 0 & counter != 100){
        htmlString <-  paste0(htmlString,"</tr><tr>")
      }
      counter <-  counter + 1
    }
  }
    if(risk[2] > 0){
    for(i in seq_len(risk[2])){
        htmlString <-  paste0(htmlString,yellowFace)
      if(counter %% 10 == 0 & counter != 100){
        htmlString <-  paste0(htmlString,"</tr><tr>")
      }
      counter <-  counter + 1
    }
  }
    if(risk[3] > 0){
    for(i in seq_len(risk[3])){
        htmlString <-  paste0(htmlString,redFace)
      if(counter %% 10 == 0 & counter != 100){
        htmlString <-  paste0(htmlString,"</tr><tr>")
      }
      counter <-  counter + 1
    }
    }
  htmlString <-  paste0(htmlString,"</table>")
  
  htmlString = paste0(htmlString,"</div>")
  htmlString  
}
  
    
















