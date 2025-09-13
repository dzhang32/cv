# Knit CV to HTML.
rmarkdown::render(
    "cv.rmd",
    params = list(pdf_mode = FALSE),
    output_file = "docs/index.html"
)

# Knit CV to temporary HTML.
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(
    "cv.rmd",
    params = list(pdf_mode = FALSE),
    output_file = tmp_html_cv_loc
)

# Convert temporary HTML to PDF.
pagedown::chrome_print(input = tmp_html_cv_loc, output = "docs/dz_cv.pdf")
