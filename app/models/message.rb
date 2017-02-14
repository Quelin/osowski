class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :content, :nickname


  validates :content,
    presence: true

  validates :nickname,
    absence: true

end