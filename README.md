# IBND – Financial Performance and Risk Analysis

An R programming project analysing the historical performance, returns and volatility of the **SPDR Bloomberg International Corporate Bond ETF (IBND)**.

The project focuses on understanding the behaviour of a financial instrument over time, particularly during periods of market instability.

## About the Project

The project analyses IBND historical data from May 2010 to April 2020.

Some of the topics explored in this project are:

- Historical adjusted-price trends
- Daily and cumulative returns
- 20-day and 50-day moving averages
- Rolling and annualized volatility
- Maximum drawdown
- Monthly return analysis
- Historical market movements during 2015 and 2020

## Tools Used

- R
- Base R
- dplyr
- ggplot2

## Key Findings

| Metric | Result |
|---|---:|
| Average adjusted price | $32.51 |
| Mean daily return | 0.0059% |
| Daily return standard deviation | 0.5825% |
| Median annualized volatility | 8.15% |
| Maximum annualized volatility | 26.44% |
| Maximum drawdown | -21.72% |
| Best daily return | +2.69% |
| Worst daily return | -3.46% |

### Key Observations

- IBND experienced relatively moderate rolling volatility during much of the observed period.
- Volatility increased significantly during March 2020.
- The largest drawdown in the dataset was approximately 21.72%.
- March 2020 recorded the worst monthly return in the preliminary monthly analysis.
- The 2015 period also showed notable market movements alongside broader global bond-market volatility and LIBOR-related regulatory developments. A direct causal relationship was not established.

## Visualizations

### Historical Price and Moving Averages

<img width="3000" height="1800" alt="02_moving_averages" src="https://github.com/user-attachments/assets/8899e191-b919-4499-8c81-24acb1c78094" />

### Rolling Annualized Volatility

<img width="3000" height="1800" alt="05_rolling_volatility" src="https://github.com/user-attachments/assets/12703501-f9db-43cb-9e04-ecba33d86ba4" />

### Monthly Returns

<img width="3600" height="1800" alt="06_monthly_returns" src="https://github.com/user-attachments/assets/596561c4-13be-4a75-a1dc-333d5079ea6d" />

### Historical Drawdown

<img width="3000" height="1800" alt="07_drawdown" src="https://github.com/user-attachments/assets/078a72ed-6647-40da-99f8-c3b4072c91cf" />

## Repository Structure

```text
IBND-Financial-Analysis/
│
├── README.md
├── RESEARCH.md
├── references.md
│
├── R/
│   └── IBND_analysis.R
│
├── data/
│   ├── raw/
│   └── processed/
│
└── outputs/
    ├── figures/
    └── tables/
```

## Running the Project

1. Clone or download this repository.
2. Download the IBND dataset from the source mentioned in `references.md`.
3. Place the CSV inside `data/raw/`.
4. Open `IBND_analysis.R` in RStudio.
5. Install the required packages if necessary: `dplyr` and `ggplot2`.
6. Run the script to reproduce the analysis and visualizations.

## Detailed Analysis

For the complete methodology, calculations, observations, limitations and conclusions, refer to RESEARCH.md included in this repository. 

## Learning Outcomes

This project provided practical experience in financial time-series analysis using R, including return calculations, trend analysis, volatility estimation and drawdown analysis.

It also serves as an introduction to financial analytics and quantitative research.

## Disclaimer

This project is for educational and research purposes only. It is not investment advice.

---

**Copyright © 2026. All rights reserved.**

This repository is publicly available for viewing and educational reference. Reuse, modification, redistribution or commercial use of the original work requires prior written permission from the author.
