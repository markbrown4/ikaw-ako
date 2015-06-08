
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

sprockets.append_path File.join root, 'source/bower_components'

activate :directory_indexes
activate :autoprefixer
activate :livereload
activate :i18n, :langs => [:jp, :en]

activate :blog do |blog|
  blog.name = "news"
  blog.sources = "news/{year}-{title}.jp.html"
  blog.permalink = "news/{year}-{title}.html"
  blog.paginate = true
  blog.per_page = 5
  blog.summary_separator = /READMORE/
end

activate :blog do |blog|
  blog.name = 'english_news'
  blog.sources = "news/{year}-{title}.en.html"
  blog.permalink = "en/news/{year}-{title}.html"
  blog.paginate = true
  blog.per_page = 5
  blog.summary_separator = /READMORE/
end

configure :build do
  ignore 'bower_components/*'
  ignore 'icons/*'

  activate :minify_css
  activate :minify_javascript
  activate :automatic_image_sizes
end

activate :deploy do |deploy|
  deploy.method = :git
end

page "news/*", :layout => :news
page "news/feed.xml", :layout => false

page "en/news/*", :layout => :news
page "en/news/feed.xml", :layout => false

# Methods defined in the helpers block are available in templates
helpers do

  def nav_active(path)
    (current_page.path == path || current_page.path == "en/#{ path }") ? {:class => "active"} : {}
  end

  def main_nav_active(page)
    current_page.data.active_menu == page ? {:class => "active"} : {}
  end

end
