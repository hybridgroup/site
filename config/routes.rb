ActionController::Routing::Routes.draw do |map|
  map.root        :controller => "root", :action => "index"
  map.community   '/community',  :controller => "root", :action => "community"
  map.members     '/community/members',
    :controller => 'root', :action => 'members'
  map.contact_us  '/contact-us', :controller => "root", :action => "contact_us"
  map.venue       '/venue',      :controller => "root", :action => "venue"
  map.home        '/home',       :controller => 'users', :action => 'current'
  map.last_year   'last-year',   :controller => 'root', :action => 'last_year'

  map.badges "/badges", :controller => 'root', :action => 'badges'

  map.resource :session, :member => { :reset => [:get, :post] }

  map.resources :users do |user|
    user.resources :profiles
    user.resources :proposals
  end

  map.resources :sponsors
  map.resources :proposals, 
    :member => { :view_comments => :post },
    :member => { :liked => :get } do |proposal|
    proposal.resources :comments
    proposal.resources :votes
  end
  map.resources :presentations
  map.resources :speakers
  map.resources :profiles

  map.admin "/admin", :controller => 'admin/root', :action => 'index'

  map.dash "/dashboard", :controller => 'dashboard/root', :action => 'index'

  map.namespace :admin do |admin|
    admin.resources :users do |user|
      user.resources :profiles
    end
    admin.resources :news_items
    admin.resources :sponsors
    admin.resources :presentations
    admin.resources :speakers
    admin.resources :feedbacks,
      :collection => {:search => :get},
      :member => {:review => :get}
  end

  feedback_actions = {:new => :get, :create => :post}
  map.resources(:feedbacks, :as => 'feedback',
                :controller => 'feedback', :member => feedback_actions,
                :only => feedback_actions.keys)


  map.connect 'thank-you', :controller => 'root', :action => 'thank_you'

  # Old system route saves
  map.connect 'menu/speakers', :controller => 'speakers', :action => 'index'
  map.connect 'schedule', :controller => 'presentations', :action => 'index'
  map.connect 'menu/venue', :controller => 'root', :aciton => 'venue'
  map.connect 'menu/sponsors', :controller => 'sponsors', :action => 'index'
end
