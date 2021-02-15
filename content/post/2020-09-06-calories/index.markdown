---
title: "A calorie is a calorie"
output: html_document
---







The world was a different place around 1960. But humans were humans, roughly similar to those that were alive thousands of years ago and likely, as most humans do, they needed to eat.

The good news is that we have quite some data of humans eating and we have an interminable debate over *how much* should we eat. 

It all boils down to one number: **Total Calories**. They would have us believe that "a calorie is a calorie" and it doesn't matter where it comes from. Well, I'm not going to challenge the assumption on this blog, I'm saving that for later. But I was curious to see the evolution of this magical number across the world since around 1960. 

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

Before we begin, I want to make some brief remarks.

Data from FAO can be found [here](http://fenixservices.fao.org/faostat/static/bulkdownloads/FoodBalanceSheetsHistoric_E_All_Data.zip).

> **NOTE:** In this analysis, calorie data contains all what's available for consumption, including waste, which can unfortunatelly be significant. Also note that "Calorie" is easier to write about than kiloCalorie, which is the unit we are actually referring to.

### Spagetthi Trend

<img src="/post/2020-09-06-calories/index_files/figure-html/unnamed-chunk-2-1.png" width="672" />

This looks mostly like an upward trend. In fact, just for fun, I am going to simplify this whole situation into the before/after scenario. The trend is so clear that I'm not going to lose too much information.

<img src="/post/2020-09-06-calories/index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

In the plot above, we see that most countries increase their food supply as measured by the calories available for consumption since 1960. We can more easily observe each country's travel in the calorie spectrum in the dot plot below. An interesting thing to focus on this plot is the little amount of countries that have stayed around the dietary guidelines (1900 to 2400 kCal/day/person).

<img src="/post/2020-09-06-calories/index_files/figure-html/unnamed-chunk-4-1.png" width="672" />


### How much of an increase

When we look at the calorie increase as a proportion of the original available, we see most countries increasing calories between 5% and 25%, with a good number of countries increasing heavily, even doubling their calories.  

<img src="/post/2020-09-06-calories/index_files/figure-html/unnamed-chunk-5-1.png" width="672" />

Can you make it move? Yes! To nail the point home, I want to add some motion to the plots, to see the World's constant move into higher and higher calorie values. Surprisingly, we don't see the world moving above 2000 calories and narrowing the distribution into an efficent "Enough food for everyone without waste" stage. We see this terrifying amoeba-like distribution creep into higher and higher caloric values.



<!--html_preserve-->{{% tweet "1302668758125875203" %}}<!--/html_preserve-->


I found this *waterfall (?)* plot to be also quite telling about the overall movement by decade. 

![](index_files/figure-html/unnamed-chunk-7-1.gif)<!-- -->

![](waterfall.gif)

### The good and the Bad

Good news is we lifted an incredible amount of people out of poverty. With that, we see the daily available calories in all countries go up above a somewhat arbitrary 2000 Calories/day/person. The bad news, is that  


![](index_files/figure-html/points-going-up-1.gif)<!-- -->
![](points_going_up.gif)

Calories are just the tip of the iceberg. If you want to see analysis at the macro levels, check my post about cereals.  
