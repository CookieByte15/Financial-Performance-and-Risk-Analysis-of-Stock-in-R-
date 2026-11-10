# References and Data Sources

This file contains the dataset source, background references and tools used for the IBND Financial Performance and Risk Analysis project.

## 1. Dataset

- **Dataset:** Historical IBND price data
- **Source:** Kaggle
- **Dataset URL:** [Stock Market Dataset (search for IBND)](https://www.kaggle.com/datasets/jacksoncrow/stock-market-dataset)
- **Data period:** 20 May 2010 – 1 April 2020
- **Accessed:** November 2026

The dataset contains historical trading information, including opening price, highest price, lowest price, closing price, adjusted closing price and trading volume.

## 2. ETF Information

- **SPDR Bloomberg International Corporate Bond ETF (IBND):** [State Street Global Advisors](https://www.ssga.com/us/en/intermediary/etfs/spdr-bloomberg-international-corporate-bond-etf-ibnd)
This source provides information about the ETF, its investment objective and fund characteristics.

## 3. Historical Market Context

- **Office of Financial Research – The Sell-off in Long-term Bonds (21 May 2015)**
  - https://www.financialresearch.gov/financial-markets-monitor/2015/05/21/the-sell-off-in-long-term-bonds/
  - Discusses the 2015 sell-off in long-term European bonds and its effects on other major bond markets.

- **Bank for International Settlements – Volatility and Evaporating Liquidity During the Bund Tantrum (September 2015)**
  - https://www.bis.org/publications/volatility-and-evaporating-liquidity-during-bund-tantrum
  - Explains the sharp increase in bond-market volatility and liquidity pressures during May–June 2015.

- **European Central Bank – Financial Stability Review, May 2020**
  - https://www.ecb.europa.eu/press/financial-stability-publications/fsr/html/ecb.fsr202005~1b75555f66.en.html
  - Discusses financial-market stress, corporate bond spreads and liquidity conditions during the COVID-19 disruption.

- **U.S. Securities and Exchange Commission – U.S. Credit Markets: Interconnectedness and the Effects of the COVID-19 Economic Shock**
  - https://www.sec.gov/files/us-credit-markets_covid-19_report.pdf
  - Examines the impact of the COVID-19 shock on corporate bond trading, transaction costs, liquidity and credit spreads.

- **Federal Reserve – The Corporate Bond Market Crises and the Government Response (7 October 2020)**
  - https://www.federalreserve.gov/econres/notes/feds-notes/the-corporate-bond-market-crises-and-the-government-response-20201007.html
  - Explains the corporate bond market liquidity crisis and policy responses during March 2020.

## 4. Tools and Documentation

### R

R was used for data processing, statistical calculations and visualisation.

- Official website: https://www.r-project.org/

### RStudio

RStudio was used as the development environment for writing and running the analysis.

- Official website: https://posit.co/download/rstudio-desktop/

### dplyr

The `dplyr` package was used for data manipulation, grouping, filtering and summarisation.

- Documentation: https://dplyr.tidyverse.org/

### ggplot2

The `ggplot2` package was used to create the graphs and visualisations.

- Documentation: https://ggplot2.tidyverse.org/

## 5. Installation and Setup

The project uses Base R along with the `dplyr` and `ggplot2` packages.

If the packages are not already installed, open the RStudio Console and run:

```r
install.packages("dplyr")
install.packages("ggplot2")
```

Once installed, load the packages before running the analysis:

```r
library(dplyr)
library(ggplot2)
```

Packages only need to be installed once. They must be loaded again whenever a new R session is started.

## 6. Saving Graphs and Tables

The project saves its visualisations and processed data in separate output folders.

### Create Output Folders

Run the following commands from the project root directory:

```r
dir.create("outputs", showWarnings = FALSE)

dir.create(
  "outputs/figures",
  showWarnings = FALSE,
  recursive = TRUE
)

dir.create(
  "outputs/tables",
  showWarnings = FALSE,
  recursive = TRUE
)
```

### Saving Graphs

Graphs created using ggplot2 can be saved as PNG files using `ggsave()`.

Example:

```r
ggsave(
  "outputs/figures/01_price_trend.png",
  plot = p1,
  width = 10,
  height = 6,
  dpi = 300
)
```

Change the filename and plot object to save the remaining graphs.

The `width` and `height` values specify the image dimensions, while `dpi = 300` provides high-resolution output.

### Saving Tables

Processed datasets and summary statistics can be exported as CSV files using `write.csv()`.

Example:

```r
write.csv(
  IBND,
  "outputs/tables/IBND_daily_analysis.csv",
  row.names = FALSE
)
```

Monthly returns can also be saved:

```r
write.csv(
  monthly_plot_data,
  "outputs/tables/IBND_monthly_returns.csv",
  row.names = FALSE
)
```

Summary statistics can be exported using:

```r
write.csv(
  summary_results,
  "outputs/tables/IBND_summary_statistics.csv",
  row.names = FALSE
)
```

### Output Locations

- `outputs/figures/` – Contains the generated PNG graphs.
- `outputs/tables/` – Contains the exported CSV files.

To check which files have been saved, run:

```r
list.files("outputs", recursive = TRUE)
```

Make sure the R working directory is set to the project's root folder before running the commands.

## 7. Project Implementation

All data cleaning, calculations, statistical analysis and visualisations were performed in R.

The project uses:

- Base R for calculations and statistical operations.
- dplyr for data manipulation.
- ggplot2 for data visualisation.

No additional external R packages are required for the analysis described in this project.

## 8. Copyright and Usage

Copyright © 2026. All rights reserved.

This repository is publicly available for viewing and educational reference. Reuse, modification, redistribution or commercial use of the original work requires prior written permission from the author.

The dataset and third-party references remain subject to their respective owners' terms and licences.
