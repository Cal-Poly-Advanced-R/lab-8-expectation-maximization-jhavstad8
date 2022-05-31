
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clust431

<!-- badges: start -->
<!-- badges: end -->

The goal of clust431 is to …

## Installation

You can install the released version of clust431 from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("clust431")
```

## em_clust() code example

This is a basic example which shows you how to solve a common problem:

``` r
library(clust431)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
## iris2 <- iris %>% select(-Species)
## em_clust(iris2,2)
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
iris2 <- iris %>% select(-Species)
#em_clust(iris2,2)
```

I wasn’t able to figure the code out for this submission.
