class Service < ApplicationRecord
	belongs_to :user
	

	def status

  		self.own_equipment ? "Yes" : "No"

	end
end
