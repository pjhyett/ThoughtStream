require_dependency "login_system"

class ApplicationController < ActionController::Base
  include LoginSystem
	model :user
end