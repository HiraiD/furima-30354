class Item < ApplicationRecord
  has_one_attached :image

  validates :name,                          presence: true
  validates :informaion,                     presence: true
  validates :category_id,                    presence: true
  validates :burden_of_shipping_charges_id,  presence: true
  validates :shipping_area_id,               presence: true
  validates :estimated_shipping_id,          presence: true
  validates :product_condition_id,           presence: true
  validates :user,                           presence: true


  belongs_to :user
  #has_one :buy
end
