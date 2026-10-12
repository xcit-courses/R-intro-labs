
# Run this script from the lab_tidy_data/ folder; it writes datasets/date_example.RData
library(dplyr)

# English month names in date1, whatever the computer's language
invisible(Sys.setlocale("LC_TIME", "C"))

# Define your date range
start_date <- as.Date("1900-01-01")
end_date <- as.Date("2026-01-01")

# Number of samples
# 16 is the largest n for which the smallest gap (d, below) is at least one day,
# so the dates stay distinct once rounded to whole days
n <- 16
rate <- (seq(from=1, to=0.2, length.out = n))

# Calculate the base interval
# With doubling distances, the total span is d * (2^0 + 2^1 + 2^2 + ... + 2^(n-2))
# which equals d * (2^(n-1) - 1)
total_distance <- as.numeric(end_date - start_date)
d <- total_distance / (2^(n-1) - 1)

i <- 0:(n-1)
# round to whole days: a Date with a fractional part prints as the day before
sampled_dates <- as.Date(round(as.numeric(rev(end_date - d * (2^i - 1)))))


dd <- data.frame(date = sampled_dates, rate = rate)


dd <- dd |>
  mutate(
    date1 = format(date, "%d %B %Y"),
    date2 = as.character(date),
    date3 = date,
    .before = rate
  ) |>
  select(-date)

date_example <- dd
save(date_example , file = "datasets/date_example.RData")
