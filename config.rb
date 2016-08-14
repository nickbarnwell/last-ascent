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

activate :sprockets
sprockets.append_path 'last_ascent_styles'
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :haml, { :ugly => true, :format => :html5 }

##################
# Blog settings  #
##################

Time.zone = "America/Los_Angeles"

set :markdown_engine, :redcarpet
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true,
    :fenced_code_blocks => true, :smartypants => true, :quote => true

# page "/blog/", :layout => :blog
page "/log/feed.xml", :layout => false
page "/feed.xml", :proxy => "/log/feed.xml", :layout => false

activate :blog do |blog|
  blog.prefix = "log"
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

  blog.tag_template = "log/tag.html"
  blog.calendar_template = "log/calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

# Build-specific configuration
set :build_dir, 'build'

configure :build do
  # Minify static content
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Optimise Images
  activate :imageoptim do |opt|
    opt.jpegoptim = { :strip => ['all'], :max_quality => 80 }
    opt.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
  end

  # Enable cache buster
  # activate :cache_buster
  
  # Don't use relative URLs
  #activate :relative_assets
  activate :asset_hash

  # GZIP JS and CSS
  activate :gzip
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :s3_sync do |s3|
  s3.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  s3.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  s3.bucket = 'www.lastascent.com'
  s3.region = 'us-east-1'
  s3.after_build = false
end

default_caching_policy max_age:(60 * 60 * 24 * 365)
caching_policy 'text/html', max_age: 0, must_revalidate: true

activate :cloudfront do |config|
  config.access_key_id      = ENV['AWS_ACCESS_KEY_ID']
  config.secret_access_key  = ENV['AWS_SECRET_ACCESS_KEY']
  config.distribution_id    = 'E10P6XULRJMW57'
  config.after_build        = false
end

configure :development do
  set :debug_assets, true
end

activate :directory_indexes
activate :livereload
