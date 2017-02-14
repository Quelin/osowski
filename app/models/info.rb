class Info

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::AttributeAssignment


  attr_accessor :nickname, :email, :content



  validates :email,
    presence: true

  validates :content,
    presence: true

  validates :nickname,
    absence: true

end