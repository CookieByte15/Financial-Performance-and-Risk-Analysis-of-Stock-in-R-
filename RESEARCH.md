# IBND – Financial Performance and Risk Analysis

## 1. Introduction

This project analyses the historical financial performance and risk characteristics of the SPDR Bloomberg International Corporate Bond ETF (IBND) using R.

The main objective is to understand how the ETF's price, returns, volatility and drawdowns changed over time. The analysis also explores how periods of market instability are reflected in its historical data.

The project uses historical data from May 2010 to April 2020.

## 2. Dataset Overview

The dataset contains historical trading information for IBND.

- **Observations:** 2,484
- **Variables:** 7
- **Start date:** 20 May 2010
- **End date:** 1 April 2020
- **Missing values:** None found
- **Duplicate dates:** None found

The dataset contains the following variables:

- Date – Trading date
- Open – Opening price
- High – Highest price during the trading session
- Low – Lowest price during the trading session
- Close – Closing price
- Adj Close – Adjusted closing price
- Volume – Number of units traded

Adjusted closing prices were used for return calculations because they account for distributions and other adjustments represented in the historical price series.

## 3. Tools and Technologies

The project was completed using:

- R
- RStudio
- Base R
- dplyr – Data manipulation and summarisation
- ggplot2 – Data visualisation

## 4. Methodology

The analysis was carried out in several stages.

### 4.1 Data Preparation

- Imported the historical CSV dataset into R.
- Converted the Date column into date format.
- Checked the dataset for missing values and duplicate dates.
- Examined the structure and summary statistics of the variables.
- Used adjusted closing prices for the return and performance calculations.

### 4.2 Daily Returns

Daily percentage returns were calculated using consecutive adjusted closing prices.

The calculation measures the percentage change in adjusted price from one trading day to the next.

### 4.3 Cumulative Returns

Cumulative returns were calculated to understand the overall percentage change in adjusted price relative to the first observation.

### 4.4 Moving Averages

Two moving averages were calculated:

- 20-day moving average
- 50-day moving average

These were used to observe short-term and longer-term price trends and smooth out daily price fluctuations.

### 4.5 Volatility Analysis

Daily returns were used to calculate rolling volatility over a 20-trading-day window.

Annualized volatility was estimated by multiplying the rolling daily standard deviation by the square root of 252, the approximate number of trading days in a year.

### 4.6 Maximum Drawdown

Maximum drawdown was calculated by comparing the adjusted closing price with its previous running maximum.

This measures the largest percentage decline from a previous peak to a subsequent trough during the observation period.

### 4.7 Monthly Returns

Monthly returns were calculated using month-end adjusted closing prices.

The incomplete April 2020 observation was excluded from complete-month comparisons and visualisation.

## 5. Visualisations Used

Different graph types were selected depending on the variable being analysed.

- **Historical Adjusted Price – Line Graph:** Shows the movement of IBND's adjusted closing price over time.
- **Moving Averages – Line Graph:** Compares adjusted closing prices with the 20-day and 50-day moving averages.
- **Daily Returns – Histogram:** Displays the distribution and frequency of daily percentage returns.
- **Daily Returns Over Time – Time-Series Line Graph:** Shows daily return fluctuations and positive and negative movements.
- **Rolling Volatility – Line Graph:** Displays changes in annualized volatility over time.
- **Monthly Returns – Bar Graph:** Compares monthly returns and highlights positive and negative months.
- **Maximum Drawdown – Area Graph:** Shows the percentage decline from the previous running price peak.
- **Trading Volume – Line Graph:** Displays changes in trading volume throughout the observation period.

## 6. Results and Analysis

### 6.1 Adjusted Price Analysis

The adjusted closing price statistics were:

- Mean: 32.51
- Median: 32.59
- Standard deviation: 1.96
- Minimum: 26.44
- Maximum: 36.94
- Range: 10.50

The mean and median are relatively close, indicating that the average adjusted price was not substantially different from the middle observation.

### 6.2 Daily Return Analysis

Daily return statistics:

- Mean daily return: 0.0059%
- Median daily return: 0%
- Standard deviation: 0.5825%
- Highest daily return: +2.69%
- Lowest daily return: -3.46%

The average daily return was close to zero, while the standard deviation indicates that daily price movements varied around that average.

### 6.3 Cumulative Return Analysis

The cumulative return observations had the following summary:

- Minimum: -4.34%
- First quartile: 11.97%
- Median: 17.91%
- Mean: 17.61%
- Third quartile: 22.28%
- Maximum: 33.64%

These figures describe the distribution of cumulative returns across the available observations. The mean of these observations should not be interpreted as the annual return or the final holding-period return.

### 6.4 Moving Average Analysis

The 20-day and 50-day moving averages were used to identify broader price trends.

