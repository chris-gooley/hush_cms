module ActionController
  module Routing
    class RouteSet
      class Mapper
        def hush_cms_pages(path, options = {})          
          named_route 'hush_cms_page', path, :controller => 'hush_cms_pages', :action => 'show'
        end
        
        def hush_cms_admin(path)
          named_route 'hush_cms_admin', path, :controller => 'hush_cms_admin', :action => 'index'
          
          namespace :hush_cms_admin, :path_prefix => path do |a|
            a.resources :categories
            a.resources :pages
            a.resources :posts do |p|
              p.resources :comments
            end
          end
        end
      end
    end
  end
end
