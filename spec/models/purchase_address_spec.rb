require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'tokenとpost_code,prefecture_id,municipality,address,phone_numberがあれば保存ができること' do
      expect(@purchase_address).to be_valid
    end

    it 'building_nameが無くても保存ができること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では保存ができないこと' do
      @purchase_address.post_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'post_codeが半角ハイフンを含んだ正しい形式でないと保存ができないこと' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('郵便番号はハイフンを含めて半角数字で入力してください')
    end

    it 'prefecture_idが1では保存ができないこと' do
      @purchase_address.prefecture_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('都道府県を選択してください')
    end

    it 'municipalityが空では保存ができないこと' do
      @purchase_address.municipality = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'addressが空では保存ができないこと' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空では保存ができないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberが9桁以下では保存ができないこと' do
      @purchase_address.phone_number = '999999999'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('電話番号はハイフンを含めずに半角数字で入力してください')
    end

    it 'phone_numberが12桁以上では保存ができないこと' do
      @purchase_address.phone_number = '999999999999'
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include('電話番号はハイフンを含めずに半角数字で入力してください')
    end

    it 'phone_numberが半角数値ではないと保存ができないこと' do
      @purchase_address.phone_number = '９９９９９９９９９９９'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('電話番号はハイフンを含めずに半角数字で入力してください')
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
    end
  end
end
