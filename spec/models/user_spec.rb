require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
   before do
      @user = FactoryBot.build(:user)
   end

   it 'nameとemail、passwordとpassword_confirmation、所属番号、所属が存在すれば登録できること' do
      expect(@user).to be_valid
   end
   #nameの異常テストコード
   it 'nameが空だと登録できないこと' do
    @user.name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
   end

   #emailの異常テストコード
   it 'emailが空だと登録できないこと' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it 'emailに@がないと登録できないこと' do
    @user.email = 'testexample'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
   end

   #passwordの異常テストコード
   it 'passwordが空だと登録できないこと' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it 'passwordが５文字以下だと登録できないこと' do
    @user.password = '1111a'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end
   
  it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
    @user.password_confirmation = ' '
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordとpassword_confirmation不一致では登録できないこと' do
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  #所属番号の異常テストコード
   it '所属番号が空だと登録できないこと' do
    @user.staff_num = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Staff num can't be blank")
   end
   it '所属番号が半角数字でないと登録できないこと' do
    @user.staff_num = '１１１１１'
    @user.valid?
    expect(@user.errors.full_messages).to include("Staff num Half-width number")
   end                                            

   #所属の異常テストコード
   it '所属が空だと登録できないこと' do
    @user.occupation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Occupation can't be blank")
   end
  end
end
