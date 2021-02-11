class Item < ApplicationRecord
  has_one_attached :image
  validates :name, :informaion, presence: true
  validates :category_id,:burden_of_shipping_charges_id,:shipping_area_id,:estimated_shipping_id,:product_condition_id, numericality: { other_than: 1 } 

  validates :name,                          presence: true
  validates :informaion,                     presence: true
  validates :category_id,                    presence: true
  validates :burden_of_shipping_charges_id,  presence: true
  validates :shipping_area_id,               presence: true
  validates :estimated_shipping_id,          presence: true
  validates :product_condition_id,           presence: true


  validates_inclusion_of:price,in:300..99999999, message: '¥300円から¥9,9999,9999の範囲でお願いいたします。'
  validates :price, numericality: {with:/\A[0-9]+\z/, message: '販売価格は半角数字で記載をお願いいたします。'}
  belongs_to :user
  #has_one :buy
 
end