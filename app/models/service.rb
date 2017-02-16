class Service < ApplicationRecord
	belongs_to :user

	has_many :invoices
	has_many :packages
	has_many :components
	

	accepts_nested_attributes_for :components, reject_if: :all_blank, allow_destroy: true


	validates_presence_of :name
	validates :name, uniqueness: {scope: :user_id}
	validates_presence_of :end_date, :if => :start_date?
	validates_presence_of :start_date, :if => :end_date?
	validates :end_date, date: { after_or_equal_to: Proc.new { |obj| obj.try(:start_date).try(:to_date) }, allow_blank: true, message: 'must be after or equal to Start Date'}
	
	def status

  		self.is_serviced ? "Yes" : "No"

	end


end
