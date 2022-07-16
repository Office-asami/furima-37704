class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z}
  validates :family_name_kana, presence: true, format: { with: /\p{katakana}/}
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}/}
  validates :birth_day, presence: true

end
