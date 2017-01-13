class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :services

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

         scope :organization, -> { where(is_organization: true) }
         scope :private_person, -> { where(is_organization: false) }

         validates :REGON, length: { is: 9 }, allow_blank: true
         validates_presence_of :name, :lastname, :phone, :postcode, :street, :town, :mobile_phone
         validates_numericality_of :phone, :mobile_phone
		     validates_numericality_of :REGON, :NIP, allow_blank: true
         validates :NIP, length: { is: 10 }, allow_blank: true
         
         

end
