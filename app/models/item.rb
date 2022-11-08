class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :situation, :delivery_charge, :delivery_area, :delivery_days
  has_one_attached :image

  validates :name, :content, :user, :category_id, :situation_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, presence: true

  validates :category_id, :situation_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
