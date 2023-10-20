library(tidyverse)




# Setup -------------------------------------------------------------------

theme_set(theme_minimal())

temp <- tempdir()

unzip("./data/crimes.zip", exdir = temp)

column_names <- c("ID", "Date", "IUCR", "Primary Type","Description",
                  "Location Description", "Arrest", "Domestic",
                  "District", "Community Area")



# Import and Clean Data ---------------------------------------------------

crimes <- 
  read_csv(fs::path(temp, "crimes.csv")) |> 
  select(all_of(column_names)) |> 
  janitor::clean_names() |> 
  mutate(date = lubridate::mdy_hms(date),
         iucr = as.factor(iucr),
         primary_type = as.factor(primary_type),
         description = as.factor(description),
         location_description = as.factor(location_description),
         community_area = as.factor(community_area),
         district = as.factor(district)) |> 
  arrange(id)

number_of_days <- 
  tibble(date = seq(min(crimes$date), max(crimes$date), "day")) |> 
  mutate(month = month(date), year = year(date)) |> 
  summarise(n_days = n(), .by = c(year, month)) 

crime_codes <-
  crimes |> 
  distinct(iucr, primary_type, description)

crimes <- crimes |> select(-c(primary_type, description))

gc()

glimpse(crimes)
summary(crimes)


# number of cases and arrests

crimes |> 
  group_by(year = year(date)) |> 
  summarise(arrests = sum(arrest), cases = n()) |>
  pivot_longer(-year) |> 
  ggplot(aes(x = year, y = value, color = name)) +
  geom_line(linewidth = 1.2) +
  scale_y_continuous(labels = scales::number) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Number of cases and arrests yearly",
       x = NULL, y = NULL, color = NULL) +
  theme(legend.position = "bottom")

crimes |> 
  group_by(year = year(date)) |>
  summarise(arrest_prop = sum(arrest) / n()) |>
  ggplot(aes(x = year, y = arrest_prop)) +
  geom_line() +
  expand_limits(y = 0)




# Locations

crime_location <-
  crimes |> 
  summarise(location_count = n(), .by = location_description) |> 
  arrange(desc(location_count)) |> 
  slice(1:10) |> 
  mutate(location_description = fct_drop(location_description) |> 
           fct_reorder(location_count))

max_count_location <- max(crime_location$location_count)

top_crime_location <- crime_location$location_description

crime_location |>
  mutate(label = scales::number(location_count, scale = 1e-3, accuracy= 0.1)) |> 
  ggplot(aes(x = location_count, y = location_description)) +
  geom_col() +
  geom_text(aes(label = label, x = location_count + 2e4), hjust = 0, size = 3) +
  scale_x_continuous(labels = scales::number,
                     limits = c(0, max_count_location * 1.1),
                     breaks = seq(0, max_count_location, 5e5)) +
  labs(title = "The most common crime location (in thousands)",
       x = NULL, y = NULL)

motor_vehicle_theft_codes <-
  crime_codes |> 
  filter(primary_type == "MOTOR VEHICLE THEFT") |> 
  pull(iucr) |> 
  factor()

crimes |> 
  filter(iucr %in% motor_vehicle_theft_codes) |> 
  summarise(n_arrest = sum(arrest),
            n_case = n(),
            prop = n_arrest / n_case, .by = location_description) |> 
  filter(n_case > 1000) |> 
  arrange(desc(prop))
  
crimes |> 
  filter(iucr %in% motor_vehicle_theft_codes,
         year(date) %in% 2001:2012,
         location_description %in% c("GAS STATION",
                                     "DRIVEWAY - RESIDENTIAL")) |> 
  mutate(week_day = wday(date, label = TRUE)) |> 
  count(location_description, week_day) |> 
  pivot_wider(names_from = location_description, values_from = n) |> 
  janitor::clean_names()

# Week days
crime_week_day <- 
  select(crimes[1:1e4, ], date, arrest) |> 
  mutate(date = wday(date, label = TRUE)) |> 
  count(date, arrest)

crime_week_day |> 
  pivot_wider(names_from = arrest, values_from = n) |> 
  janitor::clean_names()


# arrest vs non-arrest

median_date <-
  crimes |> 
  filter(year(date) %in% 2001:2012) |> 
  pull(date) |> 
  median()

crimes |> 
  filter(year(date) %in% 2001:2012) |> 
  ggplot(aes(x = date, y = arrest, fill = arrest)) +
  geom_boxplot() +
  geom_vline(xintercept = median_date) +
  labs(title = "Case distribution throughout 2001 to 2012",
       x = NULL, y = NULL) +
  theme(legend.position = "none") 

crimes |> 
  group_by(year = year(date)) |> 
  count(arrest) |> 
  mutate(prop = n / sum(n)) |> 
  pivot_wider(id_cols = year, names_from = arrest, values_from = prop) |> 
  janitor::clean_names()

