class UsersController < ApplicationController

  def index
    redirect_to :controller => 'registries', :action => 'week', :id => current_week
  end

end
