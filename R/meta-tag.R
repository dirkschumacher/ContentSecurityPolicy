#' Convert the CSP to a meta tag
#'
#' @param csp a content security policy.
#'
#' This requires the shiny package.
#'
#' @export
as_shiny_meta_tag <- function(csp) {
  if (!requireNamespace("shiny", quietly = TRUE)) {
    stop("You need the shiny package to use this function")
  }
  shiny::tags$meta(
    `http-equiv` = "Content-Security-Policy",
    content = format(csp)
  )
}
