class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname 
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください"} do
      validates :first_name
      validates :family_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください"} do
      validates :first_name_kana
      validates :family_name_kana
    end
    validates :birthday
    validates :email,
              format: {
                with: /@.+/,
                message: "は＠が含まれていません"
              }
    validates :password, presence:true, length: { minimum: 6 },
              format: {
                with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
                message: "は半角英数字混合で入力してください"
              }
  end
  has_many :orders
  has_many :items
end
