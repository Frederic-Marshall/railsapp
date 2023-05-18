class User < ApplicationRecord
  has_secure_password
  has_many :questions

  def author?(obj)
    obj.user == self
  end

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  
  def downcase_nickname
    nickname.downcase!
  end
end
