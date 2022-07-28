class Item < ApplicationRecord
  belongs_to :user
  has_one    :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :handling_time

  validates :title, :string, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 
  
end
