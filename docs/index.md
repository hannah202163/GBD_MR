# Supplementary Materials: Multi-Ancestry Mendelian Randomization and Global Burden of Disease Analysis

Welcome to the supplementary materials for our study on the causal relationship between chronic kidney disease (CKD) and ischemic heart disease (IHD) using Mendelian Randomization across multiple ancestry groups.

## 📑 Contents

- [Study Workflow](#study-workflow)
- [GWAS Data Sources](#gwas-data-sources)
- [Mendelian Randomization Analysis](#mendelian-randomization-analysis)
- [Sensitivity Analyses](#sensitivity-analyses)
- [Global Burden of Disease Analysis](#global-burden-of-disease-analysis)
- [Results Summary](#results-summary)
- [Code Availability](#code-availability)
- [Data Availability](#data-availability)

---

## 🔬 Study Workflow

### Analysis Pipeline Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    MULTI-ANCESTRY MR ANALYSIS                   │
└─────────────────────────────────────────────────────────────────┘
                                │
                    ┌───────────┴───────────┐
                    │                       │
            ┌───────▼────────┐    ┌────────▼──────────┐
            │  GWAS Data     │    │   GBD Burden Data │
            │  (OpenGWAS,    │    │   (IHME,          │
            │   NHGRI-EBI,   │    │    vizhub)        │
            │   FinnGen)     │    │                   │
            └────────┬───────┘    └────────┬──────────┘
                     │                     │
            ┌────────▼──────────────────────▼─────────┐
            │  Data Harmonization & QC                 │
            │  - Remove ambiguous SNPs (A/T, G/C)     │
            │  - Ensure consistent allele encoding     │
            └────────┬──────────────────────────────────┘
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
    ┌────────┐ ┌──────────┐ ┌──────────┐
    │European│ │East Asian│ │ African  │
    │Ancestry│ │ Ancestry │ │American  │
    └────┬───┘ └────┬─────┘ └────┬─────┘
         │          │            │
         └──────────┼────────────┘
                    │
        ┌───────────▼────────────┐
        │ Two-Sample MR Analysis │
        │ - IVW                  │
        │ - MR-Egger            │
        │ - Weighted Median     │
        │ - Weighted Mode       │
        └───────────┬────────────┘
                    │
        ┌───────────▼────────────────────┐
        │    Sensitivity Analyses        │
        │ - Leave-One-Out               │
        │ - Steiger Filtering           │
        │ - MR-PRESSO Pleiotropy Test  │
        └───────────┬────────────────────┘
                    │
        ┌───────────▼────────────┐
        │  GBD Burden Analysis   │
        │ - Temporal Trends      │
        │ - Regional Variation   │
        │ - Attributable Burden  │
        └───────────┬────────────┘
                    │
        ┌───────────▼────────────┐
        │  Publication Results   │
        │ - Forest Plots         │
        │ - Scatter Plots        │
        │ - Funnel Plots         │
        │ - Summary Tables       │
        └────────────────────────┘
```

---

## 📊 GWAS Data Sources

Total **106 GWAS studies** across 4 ancestry groups:

| Ancestry | N Studies | Sample Size Range |
|----------|-----------|-------------------|
| European | 45 | 1,017 - 607,291 |
| East Asian | 30 | 2,219 - 165,436 |
| African American | 22 | 1,431 - 6,624 |
| Sub-Saharan African | 9 | 1,017 - 24,612 |

### Data Sources

- **OpenGWAS**: https://opengwas.io/
- **NHGRI-EBI GWAS Catalog**: https://www.ebi.ac.uk/gwas/
- **FinnGen**: https://www.finngen.fi/en
- **Pan-UKB**: https://pan.ukbb.broadinstitute.org/

---

## 🔍 Mendelian Randomization Analysis

### Methods

- **IVW** (Inverse Variance Weighted): Primary method, most powerful
- **MR-Egger**: Tests for pleiotropy, provides adjusted estimate
- **Weighted Median**: Robust if >50% of instruments are valid
- **Weighted Mode**: Non-parametric, resistant to outliers

### Quality Control

- F-statistic > 10 (strong instruments)
- MR-PRESSO global test p > 0.05
- Steiger filtering: R² exposure > R² outcome

---

## 📈 Sensitivity Analyses

- **Leave-One-Out**: Removes each SNP individually, re-estimates effect
- **Steiger Filtering**: Ensures causal direction (CKD → IHD)
- **MR-PRESSO**: Detects horizontal pleiotropy and outliers

---

## 🌍 Global Burden of Disease

### Metrics

| Metric | Definition |
|--------|-----------|
| **Death** | Death |

### Analysis

- Temporal trends (1994-2023)
- Regional variation
- CKD-attributable IHD burden

---

## 💻 Code Availability

**Repository**: https://github.com/hannah202163/GBD_MR

All analysis code is publicly available with full documentation.

### How to Reproduce

```bash
git clone https://github.com/hannah202163/GBD_MR.git
cd GBD_MR
Rscript code/00_setup/install_packages.R
Rscript code/02_mr_analysis/mr_main_analysis.R
```

See CODE_AVAILABILITY.txt for detailed instructions.

---

## 📥 Data Availability

### GWAS Data (All Public)
- OpenGWAS: https://opengwas.io/
- NHGRI-EBI: https://www.ebi.ac.uk/gwas/
- FinnGen: https://www.finngen.fi/en

### GBD Data (All Public)
- https://vizhub.healthdata.org/gbd-results/

### GWAS Study IDs
- See: data/gwas_id_list.csv

---

## 📜 License

MIT License - See LICENSE file

**Repository**: https://github.com/hannah202163/GBD_MR

Last Updated: 2026-03-27
