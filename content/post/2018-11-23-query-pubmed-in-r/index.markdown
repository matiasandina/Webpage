---
title: Query Pubmed in R
subtitle: 
date: 2018-11-23
author: "Matias Andina"
tags: ["r","phd"]
---

I have seen a couple of presentations that use plots of PubMed query results. I have even seen some of them in papers. I just think it's really cool, so I wanted to play with something that could provide the data.

A couple of google searches lead me into two nice options to do this in R. 

1) `RISmed` package, see [CRAN](https://cran.r-project.org/web/packages/RISmed/index.html) or [Dave Tang's Blog](https://davetang.org/muse/2013/10/31/querying-pubmed-using-r/)
1) A custom approach from [Kristoffer Magnusson](https://github.com/rpsychologist/PubMed)

I went with the custom approach, decided to **borrow heavily** from Kristoffer's repo, and did a few modifications here and there. Mainly, I updated libraries, included some `dplyr` output to make it cleaner, and separated functions into several files.

You can find the updated code in the following repo: https://github.com/matiasandina/pubmed_query

The logic of the code is to loop over the search terms and the years, performing queries to PubMed each time. To make things more friendly we wrap everything into a *main* function that performs some checks and handles the multiple calls to the working functions. This main function, `query_pubmed()`, expects a query (character vector), and 2 years for the time interval (`yrStart` and `yrMax`).

The function is somewhat self contained, if it can't find things on the local computer it will source from GitHub[^packages]. Here's a little demo of the main function `query_pubmed()`. Since we are using internet to get the data, I assume the user will be able to source from GitHub (these calls are often performed via `devtools::source_url`).

## Little demo



Let's look for the term `hiv` in publications from the 1970 until today. PubMed requests us to limit the traffic to ~3 queries per second. Thus, queries will take a while because the function has `Sys.sleep(0.5)` in between iterations. You will see a progress bar for each term (not shown here for simplicity).


```r
hiv <- query_pubmed("hiv", 1970, 2018)
```

<div class="figure">
<img src="/post/2018-11-23-query-pubmed-in-r/index_files/figure-html/unnamed-chunk-2-1.png" alt="PubMed publications containing the term HIV relative to the total number of publications." width="672" />
<p class="caption">Figure 1: PubMed publications containing the term HIV relative to the total number of publications.</p>
</div>

I chose to keep the graphic output as simple as possible (aka use ggplot2 defaults) and return a `data.frame` that can be fed into a custom `ggplot2` call later, if the users feel like it. Here's a glimpse of the returned object. 


```r
head(hiv)
```

```
##   query_term year count total_count         freq
## 1        hiv 1970     1      219426 0.0004557345
## 2        hiv 1971     0      223609 0.0000000000
## 3        hiv 1972     0      227810 0.0000000000
## 4        hiv 1973     0      231127 0.0000000000
## 5        hiv 1974     0      235110 0.0000000000
## 6        hiv 1975     0      249192 0.0000000000
```

## Making things faster

Total publication numbers should not change[^they_change]. Thus, if we don't want to waste time grabbing the total number of publications over and over, we can either:

1) Use `get_totals()`
2) Get it from GitHub

I will do my best, but I can't be certain I will keep running the function and pushing once a year to GitHub (as in forever)[^automate]. I don't feel like waiting, I already have a recent version in the repo.


```r
# Option one: run the function
# total_table_updated <- get_totals(1947,2018)

# Option two
total_table_updated <- read.csv('https://raw.githubusercontent.com/matiasandina/pubmed_query/master/data/total_table_updated.csv')
```


Having this object around will speed the main function (it will not query PubMed every year for the totals). Here's a graph of the number of publications by year:

<div class="figure">
<img src="/post/2018-11-23-query-pubmed-in-r/index_files/figure-html/unnamed-chunk-5-1.png" alt="Total publications in PubMed by year. Science is growing :)" width="672" />
<p class="caption">Figure 2: Total publications in PubMed by year. Science is growing :)</p>
</div>


## Multiple terms

We can use multiple terms to query, just make a character vector. For example, let's add `aids` and `hepatitis b`:


