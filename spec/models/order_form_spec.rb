require 'rails_helper'

describe OrderForm, type: :model do
  describe '#create' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    context '配送先入力が全て入力されている時' do

      it '全ての項目を入力すると登録ができる' do
        expect(@order_form).to be_valid
      end

      it 'buildingがなくても登録できる' do
        @order_form.building= ''
        expect(@order_form).to be_valid
      end

    end

    context '配送先入力が上手くいかない時' do
      it 'postalcode_idがない場合は登録できないこと' do
        @order_form.postalcode_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postalcode can't be blank")
      end

      it 'postalcode_idのハイフンがない場合は登録できないこと' do
        @order_form.postalcode_id = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
      end

      it 'prefecture_idがない場合は登録できないこと' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idID1が選択されていた場合は出品できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityがない場合は登録できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'housenumberがない場合は登録できないこと' do
        @order_form.housenumber = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Housenumber can't be blank")
      end

      it 'phonenumberがない場合は登録できないこと' do
        @order_form.phonenumber = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it 'phonenumberが11文字以内でない場合は登録できないこと' do
        @order_form.phonenumber = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phonenumber is invalid.')
      end

      it 'tokenがない場合は登録できないこと' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
