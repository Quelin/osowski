class Service < ApplicationRecord
	belongs_to :user
	

	validates_presence_of :name
	validates_presence_of :end_date, :if => :start_date?
	validates_presence_of :start_date, :if => :end_date?

	
	def status

  		self.is_serviced ? "Yes" : "No"

	end
end
