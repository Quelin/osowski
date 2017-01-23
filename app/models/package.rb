class Package < ApplicationRecord
	belongs_to :service

	validates_presence_of :name, :link
	validates :name, uniqueness: {scope: :service_id}
end
