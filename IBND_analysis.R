#load packages once again (just in case)
library(dplyr)
library(ggplot2)


#import data set (i copied path, anyone else might have to change this line)
IBND <- read.csv("/Users/aanwikareddy/Downloads/archive/etfs/IBND.csv")


#inspect ibnd data 
View(IBND)
str(IBND)
summary(IBND)
dim(IBND)


#just a bit simplification (proper formatting for my ease)
IBND$Date <- as.Date(IBND$Date)

IBND <- IBND %>%
  arrange(Date)


#inspect first and last observed data 
head(IBND)
tail(IBND)
str(IBND)
summary(IBND)
dim(IBND)


#check missing values in each column (nightmare!)
colSums(is.na(IBND))


#check duplicate dates 
sum(duplicated(IBND$Date))


#calc daily percentage returns using adjusted closing prices
IBND$Daily_Return <- c(
  NA,
  diff(IBND$Adj.Close) / head(IBND$Adj.Close, -1) * 100
)


#cumulative percentage returns from 1st observation
IBND$Cumulative_Return <- (
  IBND$Adj.Close / IBND$Adj.Close[1] - 1
) * 100


#inspect calculated returns
head(
  IBND[, c("Date", "Adj.Close", "Daily_Return", "Cumulative_Return")]
)


#summary of daily returns
summary(IBND$Daily_Return)


#summary of cumulative returns
summary(IBND$Cumulative_Return)


#20 days moving average
IBND$MA_20 <- stats::filter(
  IBND$Adj.Close,
  rep(1 / 20, 20),
  sides = 1
)


#50 days moving average
IBND$MA_50 <- stats::filter(
  IBND$Adj.Close,
  rep(1 / 50, 50),
  sides = 1
)


#inspect moving avg values
head(IBND[, c("Date", "Adj.Close", "MA_20", "MA_50")], 55)


#plot adjusted price with moving averages
p2 <- ggplot(IBND, aes(x = Date)) +
  geom_line(aes(y = Adj.Close, color = "Adjusted Close")) +
  geom_line(aes(y = MA_20, color = "20-Day MA")) +
  geom_line(aes(y = MA_50, color = "50-Day MA")) +
  geom_vline(
    xintercept = as.Date("2015-05-01"),
    linetype = "dashed",
    color = "darkorange"
  ) +
  geom_vline(
    xintercept = as.Date("2020-03-01"),
    linetype = "dashed",
    color = "firebrick"
  ) +
  labs(
    title = "IBND: Adjusted Price and Moving Averages",
    subtitle = "Historical market periods highlighted",
    x = "Date",
    y = "Adjusted Price (USD)",
    color = "Legend",
    caption = paste(
      "May 2015: Global bond-market sell-off.",
      "March 2020: COVID-19 market disruption.",
      "Markers provide context, not proof of causation."
    )
  ) +
  theme_minimal()


#display graph
p2


#adjusted closing price statistics
price_stats <- IBND %>%
  summarise(
    Mean = mean(Adj.Close),
    Median = median(Adj.Close),
    Standard_Deviation = sd(Adj.Close),
    Minimum = min(Adj.Close),
    Maximum = max(Adj.Close),
    Range = max(Adj.Close) - min(Adj.Close)
  )


#display stats
print(price_stats)


#daily return statistics
return_stats <- IBND %>%
  summarise(
    Mean_Return = mean(Daily_Return, na.rm = TRUE),
    Median_Return = median(Daily_Return, na.rm = TRUE),
    SD_Return = sd(Daily_Return, na.rm = TRUE),
    Minimum_Return = min(Daily_Return, na.rm = TRUE),
    Maximum_Return = max(Daily_Return, na.rm = TRUE)
  )

#display stats 
print(return_stats)


#calculate 20 days rolling standard deviation of daily returns
IBND$Rolling_Volatility <- NA_real_

for (i in 21:nrow(IBND)) {
  IBND$Rolling_Volatility[i] <- sd(
    IBND$Daily_Return[(i - 19):i]
  )
}


#annualize volatility (daily returns is in percentage, so don't convert again)
IBND$Annualized_Volatility <-
  IBND$Rolling_Volatility * sqrt(252)


#summary of annualized volatility
summary(IBND$Annualized_Volatility)


#plot rolling annualized volatility
p5 <- ggplot(
  IBND,
  aes(x = Date, y = Annualized_Volatility)
) +
  geom_line(color = "steelblue") +
  labs(
    title = "IBND: 20-Day Rolling Annualized Volatility",
    x = "Date",
    y = "Annualized Volatility (%)"
  ) +
  theme_minimal()


#display graph
p5


#identify the five highest volatility observations
max_volatility <- IBND %>%
  filter(!is.na(Annualized_Volatility)) %>%
  arrange(desc(Annualized_Volatility)) %>%
  select(Date, Adj.Close, Daily_Return, Annualized_Volatility)

head(max_volatility, 5)


#identify the five worst daily returns
worst_days <- IBND %>%
  arrange(Daily_Return) %>%
  select(Date, Adj.Close, Daily_Return) %>%
  head(5)

worst_days


#calculate the running max adjusted price
IBND$Running_Peak <- cummax(IBND$Adj.Close)


#calculate drawdown percentage
IBND$Drawdown <- (
  (IBND$Adj.Close / IBND$Running_Peak) - 1
) * 100


#find max drawdown
max_drawdown <- min(IBND$Drawdown)

print(max_drawdown)


