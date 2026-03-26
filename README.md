# GBD_MR
# Global burden and causal architecture of CKD-attributable IHD

This repository provides all code and workflow necessary to reproduce the analyses presented in our study:

**“Global burden and causal architecture of chronic kidney disease–attributable ischemic heart disease: a global analysis with multi-ancestry Mendelian randomisation”**

---

## Study Overview

This study integrates:
- Global Burden of Disease (GBD) 2023 data
- Multi-ancestry GWAS summary statistics
- Mendelian randomisation (MR)
- Mediation and genetic correlation analyses (optional: LAVA)

to systematically investigate:
1. Temporal trends of CKD-attributable IHD burden  
2. Causal relationships between CKD and IHD  
3. Underlying biological pathways and mediators  

---

## Repository Structure

- `data/` – GWAS identifiers and processed datasets  
- `code/` – All analysis scripts (stepwise pipeline)  
- `results/` – Tables and figures used in the manuscript  
- `docs/` – Study design and workflow diagram  
- `reproducibility/` – Environment and one-click execution  

---

## Reproducibility

To fully reproduce the analysis:

### 1. Install required R packages
```r
source("code/00_setup/install_packages.R")
