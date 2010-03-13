# TODO: new/create & edit/update can be merged with @request.post?

class ThoughtsController < ApplicationController
  layout 'application', :except => "rss"
  before_filter :login_required, :except => [:index, :rss]

  def list
    @thoughts = Thought.find(:all)
  end

  def new
    @thought = Thought.new
  end
  
  def rss
    @thoughts = Thought.find(:all, :order => 'id desc', :limit => 10)
  end

  def create
    @thought = Thought.new(params[:thought])
    
    # grab last day from db
    @day = Day.find(:first, :order => "date desc")
    
    # if no day yet or no current day, make a new one
    if(@day.nil? || @day.date.yday < Time.now.yday)
      @day = Day.new
      @day.date = Time.now
      @day.save
    end
    @thought.day_id = @day.id
    @thought.user = session[:user]
    
    if @thought.save
      flash[:notice] = 'Thought was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @thought = Thought.find(params[:id])
  end

  def update
    @thought = Thought.find(params[:id])
    if @thought.update_attributes(params[:thought])
      flash[:notice] = 'Thought was successfully updated.'
      redirect_to :controller => 'days', :action => 'show', :id => @thought.day.id, :anchor => "thought-#{@thought.id}"
    else
      render :action => 'edit'
    end
  end

  def destroy
    Thought.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
