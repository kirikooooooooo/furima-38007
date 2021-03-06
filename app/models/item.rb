class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :condition_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "¥300~¥9,999,999の間で設定してください"}
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end
