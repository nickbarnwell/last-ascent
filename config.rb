require 'sass'
require 'stamp'

activate :sprockets
sprockets.append_path 'last_ascent_styles'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :haml, { :ugly => true, :format => :html5 }

Time.zone = "America/Los_Angeles"

set :markdown_engine, :redcarpet
set :markdown, 
    autolink:           true,
    fenced_code_blocks: true,
    no_intra_emphasis:  true,
    strikethrough:      true,
    tables:             true,
    quote:              true,
    smartypants:        true

class CustomMarkdown < Middleman::Extension
  $markdown_options = {
    autolink:           true,
    fenced_code_blocks: true,
    no_intra_emphasis:  true,
    strikethrough:      true,
    tables:             true,
    quote:              true,
    smartypants:        true
  }

  # Markdown files
  def initialize(app, options_hash={}, &block)
    super
    app.set :markdown_engine, :redcarpet
    app.set :markdown, $markdown_options
  end

  # HAML Markdown filter
  module Haml::Filters
    remove_filter("Markdown")

    module Markdown
      include Haml::Filters::Base

      def render text
        markdown.render text
      end

      class MarkdownRenderer < Redcarpet::Render::HTML
        def block_code(code, language)
          Middleman::Syntax::Highlighter.highlight(code.force_encoding("UTF-8"), language)
        end
      end

      private

      def markdown
        @markdown ||= Redcarpet::Markdown.new MarkdownRenderer.new($markdown_options), $markdown_options
      end
    end
  end

  # TOC helper
  helpers do
    # Based on https://github.com/vmg/redcarpet/pull/186#issuecomment-22783188
    def toc(page)
      html_toc = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
      file = ::File.read(page.source_file)

      # remove YAML frontmatter
      file = file.gsub(/^(---\s*\n.*?\n?)^(---\s*$\n?)/m,'')

      # quick fix for HAML: remove :markdown filter and indentation
      file = file.gsub(/:markdown\n/,'')
      file = file.gsub(/\t/,'')

      html_toc.render file
    end
  end
end
::Middleman::Extensions.register(:custom_markdown, CustomMarkdown)

page "/log/feed.xml", :layout => false
page "/feed.xml", :proxy => "/log/feed.xml", :layout => false

activate :blog do |blog|
  #blog.prefix = "log"
  # blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = "log/posts/:year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "post"
  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".md"

  #blog.tag_template = "log/tag.html"
  #blog.calendar_template = "log/calendar.html"

  #blog.paginate = true
  #blog.per_page = 10
  #blog.page_link = "page/:num"
end

# Build-specific configuration
set :build_dir, 'build'

configure :build do
  # Minify static content
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Optimise Images

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

activate :livereload
activate :directory_indexes
