class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' } do
    validates :name_lastname
    validates :name_firstname
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' } do
    validates :name_kana_lastname
    validates :name_kana_firstname
  end
  validates :birthdate, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_REGEX, message: 'パスワードには半角英字と半角数字の両方を含めて設定してください'}

end
