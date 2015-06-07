
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

sprockets.append_path File.join root, 'source/bower_components'

activate :directory_indexes
activate :autoprefixer
activate :livereload
activate :i18n, :langs => [:jp, :en]

configure :build do
  ignore 'bower_components/*'
  ignore 'icons/*'

  activate :minify_css
  activate :minify_javascript
  activate :automatic_image_sizes
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
end

# compass_config do |config|
#   config.add_import_path "bower_components/foundation/scss"
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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do

  def nav_active(path)
    (current_page.path == path || current_page.path == "en/#{ path }") ? {:class => "active"} : {}
  end

  def main_nav_active(page)
    current_page.data.active_menu == page ? {:class => "active"} : {}
  end

end
