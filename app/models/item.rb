class Item < ApplicationRecord
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :informaion
    validates :category_id
    validates :burden_of_shipping_charges_id
    validates :shipping_area_id
    validates :estimated_shipping_id
    validates :product_condition_id
    validates :price
    validates :image
  end
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :burden_of_shipping_charges_id
      validates :shipping_area_id
      validates :estimated_shipping_id
      validates :product_condition_id
    end

  validates_inclusion_of :price,in:300..9999999, message: '¥300円から¥9,999,999の範囲でお願いいたします。'
  validates :price, numericality: {with:/\A[0-9]+\z/, message: '販売価格は半角数字で記載をお願いいたします。'}
  belongs_to :user
  #has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden_of_shipping_charges
  belongs_to :shipping_area
  belongs_to :product_condition
  belongs_to :estimated_shipping
  belongs_to :category
end