---
title: Queen's Gambit
subtitle: A trip down the chess rabbit hole
date: 2021-02-07
author: "Matias Andina"
tags: ["chess","fun", "design"]
---

I love games. I enjoy the fun in many formats: cards, boards, consoles. Yet, over the years, chess has consolidated as the game I play most often, and it is likely the only game I both **really** like and can limit the amount I play[^1].

It's been a couple of months since I noticed something weird going on, a sort of disturbance in the force. I felt I was playing a type of position called **Queen's Gambit** way more often than normal. There's currently a sort of chess mania fueled by the very succesful new series that gets the name from the gambit[^2], so I thought it would be pretty easy to find out whether the data reflected my gut feeling.

[^2]: But mostly because the star is a kick-ass girl.

------------------------------------------------------------------------

<!--html_preserve--><blockquote>
<p>I write fiction and non-fiction.<br/>
I write open-source software.<br/>
I create generative art.  </p>

<p>All of these are available for free in different media.
If you like what I do, and want me to keep creating, you can contribute using the links below.</p>
</blockquote>
<!--/html_preserve--><!--html_preserve--><table style="width:100%">
  <tr>
  <th>Patreon</th>
  <td>
  <a href="https://www.patreon.com/bePatron?u=25827926" data-patreon-widget-type="become-patron-button">Become a Patron!</a><script async src="https://c6.patreon.com/becomePatronButton.bundle.js"></script>
  </td>
  <tr>
    <td>
    </td>
  </tr>
  <tr>
  <th>Paypal</th>
  <td>
  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_donations" />
<input type="hidden" name="business" value="BWWTTZ2XSDAZ8" />
<input type="hidden" name="currency_code" value="USD" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
</form>

  </td>
  </tr>
</table>
<!--/html_preserve-->

------------------------------------------------------------------------

## The data

There are probably many places where I could have found some data, but `www.chess.com` makes it somewhat accessible (if you can parse websites) and is home of a quite large dataset. It is also the place where I play, so the dataset of *my* games comes from there. I went directly to look for games where Queen's Gambit is played.



I first started looking at a dataset with 37287 entries, from games played between chess Masters (aka Master Games) that open with Queen's Gambit. Games where played between 2000 and 2020. After a bit of data cleaning, there were a few quick things I wanted to look at.

Below, you can find a violin plot of the number of moves a chess match between masters normally has.

<details>
  <summary>Click to expand</summary>
  ```r
general_caption <- "Source: chess.com | Viz: @NeuroMLA"
 
df %>% 
  ggplot(aes(text_result, Moves, fill=text_result)) +
  geom_violin()+
  stat_summary(fun.data = mean_se,
               show.legend = F,
               color="#bbb4a9ff")+
  scale_y_continuous(breaks=seq(0,200,40))+
  ggthemes::theme_fivethirtyeight() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = c("white", "#777574ff", "black"))+
  labs(fill = "",
       title = "Chess Master Games last around 40 moves",
       caption = general_caption)
```
</details><img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-2-1.png" width="672" />

If you are curious, here's a table with summary statistics for the number of moves in the games by result.

<!--html_preserve--><div id="htmlwidget-06d5090f052c5dd23859" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-06d5090f052c5dd23859">{"x":{"filter":"none","data":[["1","2","3"],["white wins","draw","black wins"],[5,2,4],[31,21,33],[40,34,41],[41.85,36.84,43.82],[50,49,53],[161,204,183]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Result<\/th>\n      <th>min<\/th>\n      <th>q25<\/th>\n      <th>median<\/th>\n      <th>mean<\/th>\n      <th>q75<\/th>\n      <th>max<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->



## What is it?

Generally speaking, a gambit is a position where both players stand to exchange pieces. In the particular case of the Queen's Gambit, we are most often referring to this position (although see further below).

