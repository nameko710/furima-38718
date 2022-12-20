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
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角ハイフンを含んだ正しい形式でないと保存ができないこと' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefecture_idが1では保存ができないこと' do
      @purchase_address.prefecture_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'municipalityが空では保存ができないこと' do
      @purchase_address.municipality = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空では保存ができないこと' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では保存ができないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが9桁以下では保存ができないこと' do
      @purchase_address.phone_number = '999999999'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが12桁以上では保存ができないこと' do
      @purchase_address.phone_number = '999999999999'
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが半角数値ではないと保存ができないこと' do
      @purchase_address.phone_number = '９９９９９９９９９９９'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
