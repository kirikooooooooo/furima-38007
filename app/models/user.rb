class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name_lastname, presence: true
  validates :name_firstname, presence: true
  validates :name_kana_lastname, presence: true
  validates :name_kana_firstname, presence: true
  validates :birthdate, presence: true
end
