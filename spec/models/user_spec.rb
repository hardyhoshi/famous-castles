require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname、email、passwordとpassword_confirmationが存在すれば新規登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が含まれれば登録できる" do
        @user.email = "aaa@aaa"
        @user.valid?
        expect(@user). to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上で半角英数混合あれば登録できる" do
        @user.password = "1a1a1a"
        @user.password_confirmation = "1a1a1a"
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに@が含まれなければ登録できない" do
        @user.email = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "1aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordは半角数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordは半角英字のみの場合は登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
    end
  end
end
