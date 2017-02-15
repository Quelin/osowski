class Instruction < ApplicationRecord

	belongs_to :user


	validates_presence_of :name, :link
	validates :name, uniqueness: {scope: :user_id}

end
