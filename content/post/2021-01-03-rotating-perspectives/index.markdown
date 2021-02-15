---
title: Rotating perspectives
subtitle:
date: 2021-01-03
author: "Matias Andina"
tags: ["generative-art","R"]
---

I have been asked to unveil a bit of what's under the hood on [this post](https://matiasandina.netlify.app/2021/01/art-in-a-new-year/). I decided to make a new post to share how my creative process took place and maybe inspire others to play along.

Something interesting about all of this is how well it plays into common sense. Looking at things from a different perspective, in this case adding just a rotation, can yield outstanding results.  

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

### The shapes

First of all, we are going to use the shapes provided by `ggforce::geom_regon()`.


```r
library(tidyverse)
library(ggforce)

df <- data.frame(
  x0=3:8,
  y0=1,
  r=0.2
)

ggplot(df)+
  geom_regon(aes(x0=x0,y0=y0,r=r, sides=x0, angle=0),
             fill="gray50", color="black")+
  coord_equal()+
  labs(title="Regular polygons using ggforce", 
       x="", y="",
       caption="@NeuroMLA")+
  theme(panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(hjust=0.5))
```

<img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/show-shapes-1.png" width="672" />

### The twist

Now we can implement a rotation to each figure. We will use the previous `df` and `expand_grid()` to add an angle rotation to the regular polygon. The greater the number of sides, the closer we get to a circular shape illusion when we rotate and overlap the polygons. For `n>6` it didn't generate the type of look I was looking after during my experimentation. 


```r
df <- expand_grid(df, angle = seq(0, 0.5, 0.1))

 
ggplot(df)+
  # notice we use angle = angle now
  geom_regon(aes(x0=x0,y0=y0,r=r, sides=x0, angle=angle),
             fill="gray50", color="black")+
  coord_equal()+
  labs(title="Rotated regular polygons using ggforce", 
       x="", y="",
       caption="@NeuroMLA")+
  theme(panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(), 
        plot.title = element_text(hjust=0.5))
```

<img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/rotations-1.png" width="672" />

We can tinker with the `alpha` and `fill` to make some nice looking shapes. I'm not going to modify `color` but it's also a possibility.


```r
ggplot(df)+
  # notice we use angle = angle now and fil=factor(x0)
  geom_regon(aes(x0=x0,y0=y0,r=r, sides=x0, angle=angle,
                 fill=factor(x0)), 
             alpha=0.1, color="black")+
  coord_equal()+
  labs(title="Rotated regular polygons using ggforce", 
       x="", y="",
       caption="@NeuroMLA")+
  theme(panel.background = element_blank(),
        legend.position = "none",
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(hjust=0.5)) -> p

print(p)
```

<img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/color-tinkering-1.png" width="672" />

### Make it pallette

We can have unlimited color combinations. Just as a start, two places I like to use when dealing with color pallettes in R:

* [R Color Brewer Pallettes](https://www.r-graph-gallery.com/38-rcolorbrewers-palettes.html)
* [Adobe Color Picker](https://color.adobe.com)

We will use `scale_fill_*()` functions of `ggplot`. I normally use `scale_fill_manual()` if I want to handpick the values, but `scale_fill_viridis()` and `scale_fill_brewer()` often do a nice job too!

<img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/pallettes-1.png" width="672" /><img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/pallettes-2.png" width="672" /><img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/pallettes-3.png" width="672" /><img src="/post/2021-01-03-rotating-perspectives/index_files/figure-html/pallettes-4.png" width="672" />

