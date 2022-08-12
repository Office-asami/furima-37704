require 'rails_helper'

RSpec.describe BuyerShipping, type: :model do
  describe '購買情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @buyer_shipping = FactoryBot.build(:buyer_shipping, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_shipping).to be_valid
      end
      it 'address2は空でも保存できること' do
        @buyer_shipping.address2 = ''
        expect(@buyer_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buyer_shipping.zip_code = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列の正しい形式でないと保存できないこと' do
        @buyer_shipping.zip_code = '1234567'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buyer_shipping.prefecture_id= '1'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buyer_shipping.city = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと保存できないこと' do
        @buyer_shipping.address1 = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Address1 can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @buyer_shipping.telephone = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は、10桁未満であると保存できないこと' do
        @buyer_shipping.telephone = '12345'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Telephone is invalid. Can't Include hyphen(-)")
      end
      it '電話番号は、12桁以上であると保存できないこと' do
        @buyer_shipping.telephone = '0234512345123'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Telephone is invalid. Can't Include hyphen(-)")
      end
      it '電話番号は半角数値以外保存できないこと' do
        @buyer_shipping.telephone = '020-4512-3451'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Telephone is invalid. Can't Include hyphen(-)")
      end
    end
  end
end