require 'sass'
require 'stamp'

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

sprockets.append_path 'tws_stylesheets'
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :haml, { :ugly => true, :format => :html5 }

##################
# Blog settings  #
##################

Time.zone = "America/Los_Angeles"

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true,
    :fenced_code_blocks => true, :smartypants => true
set :markdown_engine, :redcarpet

# page "/blog/", :layout => :blog
# page "/blog/feed.xml", :layout => false
# page "/feed.xml", :proxy => "/blog/feed.xml", :layout => false

activate :blog do |blog|
  blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "post"
  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".md"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

# Build-specific configuration
set :build_dir, 'tmp'

configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :s3_sync do |s3|
  s3.aws_access_key_id = ''
  s3.aws_secret_access_key = ''
  s3.bucket = ''
  s3.region = 'us-east-1'
  s3.after_build = false
end

configure :development do
  set :debug_assets, true
end

activate :directory_indexes
activate :livereload
