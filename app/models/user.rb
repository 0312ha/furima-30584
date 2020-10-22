class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   with_options presence: true do
     validates :nickname,
     validates :familyname_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
     validates :firstname_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
     validates :familyname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
     validates :firstname_kana, format:  { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
     validates :birthday,
   end
end