![Most common Queen's Gambit position](data_for_posts/queens_gambit/boards/board01.png){width="360"}

## When does it happen?

Queen's gambit is an opening, this means it occurs early in the game. In this case, the gambit is overwhelmingly proposed on the second move and just a few games develop into a position that is equivalent to the Queen's gambit later in the game.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

## Who benefits?

In chess, whoever starts (aka plays white) has advantage. However, Chess Masters are heavily trained in defense, so it's not a walk in the part for white. It always depends heavily on the initial poisitions (openings) gambit proposals and responses (accepted or declined with many variations). In the case of the Queen's Gambit, we see that white is favorite to win, while accepting the gambit increases the likelihood of draws. Interestingly, if we calculate the expected value for black from the observed frequencies[^3], it might be slightly better for black to accept the gambit.

[^3]: I'm using the observed frequencies and calculating one point per win and 0.5 points per draw. This gives the expected values for each player.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/barplots-patch-1.png" width="672" />

However, it is likely that this minimal difference is just noise. Chess Masters decline the Queen's gamibt way more often than they accept it (about 2.6 times more often!). If we check with the chess engines, they seldom accept the Queen's Gambit either. On a personal, totally amateur note, I don't feel like accepting the Queen's Gambit, it just doesn't feel right.

## Where do they go?

It's nice to use alluvial plots to visualize how the games evolve in time. It would really be a mess to visualize all moves, so I just focused on certain games and kept it short around proposal/response in regards to Queen's Gambit. I added the result of the game, just out of curiosity.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/alluvial-1.png" width="672" />

As you can see, I focused on the two cases where white moves their pawn to c4 (`c4`) to actually "propose" the gambit. These is how both situations look on the board.

+-------------------------------------------------------------------+-------------------------------------------------------------------+
| ![](data_for_posts/queens_gambit/boards/board01.png){width="180"} | ![](data_for_posts/queens_gambit/boards/board02.png){width="180"} |
+-------------------------------------------------------------------+-------------------------------------------------------------------+
| 1.  d4 d5 2. c4                                                   | 1.  d4 Nf3 2. c4                                                  |
+-------------------------------------------------------------------+-------------------------------------------------------------------+

"Accepting" the gambit means taking the pawn at c4 (`dxc4`). As we said before, this is the least frequent case, and it is interesting to see that almost none of the `Nf3` games go to accept the gambit. It's also quite telling that the vast majority of Masters respond to Queen's Gambit with `e6`. This is how it looks in the board.

+--------------------------------------------------------------------+------------------------------------------------------------------------+
| ![](data_for_posts/queens_gambit/boards/board_e6.png){width="180"} | ![](data_for_posts/queens_gambit/boards/board_Nf6_e6.png){width="180"} |
+--------------------------------------------------------------------+------------------------------------------------------------------------+
| 1.  d4 d5 2. c4 e6                                                 | 1.  d4 Nf3 2. c4 e6                                                    |
+--------------------------------------------------------------------+------------------------------------------------------------------------+

### Special case

There's a special case where games get a bit delayed before reaching the gambit. These are the games where the second move is `Nf3 Nf6`. I made the same alluvial plot for these games. For some reason, it looks like on this position the majority of Chess Masters will accept the gambit. Maybe if you like to play the gambit as white, and you like the other side to accept it, you should delay your `c4` advance just one move.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-4-1.png" width="672" />

This is how your board should look like if you want black to accept the gambit.

![](data_for_posts/queens_gambit/boards/board_second_move_accept.png){width="360"}

## Queen's Gambit Popularity

Enough with the chess lingo, show me what I came here for! Alright, alright, don't bark. Here's the popularity plot on the Masters Games.

```r
clean_df %>% 
  count(Year) %>% ggplot(aes(Year, n))+ 
  ggthemes::theme_fivethirtyeight()+
  geom_line(lwd=1) +
  geom_point(size=3) +
  labs(title = "Frequency of Queen's Gambit Games between Chess Masters",
        caption = general_caption)
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/pop-plot-masters-1.png" width="672" />

What happened between 2017 and 2019? I don't really know if the total amount of games just skyrocketed, maybe the 2018 world championship had something to do with it. I didn't parse the full database so I can't tell you about the frequency of all games. It could be that there was just an enormous amount of games being played.

What happened in 2020? If you are from the future, I would like to remind you that there was a Global Pandemic on 2020, stay safe whenever you are.

The thing is, 2020 data will not reflect this easily, the pandemic messed up with the tournament schedule. Moreover, I would be *quite* surprised if indeed a series would be able to affect Chess Masters opening selections. But what about simple mortals like you and me? Well, my friend, if you made it this far, I trust you to go on with my game database.

## My games

First, you should know that I *mostly* play blitz games (likely 3 minutes in the clock at start or 3 minutes with 2 seconds added per move). Nonetheless it looks like the move distribution of games is quite similar to what we see in Masters games.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/density_plot-1.png" width="672" />

There are however, two places where I see differences. First, Master Games show a bump quite early, even below 20 moves. This is unusual because it takes more moves to break a good defense. We will come back later to this.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/first-arrow-1.png" width="672" />

Second, there is another bump on longer games. I attribute this to the nature of my skill level. I can't play much more than an opening and a few attempts on the "middle game". Most of my games will evolve pretty quickly (either because the clock forces you to be aggressive or because the level of us players is not good). It's often the case that one player makes a crucial mistake and the game evolves fast after that.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/second-arrow-1.png" width="672" />

There's another explanation for these differences. If we separate games according to result. We see that Masters games have almost the same shape as mine, but when they get to a draw, they get to it really fast. For us novices, getting a draw is often an accident. Masters deliberately draw, and they do it early.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/facet-result-1.png" width="672" />

### Drawing is a signal of quality

At my level, drawing a game is not common. For pros, it's quite the opposite.

```r
# Result proportions

bind_rows( clean_df %>% count(text_result) %>% 
             mutate(prop = n/sum(n), source = "Master Games"), 
           my_games %>% count(text_result) %>% 
             mutate(prop = n/sum(n), source = "My Games") ) %>% 
  ggplot(aes(text_result, prop, fill=source))+ 
  geom_col(position="dodge", alpha=0.8)+ 
  scale_y_continuous(labels=scales::label_percent())+ 
  scale_fill_brewer(palette = "Set1", direction = -1)+ 
  ggthemes::theme_fivethirtyeight()+ 
  theme(axis.title = element_text())+ 
  labs(fill="", y="Game Frequency", 
       title = "Master Games get into draws more often", 
       caption = "Source: chess.com | Viz: [@NeuroMLA]")
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/result-prop-1.png" width="672" />

In my database, I do have all the games I played. It's a total of 15130. Yes, I know, a lot, roughly 4.61. Anyway, I can get all the openings from my games.

I selected the ten most frequent first moves when I am playing white and when I am playing black. You can see that I don't use Queen's Gambit at all when playing white. The only times I face the `d4 d5` opening (which might lead to Queen's Gambit) is when I play black.

<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/frequent-openings-1.png" width="672" />

```r
my_games %>% group_by(year) %>% ggplot(aes(year)) + geom_bar()
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-5-1.png" width="672" />```r
my_games %>% mutate(open = paste(W1, B1, W2), queen_gambit = ifelse(open == "d4 d5 c4" | open == "d4 Nf6 c4", "Queen's Gambit", "other")) %>% group_by(year) %>% count(queen_gambit) %>% mutate(prop = n/sum(n)) -> gambit_prop_my_games

gambit_prop_my_games %>% ggplot(aes(year, n)) + geom_col(aes(fill=queen_gambit))
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-5-2.png" width="672" />```r
gambit_prop_my_games %>% ggplot(aes(year, prop)) + geom_col(aes(fill=queen_gambit))
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-5-3.png" width="672" />```r
my_games %>% filter(year >= 2020) %>% mutate(open = paste(W1, B1, W2), queen_gambit = case_when(open == "d4 d5 c4" | open == "d4 Nf6 c4" ~ "Queen's Gambit", paste(W1, B1) == "e4 d5" ~ "Scandinavian Defense", TRUE ~ "other"), month = lubridate::as_date(cut(Date, "1 month"))) %>% group_by(month) %>% count(queen_gambit) %>% mutate(prop = n/sum(n)) %>% filter(queen_gambit=="Queen's Gambit") %>% ggplot(aes(month, prop, fill=queen_gambit)) + geom_col() + scale_x_date(breaks = "1 month", date_labels = "%b\n%Y")
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-5-4.png" width="672" />

I was playing scandinavian more often, even so, queen's gambit got a jump on November


```r
my_games %>% filter(year >= 2020) %>% mutate(open = paste(W1, B1, W2), queen_gambit = case_when(open == "d4 d5 c4" | open == "d4 Nf6 c4" ~ "Queen's Gambit", paste(W1, B1) == "e4 d5" ~ "Scandinavian Defense", TRUE ~ "other"), month = lubridate::as_date(cut(Date, "1 month"))) %>% group_by(month) %>% count(queen_gambit) %>% mutate(prop = n/sum(n)) %>% filter(queen_gambit=="Scandinavian Defense") %>% ggplot(aes(month, prop, fill=queen_gambit)) + geom_col() + scale_x_date(breaks = "1 month", date_labels = "%b\n%Y")
```<img src="/post/2021-02-07-queens-gambit/index_files/figure-html/unnamed-chunk-6-1.png" width="672" />

## References

If you want to read a nice, data rich, post about the "Chess Boom" that the series brought about, check <https://www.bloomberg.com/graphics/2020-chess-boom/>.

Even if you ask, Chess.com does not give you all the games in your database nicely (probably trying to limit the bandwidth). So I slightly adapted the following script <https://github.com/arnsholt/chesscom-games> for the purpose of "Gimme all my games with almost no clicks involved!". It uses the API, so I think it's all cool :).


[^1]: However, after reading this post you might believe I'm a bit of a chess junkie 😝
