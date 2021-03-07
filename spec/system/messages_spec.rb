require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  context '投稿に失敗したとき' do
    it '送信した値が空だったので失敗すること' do
      # サインインする
       sign_in(@room_user.user)
      # 作成されたチャットルームへ遷移する
       click_on(@room_user.room.name)
      # DBに保存されていないことを確認する
       expect{
         find('input[name="commit"]').click
       }.not_to change{ Message.count }
      # 元のページに戻ってくることを確認する
       expect(current_path).to eq(room_messages_path(@room_user.room))
    end
  end

  context '投稿に成功したとき' do
    it 'textを投稿を送信して成功すること一覧表示に戻り、送信内容が表示されていること' do
     # サインインする
      sign_in(@room_user.user)
     # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
     # textをテキストフォームに入力する
      post = 'テスト'
      fill_in 'message_text', with: post
     # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
     # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(room_messages_path(@room_user.room))
     # 送信した内容がブラウザに表示されていることを確認する
      expect(page).to have_text(post)
    end

    it '画像を投稿すると一覧ページに戻り、画像が表示されていること' do
     # サインインする
      sign_in(@room_user.user)
     # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
     # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
     # 画像選択フォームに画像を添付する
      attach_file('message[image]', image_path, make_visible: true)
     # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
     # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(room_messages_path(@room_user.room))
     # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')
    end

    it 'textと画像の投稿に成功すること' do
      # サインインする
       sign_in(@room_user.user)
      # 作成されたチャットルームへ遷移する
       click_on(@room_user.room.name)
      # 添付する画像を定義する
       image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
       attach_file('message[image]', image_path, make_visible: true)
      # 値をテキストフォームに入力する
       post = 'テスト'
       fill_in 'message_text', with: post
      # 送信した値がDBに保存されていることを確認する
       expect{
         find('input[name="commit"]').click
       }.to change { Message.count }.by(1)
      # 送信した内容がブラウザに表示されていることを確認する
       expect(page).to have_text(post)
      # 送信した画像がブラウザに表示されていることを確認する
       expect(page).to have_selector('img')
    end
  end
end
