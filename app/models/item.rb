class Item < ApplicationRecord
  belongs_to :user
  has_one    :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden 
  belongs_to :prefecture
  belongs_to :handling_time

  validates :title, presence: true
  validates :category_id, :status_id, :fee_burden_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, numericality: {greater_than: 299,less_than: 10000000}
  VALID_PASSWORD_REGEX = /\A[0-9]+\z/.freeze
  validates :price, format: { with: VALID_PASSWORD_REGEX }
end
