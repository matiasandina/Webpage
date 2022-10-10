library(tidyverse)
library(rvest)

# SMALL DATABASE ####
# 311 pages
# Queen's gambit Accepted
gambit_accepted <- list()
for (i in 1:311){
  page <- paste0("page=", i)
  url <- glue::glue("https://www.chessgames.com/perl/chess.pl?{page}&playercomp=either&year=1990&yearcomp=ge&eco=D20-D29")
  
  all_tables <- read_html(url) %>%
    html_nodes("table") 
  
  gambit_accepted[[i]] <- all_tables[4] %>%
      html_table(fill=TRUE, header = T) %>% 
      .[[1]]  
  
  Sys.sleep(0.1)
}

### Chess.com database ####

# last one is 1492
chess_com_queen_gambit_urls <- 
glue::glue("https://www.chess.com/games/search?opening=Queen%27s%20Gambit&openingId=1625&p1=&p2=&lstresult=0&mr=1000&lsty=2&year=2000&lstMoves=1&moves=&fen=&sort=&page={1:1492}")

chess_com_queen_gambit <-
map(chess_com_queen_gambit_urls,
    function(url)  {
      Sys.sleep(abs(rnorm(1, 0.5, 1)))
      url %>% 
        read_html() %>% 
        html_table() %>% 
        .[[1]] 
    }
)

df <- chess_com_queen_gambit %>% 
  bind_rows()

# column 5 is garbage
df <- df[,1:4]

# or read previous
df <- read_csv("/home/matias/queen_gambit.csv")

# add text result to the data
df <- 
df %>% 
  mutate(text_result = case_when(Result == "1-0" ~ "white wins",
                                 Result == "0-1" ~ "black wins",
                                 TRUE ~ "draw"),
         text_result = factor(text_result, 
                              levels = c("white wins", "draw", "black wins"))) 

  df %>% 
  ggplot(aes(text_result, Moves, fill=text_result)) +
  geom_violin()+
  stat_summary(fun.data = mean_se,
               show.legend = F,
               color="#bbb4a9ff")+
  ggthemes::theme_fivethirtyeight() +
  scale_fill_manual(values = c("white", "#777574ff", "black"))
    

tibble_summary <- function(x){
  summary(x) %>% 
    as.matrix() %>% 
    t() %>% 
    as_tibble() %>% 
    janitor::clean_names() %>% 
    rename(q25 = x1st_qu,
           q75 = x3rd_qu)
}
  
  
df %>% 
  group_by(text_result) %>% 
  summarise(y=list(tibble_summary(Moves))) %>% 
  unnest(y) %>% 
  rename(Result = text_result)


clean_df <- 
df %>%
  mutate(Players=str_squish(Players)) %>% 
  separate(Players, into=c("Players", "moves"), sep=" 1. ") %>%
  separate(moves, into=c("moves", "accepted"), sep = " Queen's Gambit") %>%
  separate(accepted, into=c("accepted", "variation"), sep=": ") %>% 
  separate(moves, into = c("first", "second", "third"), sep=" [2-3]\\. ")

# a few ones need further cleaning
clean_df <- 
  clean_df %>% 
  filter(accepted != "") %>% 
  filter(!str_detect(string = accepted, pattern = " Declined with.")) %>% 
  mutate(Result = factor(Result, levels = c("1-0", "½-½", "0-1")))


# Queen's Gambit is proposed mostly on the second move
clean_df %>% 
  count(second = str_detect(second, "^c4"),
        third = str_detect(third, "^c4")) %>%
  mutate(proposal = factor(c("later", "third move", "second move"),
                           levels = c("second move", "third move", "later"))) %>%
  ggplot() +
  geom_col(aes(proposal, n)) +
  geom_text(aes(proposal, n, label=n), vjust = -0.5) +
  scale_y_continuous(labels = scales::label_number_si())+
  ggthemes::theme_fivethirtyeight() +
  labs(title="Games with Queen's Gambit proposal",
       subtitle = "Counting games with proposal on 2nd move, 3rd move, or afterwards")
  
