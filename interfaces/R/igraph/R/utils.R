
add_class <- function(x, class_name) {
  if (! inherits(x, class_name)) {
    class(x) <- c(class_name, attr(x, "class"))
  }
  x
}
