class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password,
  format: { with: VALID_PASSWORD_REGEX, allow_blank: true, message: 'is invalid. Input alphanumeric characters.' }

  with_options presence: true do
    validates :nick_name
    validates :last_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: 'is invalid. Input full-width characters.' }
    validates :first_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: 'is invalid. Input full-width characters.' }
    validates :last_name_katakana,
              format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_katakana,
              format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
  end
end
