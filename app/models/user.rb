class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

         scope :firmy, -> { where(firma: true) }
         scope :osoby_prywatne, -> { where(firma: false) }

         validates :REGON, length: { is: 9 , message: "is a 9-digit code" }, allow_blank: true
         validates_presence_of :name, :lastname, :phone, :kod, :ulica, :miasto
         validates_numericality_of :phone
		 validates_numericality_of :REGON, :NIP, allow_blank: true
         validates :NIP, length: { is: 10 }, allow_blank: true
         
         

end
