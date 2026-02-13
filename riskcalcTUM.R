
####################################################################
####################################################################
# TUM 3-OUTCOME Multinomial Modell MRI - based
####################################################################
####################################################################
#PSA density =log2(PSA/Volume)
#Age=Age/10
#Prior_neg_biopsy ref. (no)  vs (yes)
#PIRADS in c(1,2,3,4,5) continious coded

#S1 = -3.8370941 + 0.8103653 PSA density + 0.2986000Age + 1.2361101 PIRADS - 0.9276499 Prior_neg_biopsy 
#S2 = -8.0333880 + 1.1205302 PSA density + 0.7245463Age + 1.7189986  PIRADS - 1.4745836 Prior_neg_biopsy 

#Risk of no csPCa = 1/[1 + exp(S1) + exp(S2)]
#Risk of ISUP=2 outcome  = exp(S1)/[1 + exp(S1) + exp(S2)]
#Risk of agPCa = exp(S2)/[1 + exp(S1) + exp(S2)]


risk = function(Age,PSA,Volume,PIRADS,Prior_neg_biopsy) {
  
  data <- c(1, log2(PSA/Volume), Age/10, PIRADS, Prior_neg_biopsy)
  
  coef <- matrix(c(-3.8370941, 0.8103653, 0.2986000, 1.2361101, -0.9276499,
                   -8.0333880, 1.1205302, 0.7245463, 1.7189986, -1.4745836),5,2)
  S1 <- coef[,1] %*%  data
  S2 <- coef[,2] %*%  data
  
  risk.no <- 1/(1+exp(S1)+exp(S2))
  risk.low <- exp(S1)/(1+exp(S1)+exp(S2))

  
  risk.no=round(risk.no * 100)
  risk.low=round(risk.low * 100)
  risk.high= 100-risk.no-risk.low 

  
  risk.outcome=cbind(risk.no,risk.low,risk.high)
  dimnames(risk.outcome)=list(NULL, c("Chance of no csPCa", "Risk of ISUP=2", 
                                      "Risk of agPCa"))
  return(risk.outcome)
}