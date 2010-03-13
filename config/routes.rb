ActionController::Routing::Routes.draw do |map|
  # Add your own custom routes here.
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Here's a sample route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  map.connect '', :controller => "days", :action => "index"
	
  map.connect 'thoughts', :controller => "days", :action => "index"
  map.connect 'day/:id', :controller => "days", :action => "show"
  map.connect 'list', :controller => "thoughts", :action => "list"
	
  # nicer rss feed link
  map.connect 'rss', :controller => "thoughts", :action => "rss"

  # account stuff
  map.connect 'signup', :controller => "account", :action => "signup"
  map.connect 'login', :controller => "account", :action => "login"
  map.connect 'logout', :controller => "account", :action => "logout"

  map.connect 'Euro2005', :controller => "euro", :action => "index"

# Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  #map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
