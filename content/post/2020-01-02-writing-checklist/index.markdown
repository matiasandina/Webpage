---
title: "Writing Checklist"
author: "Matias Andina"
date: 2020-01-02
output: html_document
tags: ["writing", "learning", "documentinglearning"]
---

I spent a good portion of the end of 2019 and the beginning of 2020 reading Paul Graham's essays. Many caught my attention (and my fingers to take notes). I want to comment on an essay about advice for good writing. Because it was written in a way that allowed for easy reformatting (ideas separated by `;`, I thought it would be cool to convert the prose into a checklist).  

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


## Creating the checklist

The main text comes from [here](http://www.paulgraham.com/writing44.html). For simplicity, I have only used the main paragraph (aka, copy and paste the second paragraph). I omitted it here because it would be long and you can read it in the native format from the source.



In the code chunk below I comment the steps I took.


```r
# text is copy-paste of the second paragraph
# text <- c("...") ... == copy-paste

# split using "; "
sp <- stringr::str_split(text, "; ")

# To create a checklist
# DASH SPACE [ ] SPACE SPACE
sp <- paste0("- [ ]  ", unlist(sp))
# append markdown title
sp <- c("# Paul Graham's Writing Checklist", sp)

# Capitalize first letter of every sentence
sp <- stringr::str_to_sentence(sp)
```

If you want to write it to file, you can use `writeLines()`


```r
# write
fileConn <- file("paul_graham_writing_checklist.md")
writeLines(sp, fileConn)
close(fileConn)

# If you want to knit to html you can do this
# knitr::knit2html("paul_graham_writing_checklist.md")
```

Let's take a look at the product:


```r
# printing for web post
cat(sp, sep = "\n")
```

```
# Paul graham's writing checklist
- [ ]  Write a bad version 1 as fast as you can
- [ ]  Rewrite it over and over
- [ ]  Cut out everything unnecessary
- [ ]  Write in a conversational tone
- [ ]  Develop a nose for bad writing, so you can see and fix it in yours
- [ ]  Imitate writers you like
- [ ]  If you can't get started, tell someone what you plan to write about, then write down what you said
- [ ]  Expect 80% of the ideas in an essay to happen after you start writing it, and 50% of those you start with to be wrong
- [ ]  Be confident enough to cut
- [ ]  Have friends you trust read your stuff and tell you which bits are confusing or drag
- [ ]  Don't (always) make detailed outlines
- [ ]  Mull ideas over for a few days before writing
- [ ]  Carry a small notebook or scrap paper with you
- [ ]  Start writing when you think of the first sentence
- [ ]  If a deadline forces you to start before that, just say the most important sentence first
- [ ]  Write about stuff you like
- [ ]  Don't try to sound impressive
- [ ]  Don't hesitate to change the topic on the fly
- [ ]  Use footnotes to contain digressions
- [ ]  Use anaphora to knit sentences together
- [ ]  Read your essays out loud to see (a) where you stumble over awkward phrases and (b) which bits are boring (the paragraphs you dread reading)
- [ ]  Try to tell the reader something new and useful
- [ ]  Work in fairly big quanta of time
- [ ]  When you restart, begin by rereading what you have so far
- [ ]  When you finish, leave yourself something easy to start with
- [ ]  Accumulate notes for topics you plan to cover at the bottom of the file
- [ ]  Don't feel obliged to cover any of them
- [ ]  Write for a reader who won't read the essay as carefully as you do, just as pop songs are designed to sound ok on crappy car radios
- [ ]  If you say anything mistaken, fix it immediately
- [ ]  Ask friends which sentence you'll regret most
- [ ]  Go back and tone down harsh remarks
- [ ]  Publish stuff online, because an audience makes you write more, and thus generate more ideas
- [ ]  Print out drafts instead of just looking at them on the screen
- [ ]  Use simple, germanic words
- [ ]  Learn to distinguish surprises from digressions
- [ ]  Learn to recognize the approach of an ending, and when one appears, grab it.
```

The checklist is not in strict chronological order, so I might try to reshape it later into something that would make more sense as a timeline. It will render as a checklist in something that is GitHub flavored (e.g., on GitHub). However, I will probably just use it as text file or print it as is. 

I also noticed that the link for the Spanish translation is broken/outdated, so I tried my best to translate it. [Here it is](/2020/01/escribiendo-en-pocas-palabras/)

## Summary

I think this checklist is an awesome learning opportunity and a clear path to improving one's writing. Quite happy to have found it, looking forward to improving my skills.

I got to learn a few cool R things like, 1) I can use `writeLines()` to write a `.md` file and 2) `stringr::str_to_sentence()` is an **awesome** function.
