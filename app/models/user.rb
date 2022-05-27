class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :nickname, presence: true
  #validates :name_lastname, presence: true
  #validates :name_firstname, presence: true
  #validates :name_kana_lastname, presence: true
  #validates :name_kana_firstname, presence: true
  #validates :birthdate, presence: true

  #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには英字と数字の両方を含めて設定してください'

end
