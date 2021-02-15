---
title: Complex Fun
subtitle: 
date: 2020-04-30
author: "Matias Andina"
tags: ["art","fun"]
mathjax: true
---




<img src="/post/2020-04-30-complex-fun/index_files/figure-html/unnamed-chunk-2-1.png" width="672" />


*** 

People say that if you have to explain a joke, it loses value. Probably true. I guess I just wanted to partially comment on how different disciplines analyze different levels of complexity.

As molecular biologist, I think we were trained to seldom think about the whole system, we were trained to just give up complexity and focus on a couple of fancy names (yes, YFG fits pretty well as the center of this Universe). Genes are awesome, weak protein-protein interactions and conformational changes rock. Are you missing the whole world by focusing too much?

As a biologist, I think we were trained by association (i.e., "If this, then that. Now repeat logic for a million different processes"). This means that our view of every phenomenon tends to be overly complicated. We do this at every scale we analyze Life, not always with the study complexity in mind, but just as a reflex. This is not an intrinsic fault of the biologist, it might be just a result of how data is collected and the empirical nature of the field.

I think physicists get it often right, as simple as it should be, not less. If the whole thing is a tennis ball, and your system of interest is ruled by macro laws, just approximate and do `\(m\vec{g}\)`. 

All in all, this is the same dataset, 3 worlds apart (or 3 convention centers apart). I think the joke is on us :smile:.

***

For those of you who want to recreate, you can find the R code below the shameless plug.

***

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

***


```r
library(tidyverse)
library(xkcd)
library(patchwork)

set.seed(2)
df <- tibble(
  x = rnorm(100, 0, 2),
  y = rnorm(100, 0, 2)
) %>%
  mutate(time = 1:n())
df <- tweenr::tween_along(df,'cubic-in-out', 1000, along = time)


my_theme <-
  theme_xkcd()+
  theme(panel.border = element_rect(fill=NA, color="black", size=1),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5))


p0 <- ggplot(df %>% slice(1:100), aes(x,y))+
  geom_jitter()+
  geom_line(position="jitter")+
  my_theme+
  labs(title="MOLECULAR\nBIOLOGIST", x="", y="")

p1 <- ggplot(df %>% sample_n(1000), aes(x,y))+
  geom_path(lwd=0.5, alpha=0.8)+
  my_theme+
  labs(x="",y="",title="BIOLOGIST")

p2 <- ggplot()+
  ggforce::geom_circle(aes(x0=0,y0=0,r=1), fill="gray30", color=NA)+
  geom_segment(aes(x=0, xend=0, y=0,yend=-0.5),
               arrow = arrow(length = unit(0.2, "cm"),
                             type = "closed"),
               arrow.fill = "black", size=0.5, color="black")+
  geom_text(aes(x=0.2,y=-0.5), label="mg", color="black")+
  my_theme +
  labs(x="", y="", title="PHYSICIST")
  
p0 + p1 + p2
```

