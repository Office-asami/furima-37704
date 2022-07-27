class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_FAMILY_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :family_name, format: { with: VALID_FAMILY_NAME_REGEX }
  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :first_name, format: { with: VALID_FIRST_NAME_REGEX }
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :family_name_kana, format: { with: VALID_NAMEKANA_REGEX }
  validates :first_name_kana, format: { with: VALID_NAMEKANA_REGEX }

end
