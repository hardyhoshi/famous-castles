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
    end
  end
end
