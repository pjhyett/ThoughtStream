class DaysController < ApplicationController
  
  def index
    @day_pages, @days = paginate :day, :per_page => 5, :order => 'id desc'
  end
  
  def show
    @day = Day.find(params[:id])
  end
  
end
