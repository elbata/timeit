class RegistriesController < ApplicationController

  before_filter :check_week_range, :only => :week

  def week
    @week = params[:id].to_i
    @planifications = current_user.planifications_for_week @week
  end

  def update_planification
    @planification = Planification.find_by_id params[:id]
    @planification.update_attribute(:hours, params[:hours])
    redirect_to :back
  end

  private

  def check_week_range
    unless (1..14).include? params[:id].to_i
      redirect_to :action => 'week', :id => current_week
    end
  end

end
