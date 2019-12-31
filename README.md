
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ContentSecurityPolicy

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `ContentSecurityPolicy` is provide a DSL and helpers
functions for defining [Content Security
Policies](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP#) to
make your Web-Apps more secure.

> Content Security Policy (CSP) is an added layer of security that helps
> to detect and mitigate certain types of attacks, including Cross Site
> Scripting (XSS) and data injection attacks. These attacks are used for
> everything from data theft to site defacement to distribution of
> malware.

*WORK IN PROGRESS - DO NOT USE IN PRODUCTION*

Feedback and contributors welcome\!

## Installation

You can install the released version of ContentSecurityPolicy from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("shinycsp")
remotes::install_github("dirkschumacher/ContentSecurityPolicy")
```

## Example

Take a look at the example shiny app in the `inst/examples` directory.

``` r
library(ContentSecurityPolicy)

csp <- content_security_policy(
    default_src(self),
    script_src(self, unsafe_inline),
    style_src(self, unsafe_inline),
    img_src(self, "data:")
)

print(as_shiny_meta_tag(csp))
#> <meta http-equiv="Content-Security-Policy" content="default-src &#39;self&#39;; script-src &#39;self&#39; &#39;unsafe-inline&#39;; style-src &#39;self&#39; &#39;unsafe-inline&#39;; img-src &#39;self&#39; data:;"/>
```
