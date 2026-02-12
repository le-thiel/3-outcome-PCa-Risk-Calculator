# 3-outcome PCa Risk Calculator (R Shiny Prototype)

An R Shiny prototype for MRI-based prostate cancer risk prediction using a **3-outcome multinomial logistic regression** model:
**no-csPCa (ISUP < 2)**, **ISUP = 2**, and **aggressive PCa (agPCa; ISUP > 2)**. 

Developed as part of my **B.Sc. thesis in Mathematics** at the Technical University of Munich (TUM) in collaboration with a tertiary urology center in Munich

---

## Highlights
- Interactive **R Shiny** risk calculator prototype (runs locally) 
- **Interpretable baseline model**: multinomial logistic regression with clinically meaningful outcome groups 
- Internal validation via **8-fold cross-validation** (primary) and an additional **train/test split** for comparability with previous work 
- Evaluation focused on **discrimination (ROC/AUC)** and **calibration** in an internal validation setting 

---

## Project context & limitations (important)
This repository does not include any proprietary clinical dataset. The original dataset is legally restricted and cannot be shared.

**Important:** This is a research prototype developed on a limited cohort.
After applying exclusion criteria, the analytical cohort comprised 677 patients, with 600 complete cases available for the final model after excluding missing values. 

Predictive performance was stable in internal validation (AUC for agPCa discrimination ≈ 0.78, depending on the internal evaluation approach). 

This tool is not a certified medical device and must not be used for clinical decision-making.
Due to the tertiary-care / higher-risk cohort characteristics and the limited effective sample size, results should be interpreted with caution.
External validation is required before any routine clinical use. 

