require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'いいね登録' do
    context 'いいね登録ができる場合' do
      it "userとcomicに紐付いていれば登録できる" do
        expect(@favorite).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "userが紐付いていないと保存できない" do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Userを入力してください")
      end

      it "comicが紐付いていないと保存できない" do
        @favorite.comic = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Comicを入力してください")
      end
    end
  end
end
