require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'ルーム登録機能' do
    before do
  @room = FactoryBot.build(:room)
    end

    #正常系のテストコード
    it 'nameがあれば登録できる' do
      expect(@room).to be_valid
    end

    #異常系のテストコード
    it 'nameが空だと登録できない' do
      @room.name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end