- The 20-day moving average responds more quickly to recent price changes.
- The 50-day moving average provides a smoother view of longer-term price movement.
- Comparing both averages with the adjusted closing price helps identify changes in the direction and momentum of the price series.

### 6.5 Volatility Analysis

Annualized volatility was calculated using a 20-trading-day rolling standard deviation.

Summary statistics:

- Minimum: 3.47%
- First quartile: 6.75%
- Median: 8.15%
- Mean: 8.68%
- Third quartile: 10.30%
- Maximum: 26.44%

The highest volatility observations occurred in late March and early April 2020.

This indicates that IBND experienced a significant increase in price fluctuations towards the end of the dataset.

### 6.6 Maximum Drawdown Analysis

The maximum drawdown during the observation period was approximately **-21.72%**.

- Previous peak date: 6 May 2014
- Trough date: 19 March 2020

This represents the largest observed peak-to-trough decline in the adjusted closing price during the dataset period.

The dataset ends on 1 April 2020, so it does not provide enough information to analyse the subsequent recovery.

### 6.7 Monthly Return Analysis

Monthly returns were calculated using month-end adjusted closing prices.

The analysis compares monthly performance to identify periods of stronger positive and negative returns.

March 2020 recorded a particularly large negative monthly return in the initial analysis. The incomplete April 2020 observation was excluded from the monthly return graph.

## 7. Historical Market Context

### 7.1 2015 Bond Market Movements

The dataset shows price movements around 2015, a period that also experienced significant developments in global bond markets.

The 2015 bond-market sell-off and LIBOR-related regulatory developments provide useful historical context for understanding the financial environment during this period.

However, the available IBND price data does not establish that LIBOR-related events directly caused the ETF's price movements. A separate event-study analysis would be needed to investigate such a relationship.

### 7.2 March 2020 Market Disruption

The sharp increase in volatility around March 2020 coincided with the global financial-market disruption associated with the COVID-19 pandemic.

The period saw considerable uncertainty and stress across financial markets.

The IBND dataset reflects substantial price fluctuations during this period. However, the price data alone cannot identify the exact contribution of interest rates, credit spreads, liquidity conditions or other market factors.

## 8. Limitations

- The dataset covers only the period from May 2010 to April 2020.
- It does not include more recent market conditions.
- April 2020 is an incomplete month in the dataset.
- Historical price data alone cannot establish the causes of market movements.
- The analysis does not include benchmark comparisons or detailed macroeconomic variables.
- Annualized volatility is an estimate based on historical daily returns and does not guarantee future volatility.

## 9. Future Scope

The project can be extended in several ways:

- Compare IBND with other international bond ETFs.
- Study the relationship between interest rates and bond ETF returns.
- Examine the relationship between credit spreads and volatility.
- Perform event studies around major financial-market events.
- Calculate additional risk measures such as Value at Risk (VaR).
- Extend the analysis using more recent historical data.

## 10. Conclusion

This project explored the historical financial performance and risk characteristics of IBND using R.

The analysis covered adjusted prices, daily and cumulative returns, moving averages, rolling volatility, maximum drawdown and monthly returns.

One of the most notable observations was the increase in volatility during March 2020, alongside a maximum observed drawdown of approximately 21.72% over the dataset period.

Overall, the project provided practical experience in financial data analysis, statistical calculations and visualisation using R.

## Disclaimer

This project is intended for educational and analytical purposes only. It does not constitute financial or investment advice. The findings are based on historical data and should not be used as a guarantee of future performance.

---

## Visualisations

The generated graphs are stored in `outputs/figures/`.

<img width="3000" height="1800" alt="08_trading_volume" src="https://github.com/user-attachments/assets/f26ba912-0fac-4055-9379-20d48f3a3e24" />
<img width="3000" height="1800" alt="07_drawdown" src="https://github.com/user-attachments/assets/86b280b3-b71c-43df-8099-b4624490ebef" />
<img width="3600" height="1800" alt="06_monthly_returns" src="https://github.com/user-attachments/assets/cf68bc84-1dbd-4298-af89-b5b730f0df55" />
<img width="3000" height="1800" alt="05_rolling_volatility" src="https://github.com/user-attachments/assets/92f480dd-79e7-4079-8f21-0903a93223fa" />
<img width="3000" height="1800" alt="04_returns_over_time" src="https://github.com/user-attachments/assets/bbef7189-5811-4f65-bd2c-1ca6f0b8c6a1" />
<img width="3000" height="1800" alt="03_daily_returns" src="https://github.com/user-attachments/assets/00b6012d-8d0e-400d-a83b-f9f338679c40" />
<img width="3000" height="1800" alt="02_moving_averages" src="https://github.com/user-attachments/assets/9c500c90-b486-4b57-9e11-6b9c033a55c0" />
<img width="3000" height="1800" alt="01_price_trend" src="https://github.com/user-attachments/assets/50a195f1-4225-4f66-876a-f3c2b0d22bb9" />
