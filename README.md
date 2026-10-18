# Card & Krueger (1994) Minimum Wage DID Replication
Course empirical assignment: replicate the classic difference-in-differences research.

## Project Overview
This project replicates Card & Krueger (1994), which estimates the impact of minimum wage rise on employment of fast-food restaurants in New Jersey and Pennsylvania.

## File Structure


├── data/
│   └── card_krueger_raw.dta
├── code/
│   ├── did_code_comments.do
│   └── did_code_clean.do
├── output/
│   ├── table2_raw.rtf
│   └── table2_final.tex
├── report/
│   └── assignment_report.pdf
└── README.md



## How to Run
1. Open `did_code_comments.do` or `did_code_clean.do` in Stata.
2. Adjust the local file path at the top of the do-file to your working directory.
3. Run the entire do-file sequentially.
4. Raw regression table outputs will be saved to the `output` folder.

## Notes on Table Generation
Raw regression results of Table 2 are generated directly by Stata.
The raw output is formatted and aligned with AI for layout adjustment only. AI does **not** modify any regression coefficients, standard errors, p-values or statistical conclusions. After formatting, the table is converted into LaTeX code for final typesetting.

## Reference
Card, D., & Krueger, A. B. (1994). Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New Jersey and Pennsylvania. *The American Economic Review*, 84(4), 772-793.
```
