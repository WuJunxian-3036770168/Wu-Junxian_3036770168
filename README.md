# Card & Krueger (1994) Minimum Wage DID Replication
Course empirical assignment: replicate the classic difference-in-differences research.

## Project Overview
This project replicates the seminal study of Card & Krueger (1994), who use a difference-in-differences (DID) design to evaluate how a minimum wage increase affected employment in fast-food restaurants. The treatment group consists of restaurants in New Jersey, where the minimum wage was raised in 1992. The control group is restaurants in eastern Pennsylvania, where the minimum wage remained unchanged. The core research question is whether higher minimum wages reduce low-wage employment.

## Replication Process
1. **Data Preparation**: Load datasets stored in the `data/` folder. Separate cleaned datasets are prepared for table replication and figure generation.
2. **Descriptive Statistics**: Generate summary statistics for key variables of treatment and control groups before policy intervention.
3. **Baseline DID Regression**: Estimate the difference-in-differences specification to identify the average treatment effect of minimum wage hike on employment.
4. **Table & Figure Output**: Run Stata `.do` file for tables, run Python `ipynb` notebook for Figure 1. Export raw outputs.
5. **Result Polishing**: Raw regression results are generated directly by Stata. The raw output is formatted with AI for layout only. AI does **not** modify coefficients, standard errors, p-values or statistical findings. The polished table is converted to LaTeX code for final presentation.

## File Description
- `code/`: Contains all executable scripts
  - `table2 3 4replication+Independent Extension.do`: Stata script for replicating Table 2,3,4 and independent extension analysis
  - `Figure1-replication.ipynb`: Jupyter notebook to reproduce Figure 1
- `data/`: Contains raw and cleaned data files
  - `data_raw/`: Folder storing raw source data
  - `cardkrueger_clean(table2 3 4+Independent Extension).dta`: Cleaned dataset for table replication
  - `cardkrueger_clean (figrue1).dta`: Cleaned dataset dedicated for Figure 1 plotting
- Root directory files
  - `AI-use Disclosure.md`: Statement for AI usage
  - `Empirical report 6067.pdf`: Full empirical report
  - `figure.pdf`: Exported figure output
  - `table2 3 4replication+Independent Extension.pdf`: Exported table results
  - `README.md`: Project introduction

## How to Run
1. Open `table2 3 4replication+Independent Extension.do` inside the `code/` folder in Stata for table replication. This script uses the dedicated cleaned dataset for table reproduction.
2. Open `Figure1-replication.ipynb` in Jupyter Notebook to reproduce Figure 1. This notebook uses a separate cleaned dataset prepared exclusively for figure plotting.
3. Adjust the local file path at the top of scripts to match your working directory. Different cleaned datasets are used separately to replicate tables and figures.
4. Run the script sequentially. Raw table and figure outputs will be generated. After raw results are produced, AI and LaTeX are applied for dual processing to finalize the tables.

## Notes on Table Generation
Raw regression results are generated directly by Stata.
The raw output is formatted and aligned with AI for layout adjustment only. AI does **not** modify any regression coefficients, standard errors, p-values or statistical conclusions. After formatting, the table is converted into LaTeX code for final typesetting.

## Reference
Card, D., & Krueger, A. B. (1994). Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New Jersey and Pennsylvania. *The American Economic Review*, 84(4), 772–793.
