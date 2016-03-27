###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


activate :directory_indexes
set :relative_links, true


data.portfolio.portfolio.each do |project|
  proxy "/work/#{project.slug}/index.html", "/work/work-detail.html", :locals => { :project => project }, :ignore => true
end


# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end


# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

# github project pages deploy
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
end
