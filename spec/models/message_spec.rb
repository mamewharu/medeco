require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ投稿機能' do
    before do
      @message = FactoryBot.build(:message)
    end

    #投稿の正常系テストコード 
    it 'textと画像が存在していれば投稿できること' do
      expect(@message).to be_valid
    end
    it 'textが空でも投稿できること' do
      @message.text = ''
      expect(@message).to be_valid
    end
    it '画像が空でも投稿できること'do
      @message.image = nil
      expect(@message).to be_valid
    end

    #投稿の異常テストコード 
    it 'textと画像がないと投稿できないこと' do
      @message.text = ''
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Text can't be blank")
    end

    #外部キーの異常テストコード
    it 'roomと紐づいていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('Room must exist')
    end
    it 'userと紐づいていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('User must exist')
    end
  end
end
