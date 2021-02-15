# This file contains functions to maintain things in the website
# https://blog.jemu.name/2020/05/migrating-themes-and-overhauling-the-rest/#chunk-and-code-folding

# Quickly generate a bunch of highlight styles for testing
# see https://xyproto.github.io/splash/docs/all.html for a list
chroma_gen <- function(style = "monokai") {
  cmd <- glue::glue("hugo gen chromastyles --style={style} > static/css/syntax-{style}.css")
  system(cmd)
}

chroma_gen("monokai")
chroma_gen("monokailight")


# Moving posts
move_rmd_post <- function(path) {
  require(fs)
  post_rmd <- path_rel(path)
  
  post_name <- path_file(post_rmd) %>%
    path_ext_remove() %>%
    stringr::str_remove("\\.en$")
  
  new_post_dir <- path("content", "post", post_name)
  dir_create(new_post_dir)
  
  file_move(post_rmd, path(new_post_dir, "index.Rmarkdown"))
}

move_rmd_post("path-to-old-post.Rmd")

lapply(
  list.files("content/post/", pattern = "Rmd", full.names = T),
  function(tt) move_rmd_post(tt)
)


# This modifies the footnote
# this will not create a js folder if it doesn't exist!
get_asset_unpkg <- function(package, version, file) {
  url <- glue::glue("https://unpkg.com/{package}@v{version}/{file}")
  type <- stringr::str_extract(file, "(css|js)$")
  target_dir <- here::here("static", type)
  dest_file <- glue::glue("{target_dir}/{package}-{version}.{type}")
  
  # Downloading
  download.file(
    url = url,
    destfile = dest_file
  )
  
  # Symlinking
  command <- glue::glue(
    "cd {target_dir}
    ln -sf {package}-{version}.{type} {package}.{type}"
  )
  system(command)
}

# littlefoot.js -----
# https://github.com/goblindegook/littlefoot/releases
littlefoot_version <- "3.2.4"

get_asset_unpkg("littlefoot", littlefoot_version, "dist/littlefoot.js")
get_asset_unpkg("littlefoot", littlefoot_version, "dist/littlefoot.css")