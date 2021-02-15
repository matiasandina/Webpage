---
title: "Fitbit Analysis"
author: "Matias Andina"
date: 2019-11-22
output: html_document
tags: ["tracking","learning", "R"]
---

It's been a bit more than a year since I got a fitbit and I have been pretty excited about tracking my activity and heart rate. I should say I'm quite surprised about the sleep data. Tracking sleep has been, in fact, the most exciting feature, and I now strive to get at least 7 hours of sleep per night.


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







Let's first see a glimpse of the data, just to know what type of data we are dealing with. 


```
# A tibble: 5 x 8
  date_time           dateTime   dataset_time variable value total_value
  <dttm>              <date>     <time>       <chr>    <dbl>       <dbl>
1 2018-06-10 00:00:00 2018-06-10 00'00"       steps        0        7256
2 2018-06-10 00:01:00 2018-06-10 01'00"       steps        8        7256
3 2018-06-10 00:02:00 2018-06-10 02'00"       steps        0        7256
4 2018-06-10 00:03:00 2018-06-10 03'00"       steps        0        7256
5 2018-06-10 00:04:00 2018-06-10 04'00"       steps        0        7256
# … with 2 more variables: date <lgl>, time <lgl>
```

## Density plots

Let's now inspect the overall distribution for heart rate and step values.

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/unnamed-chunk-3-1.png" width="672" />




## When do I move?

I will start by focusing on the data for steps.

I'm curious to see what times of the day have the most activity. Because I have a quite large amount of data points (~751 K) I will use `geom_hex()` to count for me and simplify rendering.

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/steps-1-1.png" width="672" />

Well, I should have remembered that for the vast majority of minutes (regardless of the hour of the day), the count is exactly zero. Let's only look at the positive counts:

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/steps-2-1.png" width="672" />

We see now some patches that have high activity (> 100 steps), particularly around 9:00, 12:00 and 18:00. These mostly correspond to "going to work", "activity around lunch time (?)", and "going home / physical activity". For all other cases, it looks like I move around 10-20 steps per minute, regardless of the minute within the hour.


### Last 10 minutes

The result above is interesting because I usually have to be reminded by Fitbit to "move up to 250 steps in the hour". I receive this notification on the last 10 minutes of the hour and I would think that during those 10 minutes I put more steps than during the first 50. Data show I'm wrong:

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/last-10-plot-1.png" width="672" />

That being said, I want to keep my reminder on. I feel like having it turned on definitely adds ~ 1000-2000 steps per day.

### Daily average

Let's get one level above and aggregate each day as a unit. This plot shows a nice trend, with months from May to August showing an increase on the number of steps. Keep in mind that November will show little average steps because for that month we have incomplete data (last day in database is 2019-11-13),  


```
`summarise()` ungrouping output (override with `.groups` argument)
```

```
`geom_smooth()` using formula 'y ~ x'
```

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/steps-3-1.png" width="672" />

At this part of the analysis, I should make clear that I took vacations from `2019-06-27` to `2019-07-11`. We will use this information in the analysis to make some things clear.




## Distribution

We looked at the average daily steps for each month, how about the distribution of daily steps? We see that most days I come quite close to the default target of 10K steps. There are some days with very little steps (see below) and, obviously, some days with extreme number of steps.

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/typical-events-1.png" width="672" />

## Extreme events

Using the boxplot below, we can define *extreme events* as instances where I walked more than 20K steps. I chose to plot this by day of the week, to get an insight about periodicity of events.

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/unnamed-chunk-4-1.png" width="672" />

Because I walked a lot during the vacations, I highlighted the days on top of the previous boxplot. Most of the extreme events are definitely during the vacations. Moreover, none of the days I walked less than 10K steps, pretty amazing!

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/vacations-2-1.png" width="672" />


There are some extreme *low* events, these are quite likely the days I just don't wear the fitbit (or days I forget to wear it for most of the day). Just because I can order the data and make another plot, I went ahead and did it!


<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/arranged-steps-1.png" width="672" />


We usually go for walks on Saturdays and/or Sundays. Knowing this little piece of data, it's quite expected to see Saturdays being the days with higher number of steps (and hence higher success rate on the 10K target). 


<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/unnamed-chunk-5-1.png" width="672" />

## Season

I want to turn the focus now to the seasonality of the data. I will use a helper function `getSeason()` that I took from [StackOverflow](https://stackoverflow.com/questions/9500114/find-which-season-a-particular-date-belongs-to).



We can inspect the effect of season on my walking.

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/unnamed-chunk-6-1.png" width="672" />


The plot above is not good, it fails to communicate. I think this is a better way to show the data. 

<img src="/post/2019-11-22-fitbit-analysis/index_files/figure-html/unnamed-chunk-7-1.png" width="672" />


## A year's heart rate in one plot

I'm borrowing **heavily** from [Nick](https://livefreeordichotomize.com/2017/12/27/a-year-as-told-by-fitbit/) here. But I thought it was a brilliant plot, so I took it for a ride with my data. I actually changed a few things, I decided to keep the native sampling rate and use `geom_line()` instead of down-sampling and using `geom_tile()`. The overall trend is clear, movements during the morning and the afternoon that correlate well with going and coming back from work. Somewhere around July 2019 you can see the change in timezone when I took vacations. There are a couple of days in late May with continuously high or lacking values, I take this as one of the days I forgot the fitbit at home, likely spurious measures. 



<center>
![](/img/heart_plot.png)
</center>

## Code

The code for this post is quite long and I thought it would get in the way. I am happy to share upon request, hit me up on [Twitter](https://twitter.com/NeuroMLA).

## Sources

* https://livefreeordichotomize.com/2017/12/27/a-year-as-told-by-fitbit/
