library(tidyverse)
library(ggforce)
library(lubridate)

df <- readr::read_csv("report.csv")
names(df) <- c("type", "duration", "from", "to", "comment")

sum_dur <- df %>% group_by(type) %>%
           summarise(sum_dur = sum(duration)) %>%
            mutate(minutes = period_to_seconds(as.period(sum_dur))/60,
                   type = fct_reorder(type, minutes, .desc = TRUE),
                   prop_minutes = minutes/sum(minutes)) %>%
  arrange(desc(minutes))

main_categ <- sum_dur %>% top_n(n = 5, wt = minutes)

  ggplot(sum_dur, aes(x=1, y = prop_minutes, fill=type)) +
  geom_col()+
  scale_fill_viridis_d(direction = -1)+
  theme_void()+
  theme(legend.position="none")+
  coord_flip()


  
df %>% filter(type=="Trabajar") %>%
  mutate(start_year = year(from),
         start_month = month(from),
         start_day = day(from),
         date_from = ymd(paste(start_year, start_month, start_day, sep="-"))) %>%
  ggplot(aes(date_from, duration)) +
  geom_line()
      
  
  