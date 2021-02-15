require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it 'タイトルとテキストと画像があれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿が保存できない場合' do
      it 'タイトルが空では投稿できない' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Name can't be blank")
      end
      it 'テキストが空では投稿できない' do
        @post.body = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Body can't be blank")
      end
      it '画像が空では投稿できない' do
        @post.image_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
