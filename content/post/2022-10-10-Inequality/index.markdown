---
title: Inequality
subtitle: Makeover of Pyramid Plot
date: 2022-10-10
author: "Matias Andina"
tags: ["fun", "design"]
editor_options: 
  markdown: 
    wrap: 72
---

I love [Future Crunch](https://futurecrunch.com/). The idea of receiving positive news that I wouldn’t otherwise get is fantastic and I appreciate the work they do. However, during one of the latest editions I got a pyramid plot coming from [Credit Suisse](https://www.credit-suisse.com/about-us-news/en/articles/news-and-expertise/credit-suisse-global-wealth-report-2022-fast-wealth-growth-in-times-of-uncertainty-202209.html?ref=Future+Crunch-newsletter) which was really hard to read. Moreover, the people who made the plot were trying to make the case that the world is a better place, because there is less inequality.

You are welcome to try to interpret the plot on its source, [here’s the link again](https://www.credit-suisse.com/about-us-news/en/articles/news-and-expertise/credit-suisse-global-wealth-report-2022-fast-wealth-growth-in-times-of-uncertainty-202209.html?ref=Future+Crunch-newsletter). Because I think the representation is lacking, I do want to produce my own version using their data (aka, the values provided in their plot). Here’s a basic table for their data:

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#elqzfuackm .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#elqzfuackm .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#elqzfuackm .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#elqzfuackm .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#elqzfuackm .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#elqzfuackm .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#elqzfuackm .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#elqzfuackm .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#elqzfuackm .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#elqzfuackm .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#elqzfuackm .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#elqzfuackm .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#elqzfuackm .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#elqzfuackm .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#elqzfuackm .gt_from_md > :first-child {
  margin-top: 0;
}

#elqzfuackm .gt_from_md > :last-child {
  margin-bottom: 0;
}

#elqzfuackm .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#elqzfuackm .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#elqzfuackm .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#elqzfuackm .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#elqzfuackm .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#elqzfuackm .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#elqzfuackm .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#elqzfuackm .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#elqzfuackm .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#elqzfuackm .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#elqzfuackm .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#elqzfuackm .gt_left {
  text-align: left;
}

#elqzfuackm .gt_center {
  text-align: center;
}

#elqzfuackm .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#elqzfuackm .gt_font_normal {
  font-weight: normal;
}

#elqzfuackm .gt_font_bold {
  font-weight: bold;
}

#elqzfuackm .gt_font_italic {
  font-style: italic;
}

#elqzfuackm .gt_super {
  font-size: 65%;
}

#elqzfuackm .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="elqzfuackm" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Bracket</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Bracket2</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">People (M)</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">&lt;10K</td>
      <td class="gt_row gt_left">&lt;10K</td>
      <td class="gt_row gt_left">2011</td>
      <td class="gt_row gt_right">3054.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">&lt;10K</td>
      <td class="gt_row gt_left">&lt;10K</td>
      <td class="gt_row gt_left">2021</td>
      <td class="gt_row gt_right">2818.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">10K-100K</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2011</td>
      <td class="gt_row gt_right">1066.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">10K-100K</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2021</td>
      <td class="gt_row gt_right">1791.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">100K-1M</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2011</td>
      <td class="gt_row gt_right">369.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">100K-1M</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2021</td>
      <td class="gt_row gt_right">627.0</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1M+</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2011</td>
      <td class="gt_row gt_right">29.7</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">1M+</td>
      <td class="gt_row gt_left">10K+</td>
      <td class="gt_row gt_left">2021</td>
      <td class="gt_row gt_right">62.5</td>
    </tr>
  </tbody>
  
  
</table></div>

## Why I don’t like the pyramid plot

- Pyramids have angles, I strive to stay away from angles.
- The x axis is reversed.
- All quantities are changing but there are horizontal levels trying to guide us. I think they do more harm than good.
  - These horizontal levels play the role of a y axis, only to add confusion because the scale is logarithmic.

## Enter Waffle

I think Waffle plots are a fantastic alternative to all the nasty pie and pyramid plots. The representation of fractions is clear and explicit, and there are no angles that mess things up. I kept their colors to make it as similar as possible. Note that the world’s population has increased, so 1 square (or 1% of the population) is different on the 2011 and 2021 plots.

<img src="{{< blogdown/postref >}}index_files/figure-html/firstwaffle-1.png" width="672" />

## The case

The case that people are trying to make is: “Good News! There’s more people in the wealthier categories!”. For sure, we can say that these numbers indeed point towards the right direction. Is it fast enough? That depends on how much expectations you had for the global change we can achieve in one decade. If anything, things are better, but we have much room for improvement.

In the following plot, I tried to focus attention on the bottom bracket. If we manage to get people out of the bottom bracket, that would be a huge triumph for global development.

<img src="{{< blogdown/postref >}}index_files/figure-html/secondwaffle-1.png" width="672" />

We are making progress. Progress is slow, but the share of people living in the bottom bracket is decreasing. However, looking at these plots, I cannot help but notice the immense task we have ahead: we still have to lift half of the planet out of this bracket. This challenge is something I wanted to convey, and I think it’s more evident in these waffle than the pyramid plots. I think Hans, put it better than anyone:

> Things can be bad, and getting better.
> – Hans Rosling

## The downside

There are downsides of using Waffle Plots. I’m quoting from a nice person who gave me feedback directly, they said: “One disadvantage of the waffle plot is a lack of precision. For instance, your version doesn’t show the change at the top from .5% to 1.2% (more than double!)”.

I was somewhat saving this idea for another plot. What idea? The idea that *all* wealthier brackets increased by a lot (2 to 3X!). I decided to go with a bar plot showing the absolute number of people. This is because I want to keep numbers in terms of people, real human beings that belong to each bracket. Each person that we move is a lot, and we have a lot to do!

<img src="{{< blogdown/postref >}}index_files/figure-html/colplot-1.png" width="192" />

This is not the only issue with waffle plots. As I said before, the wealth brackets here are logarithmic, and the highest bracket is virtually infinite. Counting methods (aka, counting how many people belong to each bracket), can go far to give a sense of the overall distribution, but cannot bring a picture of the massive differences in wealth between the higher and the lower brackets when the axis is discretized to condense a logarithmic scale. Looking further the actual wealth range exceeds my intentions for this quick makeover, but I couldn’t help to mention it.

## Support this content

------------------------------------------------------------------------

<blockquote>
<p>I write fiction and non-fiction.<br/>
I write open-source software.<br/>
I create generative art.  </p>

<p>All of these are available for free in different media.
If you like what I do, and want me to keep creating, you can contribute using the links below.</p>
</blockquote>

<table style="width:100%">
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

------------------------------------------------------------------------
