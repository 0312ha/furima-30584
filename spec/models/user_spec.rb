require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目を入力すると登録ができる" do
      expect(@user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@がない場合は登録できないこと " do
      @user.email = "@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "パスワードが空の場合は登録ができない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it "passwordが6文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが英文字のみの場合は登録できないこと" do
      @user.password = "abababab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user.password = "abcd123" 
      @user.password_confirmation = "1234abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "familyname_kanjiがない場合は登録できないこと" do
      @user.familyname_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kanji can't be blank")
    end

    it "firstname_kanjiがない場合は登録できないこと" do
      @user.firstname_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
    end

    it "familyname_kanaがない場合は登録できないこと" do
      @user.familyname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      @user.firstname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end

    it "familyname_kanjiが全角文字であれば登録できること" do
      @user.familyname_kanji = "ぜんかく"
      @user.valid?
      expect(@user).to be_valid
    end

    it "firstname_kanjiが全角文字であれば登録できること" do
      @user.firstname_kanji = "ぜんかく"
      @user.valid?
      expect(@user).to be_valid
    end

    it "familyname_kanaが全角カナ文字であれば登録できること" do
      @user.familyname_kana = "カナ"
      @user.valid?
      expect(@user).to be_valid
    end

    it "firstname_kanaが全角カナ文字であれば登録できること" do
      @user.firstname_kana = "カナ"
      @user.valid?
      expect(@user).to be_valid
    end

    it "birthdayがない場合は登録できないこと" do
      @user.birthday= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