prop_df <- 
clean_df %>% 
  count(accepted, text_result) %>% 
  group_by(accepted) %>% 
  mutate(total = sum(n),
         prop = n/total,
         pos = 1 - cumsum(prop) + prop/2)
# barplot
prop_plot <-
prop_df %>% 
  ggplot()+ 
  geom_col(aes(accepted, prop, fill = text_result), color="black") +
  geom_text(aes(accepted, pos, label = scales::percent(prop, accuracy = 1L)),
            color="#bbb4a9ff", size=12) +
  scale_fill_manual(values = c("white", "#777574ff", "black"))+
  ggthemes::theme_fivethirtyeight(base_size = 16) +
  labs(fill= "",
       title="Accepting Queen's Gambit: better for black?",
       subtitle="Proportion of Master Games") +
  coord_flip()

# expected_win
expected_game_value <-
prop_df %>% 
  group_by(accepted) %>% 
  summarise(expected_white = 
              0.5 * prop[text_result=="draw"] + 
              1 * prop[text_result=="white wins"],
            expected_black = 
              0.5 * prop[text_result=="draw"] + 
              1 * prop[text_result=="black wins"]
              ) %>% 
  pivot_longer(-accepted) %>%
  mutate(name = str_remove(name, "expected_")) %>% 
  group_by(accepted) %>% 
  mutate(pos = ifelse(name=="black",
                      1 - value/2,
                      value - value/2)) %>% 
  ggplot(aes(accepted, value, fill=name))+
  geom_col(color="black") +
  geom_text(aes(accepted, pos,
                label= round(value, 2)),
            hjust = 0.5, 
            color="#bbb4a9ff", size=12)+
  coord_flip()+
  scale_fill_manual(values=c("black", "white"))+
  ggthemes::theme_fivethirtyeight(base_size = 16)+
  labs(subtitle="Expected Game Value (based on observed proportions)",
       fill="",
       caption = "Source: chess.com | Viz: @NeuroMLA") 

library(patchwork)
prop_plot + expected_game_value +
  plot_layout(ncol=2, widths = c(1.5,1)) #+
  #plot_annotation()

library(ggalluvial)
clean_df %>% 
  mutate(first = paste("1.", first, "\n2. c4"),
         second = str_remove(second, "c4 ")) %>% 
  # remove "Nf3 Nf6" so we only focus on the gambit on the first two moves
  filter(second != "Nf3 Nf6") %>% 
  # lump the moves 
  mutate(first = fct_lump_min(factor(first), min = 1500),
         second = fct_lump_min(factor(second), min = 1000),
         third = fct_lump_min(factor(third), min = 1000)) %>%
  # remove first == "other"
  filter(first != "Other") %>% 
  group_by(accepted) %>%  
  count(first, second, third, text_result) %>% 
ggplot(aes(axis1 = first, axis2 = second, axis3 = third, axis4=text_result,
           y = n)) +
  scale_x_discrete(limits = c("White moves c4", "Black's\nResponse", "Third\nMove", "Result"),
                   expand = c(0.1, 0.1)) +
  geom_alluvium(aes(fill=accepted), width = 0.5) +
  geom_stratum(width=0.5, alpha=0) +
  geom_text(stat = "stratum", 
            aes(label = after_stat(stratum)), fontface = "bold")+
  ggthemes::theme_fivethirtyeight() +
  theme(legend.position = "bottom",
        axis.text.y = element_blank(),
        panel.grid.major = element_blank(),
        plot.title = element_text(hjust=0.5)) +
  scale_fill_brewer(palette = "Set1") +
  labs(title="Flow of Master Chess Games After Queen's Gambit",
       fill="Queen's Gambit",
       caption="Source: chess.com | Viz: @NeuroMLA")
  
    