#identify the date of max drawdown
trough_index <- which.min(IBND$Drawdown)
trough_date <- IBND$Date[trough_index]


#identify the previous peak
peak_index <- which.max(
  IBND$Adj.Close[1:trough_index]
)

peak_date <- IBND$Date[peak_index]


#display results
print(paste("Peak Date:", peak_date))
print(paste("Trough Date:", trough_date))
print(paste("Maximum Drawdown:", max_drawdown, "%"))


#plot historical drawdown
p7 <- ggplot(IBND, aes(x = Date, y = Drawdown)) +
  geom_line(color = "firebrick") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(
    title = "IBND Historical Drawdown",
    x = "Date",
    y = "Drawdown (%)"
  ) +
  theme_minimal()

p7


#extract year and month
IBND$Month <- format(IBND$Date, "%Y-%m")


#calculate month-end adjusted prices
monthly_data <- IBND %>%
  group_by(Month) %>%
  summarise(
    Month_End_Price = last(Adj.Close),
    .groups = "drop"
  )


#calculate monthly percentage returns
monthly_data <- monthly_data %>%
  mutate(
    Monthly_Return = (
      Month_End_Price / lag(Month_End_Price) - 1
    ) * 100
  )


#convert month into a proper Date value for plotting
monthly_data$Month_Date <- as.Date(
  paste0(monthly_data$Month, "-01")
)


#inspect monthly data
head(monthly_data, 10)


#exclude incomplete April 2020 observation and the first month which doesn't have any preceding month for return calculations
monthly_complete <- monthly_data %>%
  filter(
    Month != "2020-04",
    !is.na(Monthly_Return)
  )


#summary of complete-month returns
summary(monthly_complete$Monthly_Return)


#avg monthly return
mean(monthly_complete$Monthly_Return)


#standard deviation of monthly returns
sd(monthly_complete$Monthly_Return)


#5 best months
best_months <- monthly_complete %>%
  arrange(desc(Monthly_Return)) %>%
  head(5)

print(best_months)


#5 worst months
worst_months <- monthly_complete %>%
  arrange(Monthly_Return) %>%
  head(5)

print(worst_months)


#SUMMARY, FINALLY!!!
summary_results <- data.frame(
  Metric = c(
    "Mean Adjusted Price",
    "Median Adjusted Price",
    "Price Standard Deviation",
    "Mean Daily Return",
    "Median Daily Return",
    "Daily Return Standard Deviation",
    "Median Annualized Volatility",
    "Mean Annualized Volatility",
    "Maximum Annualized Volatility",
    "Maximum Drawdown"
  ),
  Value = c(
    mean(IBND$Adj.Close),
    median(IBND$Adj.Close),
    sd(IBND$Adj.Close),
    mean(IBND$Daily_Return, na.rm = TRUE),
    median(IBND$Daily_Return, na.rm = TRUE),
    sd(IBND$Daily_Return, na.rm = TRUE),
    median(IBND$Annualized_Volatility, na.rm = TRUE),
    mean(IBND$Annualized_Volatility, na.rm = TRUE),
    max(IBND$Annualized_Volatility, na.rm = TRUE),
    min(IBND$Drawdown)
  )
)

print(summary_results)


#visualssss 
#these graphs were already generated: moving avg graph (p2), volatility graph (p5), drawdown graph (p7)


#historical adjusted price 
p1 <- ggplot(IBND, aes(x = Date, y = Adj.Close)) +
  geom_line(color = "steelblue") +
  labs(
    title = "IBND Historical Adjusted Price",
    x = "Date",
    y = "Adjusted Price (USD)"
  ) +
  theme_minimal()


#display graph
p1


#daily return distribution
p3 <- ggplot(
  IBND %>% filter(!is.na(Daily_Return)),
  aes(x = Daily_Return)
) +
  geom_histogram(
    bins = 50,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Distribution of IBND Daily Returns",
    x = "Daily Return (%)",
    y = "Frequency"
  ) +
  theme_minimal()


#display graph
p3


#daily returns over time
p4 <- ggplot(IBND, aes(x = Date, y = Daily_Return)) +
  geom_line(color = "steelblue") +
  geom_hline(
    yintercept = 0,
    linetype = "dashed",
    color = "red"
  ) +
  labs(
    title = "IBND Daily Returns Over Time",
    x = "Date",
    y = "Daily Return (%)"
  ) +
  theme_minimal()


#display graph
p4


#monthly returns (complete months only)
monthly_plot_data <- monthly_complete

p6 <- ggplot(
  monthly_plot_data,
  aes(
    x = Month_Date,
    y = Monthly_Return,
    fill = Monthly_Return >= 0
  )
) +
  geom_col() +
  scale_fill_manual(
    values = c(
      "TRUE" = "seagreen3",
      "FALSE" = "firebrick2"
    ),
    guide = "none"
  ) +
  scale_x_date(
    date_breaks = "1 year",
    date_labels = "%Y"
  ) +
  labs(
    title = "IBND Monthly Returns",
    x = "Year",
    y = "Monthly Return (%)"
  ) +
  theme_minimal()


#display graph
p6


#historical trading volume
p8 <- ggplot(IBND, aes(x = Date, y = Volume)) +
  geom_line(color = "steelblue") +
  labs(
    title = "IBND Historical Trading Volume",
    x = "Date",
    y = "Trading Volume"
  ) +
  theme_minimal()


#display graph
p8


#graph and table export commands are intentionally not included (refer to REFERENCES.md for instructions on saving outputs)