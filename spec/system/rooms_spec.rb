require 'rails_helper'

RSpec.describe "ルームの退出機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'ルームの退出するをクリックするとトップページに戻る' do
    # サインインする
     sign_in(@room_user.user)
    # 作成されたチャットルームへ遷移する
     click_on(@room_user.room.name)
    #退出するボタンを押す
     click_on('退出する')
    #トップページへ戻る
     expect(current_path).to eq(root_path)
  end
end