clean_df %>% 
  # get "Nf3 Nf6" 
  filter(second == "Nf3 Nf6") %>% 
  mutate(first = fct_lump_min(factor(first), min = 200),
         second = fct_lump_min(factor(second), min = 1000),
         third = fct_lump_min(factor(third), min = 200)) %>%
  # remove first == "other"
  #filter(first != "Other") %>% 
  group_by(accepted) %>%  
  count(first, second, third, text_result) %>% 
  ggplot(aes(axis1 = first, axis2 = second, axis3 = third, axis4=text_result,
             y = n)) +
  scale_x_discrete(limits = c("First\nMove", "Second\nMove", "Third\nMove", "Result"),
                   expand = c(0.1, 0.1)) +
  geom_alluvium(aes(fill=accepted), width = 0.5) +
  geom_stratum(width=0.5, alpha=0) +
  geom_text(stat = "stratum", 
            aes(label = after_stat(stratum)), fontface = "bold")+
  ggthemes::theme_fivethirtyeight() +
  scale_fill_brewer(palette = "Set1") +
  labs(title="Flow of Master Chess Games After Queen's Gambit",
       subtitle="Only showing games where `2. Nf3 Nf6` was second move",
       fill="Queen's Gambit",
       caption="Source: chess.com | Viz: @NeuroMLA")+
  theme(legend.position = "bottom",
        axis.text.y = element_blank(),
        panel.grid.major = element_blank(),
        plot.title = element_text(hjust=0.5),
        plot.subtitle = element_text(hjust=0.5)) 
  

# https://www.bloomberg.com/graphics/2020-chess-boom/

# chess script
#https://github.com/arnsholt/chesscom-games

## Year plot

clean_df %>% 
  count(Year) %>% ggplot(aes(Year, n))+ 
  geom_line()

# install.packages("bigchess")
li <- list.files("chess_games/", pattern = "pgn", full.names = T)
all_my_games <- map(li,
                    function(tt)
                    bigchess::read.pgn(tt, extract.moves = 4,
                                       stat.moves = F))

my_games <- do.call(rbind, all_my_games)
write_csv(my_games, "./chess_games/my_games.csv")
my_games <- read_csv("Desktop/chess_games/my_games.csv")
  
density_plot_for_arrows <-
ggplot() +
  geom_density(data = my_games,
               aes(NMoves, fill = "My Games"), alpha=0.8)+
  geom_density(data=df,
               aes(Moves, fill = "Master Games"), alpha=0.8)+
    see::scale_fill_material()+
    ggthemes::theme_fivethirtyeight()+
    theme(#axis.text.y = element_blank(),
          axis.title = element_text())+
    labs(fill="", y="Game Frequency", x = "Moves per game",
         title = "",
         caption = "Source: chess.com | Viz: @NeuroMLA")

density_plot_for_arrows +
  annotate(
    geom = "curve", x = -0.1, y = 0.02, xend = 5, yend = 0.01, 
    curvature = .05, arrow = arrow(length = unit(2, "mm"))
  ) +
  annotate(geom = "label", x = 2, y = 0.022,
           label = "1")

density_plot_for_arrows +
  annotate(
    geom = "curve", x = 100, y = 0.01, xend = 80, yend = 0.005, 
    curvature = .1, arrow = arrow(length = unit(2, "mm"))
  ) +
  annotate(geom = "label", x = 105, y = 0.01,
           label = "2")

  
my_games <- my_games %>% 
  mutate(text_result = case_when(Result == "1-0" ~ "white wins",
                                 Result == "0-1" ~ "black wins",
                                 TRUE ~ "draw"),
         text_result = factor(text_result, 
                              levels = c("white wins", "draw", "black wins")))


# add years
my_games <- my_games %>% 
  mutate(Date = lubridate::as_date(Date),
         year = lubridate::year(Date)) 


# most typical variations
clean_df %>% count(variation, sort = T)

bind_rows(select(clean_df, Moves, text_result) %>% mutate(source = "Masters Games"),
          select(my_games, Moves = NMoves, text_result) %>% mutate(source = "My Games")) %>% 
  ggplot()+
  geom_density(aes(Moves, fill=source), alpha=0.8)+
  facet_wrap(~text_result)+
  see::scale_fill_material()+
  ggthemes::theme_fivethirtyeight()+
  theme(axis.text.y = element_blank(),
        axis.title = element_text())+
  labs(fill="", y="Game Frequency", x = "Moves per game",
       title = "Master Games get into draws much faster",
       caption = "Source: chess.com | Viz: @NeuroMLA")

