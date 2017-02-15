class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :services
  has_many :packages
  has_many :invoices
  has_many :instructions


  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

         scope :organization, -> { where(is_organization: true) }
         scope :private_person, -> { where(is_organization: false) }

         validates :REGON, length: { is: 9 }, allow_blank: true
         validates_presence_of :name, :lastname, :postcode, :street, :town, :mobile_phone
         validates_numericality_of :mobile_phone
		     validates_numericality_of :REGON, :NIP, :phone, allow_blank: true
         validates :NIP, length: { is: 10 }, allow_blank: true
         
         validates :NIP, :organization_name, :presence => true, :if => :is_organization?
         validates :NIP, :REGON, :organization_name, absence: true, :unless => :is_organization?

end
