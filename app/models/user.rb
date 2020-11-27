class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, null: false
  validates :first_name, null: false
  validates :family_name, null: false
  validates :first_name_kana, null: false
  validates :family_name_kana, null: false
  validates :birthday, null: false
end
