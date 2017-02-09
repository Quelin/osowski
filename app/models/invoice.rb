class Invoice < ApplicationRecord
	belongs_to :service
	belongs_to :user


	validates_presence_of :name, :link
	validates :name, uniqueness: {scope: :service_id}
end
