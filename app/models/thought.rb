class Thought < ActiveRecord::Base
	belongs_to :day
	belongs_to :user
	
	validates_presence_of :title, :value
end
