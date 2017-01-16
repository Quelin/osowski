class Service < ApplicationRecord
	belongs_to :user
	

	def status

  		self.is_serviced ? "Yes" : "No"

	end
end