# most frequent openings
my_games %>%
  mutate(
    playing = ifelse(White=="matiasandina", "Playing White", "Playing Black"),
    playing = fct_rev(factor(playing)),
    first = paste(W1, B1)
    ) %>%
  count(playing, first) %>%
  group_by(playing) %>% 
  slice_max(n=10, order_by = n) %>% 
  mutate(first = fct_reorder(first, n)) %>% 
  ggplot(aes(first, n)) +
  geom_col()+
  coord_flip()+
  facet_wrap(~playing)

# Result proportions
bind_rows(
clean_df %>% count(text_result) %>% mutate(prop = n/sum(n),
                                           source = "Master Games"),
my_games %>% count(text_result) %>% mutate(prop = n/sum(n),
                                           source = "My Games")
) %>% 
  ggplot(aes(text_result, prop, fill=source))+
  geom_col(position="dodge", alpha=0.8)+
  scale_y_continuous(labels=scales::label_percent())+
  scale_fill_brewer(palette = "Set1", direction = -1)+
  ggthemes::theme_fivethirtyeight()+
  theme(axis.title = element_text())+
  labs(fill="", y="Game Frequency",
       title = "Master Games get into draws more often",
       caption = "Source: chess.com | Viz: @NeuroMLA")



my_games %>%
  group_by(year) %>% 
  ggplot(aes(year)) +
  geom_bar()
  

my_games %>%
  mutate(open = paste(W1, B1, W2),
         queen_gambit = ifelse(open == "d4 d5 c4" | open == "d4 Nf6 c4", "Queen's Gambit", "other")) %>% 
  group_by(year) %>% 
  count(queen_gambit) %>%
  mutate(prop = n/sum(n)) -> gambit_prop_my_games

  gambit_prop_my_games %>% 
  ggplot(aes(year, n)) +
  geom_col(aes(fill=queen_gambit))
  
  gambit_prop_my_games %>% 
    ggplot(aes(year, prop)) +
    geom_col(aes(fill=queen_gambit))

  
  my_games %>% 
    filter(year >= 2020) %>% 
    mutate(open = paste(W1, B1, W2),
           queen_gambit = case_when(open == "d4 d5 c4" | open == "d4 Nf6 c4" ~ "Queen's Gambit", 
                                    paste(W1, B1) == "e4 d5" ~ "Scandinavian Defense",
                                    TRUE ~ "other"),
           month = lubridate::as_date(cut(Date, "1 month"))) %>%
    group_by(month) %>% 
    count(queen_gambit) %>% 
    mutate(prop = n/sum(n)) %>% 
    filter(queen_gambit=="Queen's Gambit") %>% 
    ggplot(aes(month, prop, fill=queen_gambit)) +
    geom_col() +
    scale_x_date(breaks = "1 month", date_labels = "%b\n%Y")

  
  
# I was playing scandinavian more often, even so, queen's gambit got a jump on November  
  my_games %>% 
    filter(year >= 2020) %>% 
    mutate(open = paste(W1, B1, W2),
           queen_gambit = case_when(open == "d4 d5 c4" | open == "d4 Nf6 c4" ~ "Queen's Gambit", 
                                    paste(W1, B1) == "e4 d5" ~ "Scandinavian Defense",
                                    TRUE ~ "other"),
           month = lubridate::as_date(cut(Date, "1 month"))) %>%
    group_by(month) %>% 
    count(queen_gambit) %>% 
    mutate(prop = n/sum(n)) %>% 
    filter(queen_gambit=="Scandinavian Defense") %>% 
    ggplot(aes(month, prop, fill=queen_gambit)) +
    geom_col() +
    scale_x_date(breaks = "1 month", date_labels = "%b\n%Y")
  
    