```r
aids_hepB <- query_pubmed(c('aids', 'hepatitis b'), 1970, 2018)
```

```
## Searching for: aids
```

```
## Searching for: hepatitis b
```

```
## 
## All done!
```

<img src="/post/2018-11-23-query-pubmed-in-r/index_files/figure-html/unnamed-chunk-6-1.png" width="672" />

Because we saved the previous object in the environment, we don't have to query again, we can merge the data and plot all together.


```r
bind_rows(hiv, aids_hepB) %>%
  ggplot(aes(year, freq, fill=query_term)) +
  geom_area(position = "identity",
            alpha=0.6)+
  geom_line(lwd=0.4, color="black")+
  scale_fill_manual(values = c("#EBCF02",
                               "gray10",
                               "#1AD0EE"))+
  theme_bw()+
  theme(legend.position = "bottom",
        legend.title = element_blank())+
  ylab("Relative frequency (%)")
```

<div class="figure">
<img src="/post/2018-11-23-query-pubmed-in-r/index_files/figure-html/unnamed-chunk-7-1.png" alt="Frequency of query terms. Relative to total number of PubMed entries per year." width="672" />
<p class="caption">Figure 3: Frequency of query terms. Relative to total number of PubMed entries per year.</p>
</div>


We see that the term `aids` came first in the literature, before the virus was identified, in the early 1980s. Although strongly correlated with `aids`, `hiv` is a term with higher frequency. Research for `hepatitis b` seems to have kept a constant relative level, growing as much as the total body of research.

***

If you are really dying to know about my session info, be my guest:


```r
sessionInfo()
```

```
## R version 3.6.3 (2020-02-29)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 20.04.1 LTS
## 
## Matrix products: default
## BLAS:   /usr/lib/x86_64-linux-gnu/atlas/libblas.so.3.10.3
## LAPACK: /usr/lib/x86_64-linux-gnu/atlas/liblapack.so.3.10.3
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] dplyr_1.0.2   httr_1.4.1    XML_3.98-1.20 ggplot2_3.3.0
## 
## loaded via a namespace (and not attached):
##  [1] tidyselect_1.1.0  xfun_0.9          remotes_2.1.0    
##  [4] purrr_0.3.2       colorspace_1.4-1  vctrs_0.3.4      
##  [7] generics_0.0.2    testthat_2.2.1    htmltools_0.4.0  
## [10] usethis_1.5.1     yaml_2.2.0        rlang_0.4.7      
## [13] pkgbuild_1.0.4    pillar_1.4.4      glue_1.4.0       
## [16] withr_2.1.2       sessioninfo_1.1.1 lifecycle_0.2.0  
## [19] stringr_1.4.0     munsell_0.5.0     blogdown_0.15    
## [22] gtable_0.3.0      devtools_2.1.0    memoise_1.1.0    
## [25] evaluate_0.14     labeling_0.3      knitr_1.24       
## [28] callr_3.3.1       ps_1.3.0          curl_4.0         
## [31] highr_0.8         Rcpp_1.0.5        scales_1.1.0.9000
## [34] backports_1.1.4   desc_1.2.0        pkgload_1.0.2    
## [37] farver_2.0.3      fs_1.4.1          digest_0.6.20    
## [40] stringi_1.4.3     bookdown_0.13     processx_3.4.1   
## [43] grid_3.6.3        rprojroot_1.3-2   cli_2.3.0        
## [46] tools_3.6.3       magrittr_1.5      tibble_3.0.1     
## [49] crayon_1.3.4      pkgconfig_2.0.2   ellipsis_0.2.0.1 
## [52] prettyunits_1.0.2 assertthat_0.2.1  rmarkdown_1.15   
## [55] R6_2.4.0          compiler_3.6.3
```



[^packages]: Granted, several packages are needed to run the code. I assume users will know how to `install.packages(...)` if in need.

[^automate]: Yes, I guess I could automate it but reaching diminishing returns here...

[^they_change]: There are some variations in the recent years as the data base updates, but shouldn't be significant for these purposes.
