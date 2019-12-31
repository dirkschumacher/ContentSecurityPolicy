
#' Define a content security policy
#'
#' @param ... CSP directives
#'
#' @examples
#' # this is a default CSP that works with shiny:
#' csp <- content_security_policy(
#'   default_src(self),
#'   script_src(unsafe_inline),
#'   style_src(unsafe_inline),
#'   img_src(self, "data:")
#' )
#'
#' @export
#' @rdname csp
content_security_policy <- function(...) {
  directives <- list(...)
  structure(directives, class = "csp_policy")
}

#' @export
format.csp_policy <- function(x, ...) {
  paste0(lapply(x, format), collapse = " ")
}

#' @export
print.csp_policy <- function(x, ...) {
  cat(format(x, ...))
}

#' @export
#' @rdname csp
default_src <- function(...) {
  generic_directive("default-src", ...)
}

#' @export
#' @rdname csp
img_src <- function(...) {
  generic_directive("img-src", ...)
}

#' @export
#' @rdname csp
media_src <- function(...) {
  generic_directive("media-src", ...)
}

#' @export
#' @rdname csp
style_src <- function(...) {
  generic_directive("style-src", ...)
}

#' @export
#' @rdname csp
script_src <- function(...) {
  generic_directive("script-src", ...)
}

#' @export
format.csp_policy_directive <- function(x, ...) {
  paste0(
    x[["name"]],
    " ",
    paste0(lapply(x[["values"]], format), collapse = " "),
    ";"
  )
}

#' @export
print.csp_policy_directive <- function(x, ...) {
  cat("CSP directive:", format(x, ...))
}

#' @export
#' @rdname csp
none <- structure("none", class = "csp_option")

#' @export
#' @rdname csp
unsafe_inline <- structure("unsafe-inline", class = "csp_option")

#' @export
#' @rdname csp
self <- structure("self", class = "csp_option")

#' @export
format.csp_option <- function(x, ...) {
  paste0("'", as.character(x), "'")
}

#' @export
print.csp_option <- function(x, ...) {
  cat("CSP value:", format(x, ...))
}

generic_directive <- function(name, ...) {
  structure(
    list(name = name, values = list(...)),
    class = "csp_policy_directive"
  )
}
