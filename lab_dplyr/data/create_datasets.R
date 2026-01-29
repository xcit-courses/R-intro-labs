
library(tidyverse)

set.seed(42)

domain <- c("math", "german", 'french', "history", "biology")
test <- c("test_1", "test_2", "test_3")
measure <- c("score", "rt", "accuracy")
stats <- c("mean", "median", "sd", "iqr", "var")

vars <- c()
for (d in domain){
  for (t in test){
    for (m in measure){
      for (s in stats){
        var <- paste(d, t, m, s, sep = '_')
        vars <- c(vars, var)
      }
    }
  }
}


n_rows <- 200
n_cols <- length(vars)
df <- replicate(n_cols, rnorm(n_rows, 10, 3))
df <- data.frame(df)
names(df) <- vars


df <- df |> 
  mutate(is_positive = rbinom(n_rows, 1, 0.25), .before = 1) |> 
  mutate(gender = sample(c("male", "female", "non-binary", "other", "prefer not to say"), 
                         n_rows,
                         replace = TRUE,
                         prob = c(0.4, 0.4, 0.1, 0.05, 0.05)), .before = 1) |> 
  mutate(age = rnorm(n_rows, 20, sd = 3)) |> 
  mutate(subject_id = 1:n(), .before = 1) |> 
  mutate(NumberOfTVs = rbinom(n_rows, 3, 0.5))


# add duplicates
df_rep <- df[sample(n_rows, 10), ]
df <- bind_rows(df, df_rep)

# shuffle rows
df <- df |> 
  arrange(biology_test_1_score_sd)


## create a second table for joining
cheaters <- df |> 
  slice_sample(n=20, replace = FALSE) |> 
  select(subject_id) |> 
  distinct() |> 
  mutate(cheated_on_test = TRUE)




## create a third table for joining
library_visitors <- df |> 
  slice_sample(n=120, replace = FALSE) |> 
  select(subject_id) |> 
  distinct() |> 
  mutate(visited_library = as.logical(rbinom(n(), 1, 0.75)))




write_csv(df, file = 'school_grades.csv')
write_csv(cheaters, file = 'cheaters.csv')
write_csv(library_visitors, file = 'library_visitors.csv')
