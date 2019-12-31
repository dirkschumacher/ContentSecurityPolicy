test_that("multiplication works", {
  csp <- content_security_policy(
    default_src(self),
    script_src(self, unsafe_inline),
    style_src(self, unsafe_inline),
    img_src(self, "data:")
  )
  tag <- as_shiny_meta_tag(csp)
  expect_equal(tag$name, "meta")
  expect_setequal(names(tag$attribs), c("http-equiv", "content"))
})
