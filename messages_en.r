# Messages and texts 

#####################################################
# Warning messanges (Output page)

warning_age_en = HTML("We are sorry, but we can not calculate the risk of prostate cancer. <br />
                        Age has to be between 30 and 90.")

warning_psa_en = HTML("We are sorry, but we can not calculate the risk of prostate cancer. <br />
                      Values below zero are not a valid.")

warning_volume_en = HTML("We are sorry, but we can not calculate the risk of prostate cancer. <br />
                          Volume has to over 10 ml.")

warning_overall_en = HTML("We are sorry, but we can not calculate the risk of prostate cancer.<br />
                        One or more charcateristics are missing.")


#####################################################
# Tooltips

tooltip_age_en = "Age needs to be between 30 and 90 years."

tooltip_psa_en = "This is the result, in nanograms per mililiter, of the PSA blood test. 0 is not a valid PSA value."


#tooltip_dre_en = "Digital Rectal Examination is a test performed by a health care professional in which a gloved finger is placed in the rectum to feel the surface of the prostate. It is normal if the prostate is smooth and soft. It is abnormal if an area of firmness or a nodule is noted."

tooltip_priobiop_en = "Past Negative Biopsy: One or more prior biopsies, all need to be negative."

tooltip_volume_en ="Prostate volume in [ml]. Volume needs to be bigger than 10."

tooltip_pirads_en = "This is the mpMRI v2.0 based PI-RADS score ranging from 1--5"


#####################################################


#####################################################
# More information tab (main page)

info_en = HTML("<h1>Information about calculator input</h1>
               <h4>Prostate Specific Antigen Level (PSA)</h4>
              <p>This is the result, in nanograms per mililiter, of the PSA blood test.
              PSA has to be above 0 [ng/ml]</p>
              <br>
              <h4>Prostate Specific Antigen Level (PSA)</h4>
              <p>Prostate volume in [ml]. Volume needs to be bigger than 10.<p>
              <br>
              <h4>Prior Prostate Biopsy</h4>
              <p>Past Negative Biopsy: One or more prior biopsies, all negative, no prior diagnosis of prostate cancer.</p>
              <br>
              <h4>Pi-RADS v2.1 score</h4>
              <p>MRI-based PI-RADS v2.1 score<p>
              <br>
              <p>Note: The Calculator is only applicable for persons without a previous diagnosis of prostate cancer.</p>
              <br>
               ")


#############
#Disclaimer 

disclaimer <- HTML("<p>This risk calculator was developed on a retrospective cohort
                   from a tertiary referral center. Consequently, disease prevalence
                   and case-mix may differ substantially from other clinical settings
                   (e.g., primary care or community hospitals), and predicted risks may not directly generalize.
                   In particular, the model is intended for patients undergoing diagnostic evaluation and should 
                   not be applied to patients with a prior positive prostate cancer diagnosis or prior definitive prostate cancer treatment.
                   External validation in independent cohorts is required before clinical use.<p>")

