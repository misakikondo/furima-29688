require 'rails_helper'

RSpec.describe Comment, type: :model do
    describe 'コメント投稿' do
      before do
        @comment = FactoryBot.build(:comment)
      end
  
      context 'コメントが投稿できる場合' do
        it 'itemとuserが存在し、入力フォームに文字が入っていること' do
          expect(@comment).to be_valid
        end
      end
  
      context 'コメントが投稿できない場合' do
        it '入力フォームが空だと登録できないこと' do
          @comment.text = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Text can't be blank")
        end

        it 'userが紐付いていないと投稿できないこと' do
          @comment.user = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("User must exist")
        end
    
        it 'itemが紐付いていないと投稿できないこと' do
          @comment.item = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Item must exist")
        end

        it '入力フォームに絵文字が入っていると投稿できないこと' do
          @comment.text = "😊"
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Text に絵文字(😊)は使用できません。")
        end
      end
    end
end
