class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

         scope :firmy, -> { where(firma: true) }
         scope :osoby_prywatne, -> { where(firma: false) }

         #validates :REGON, length: { is: 9 , message: "Wpisz 9 cyfr" }
         #validates :NIP, length: { is: 10 , message: "Wpisz 10 cyfr" }
         #validates_presence_of :name, :lastname, :phone, :kod, :ulica, :miasto
end
