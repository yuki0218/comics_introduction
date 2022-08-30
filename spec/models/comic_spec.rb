require 'rails_helper'

RSpec.describe Comic, type: :model do
  before do
    @comic = FactoryBot.build(:comic)
  end

  describe 'コミック新規投稿' do
    context '新規投稿できる場合' do
      it "titleとauthor、volume、target_age_id、genre_id、memo、completionが存在すれば投稿できる" do
        expect(@comic).to be_valid
      end

      it "memoがなくても投稿できる" do
        @comic.memo = ""
        expect(@comic).to be_valid
      end
    end

    context '新規投稿できない場合' do
      it "titleが空では投稿できない" do
        @comic.title = ""
        @comic.valid?
        expect(@comic.errors.full_messages).to include("タイトルを入力してください")
      end

      it "authorが空では投稿できない" do
        @comic.author = ""
        @comic.valid?
        expect(@comic.errors.full_messages).to include("作者を入力してください")
      end

      it "volumeが空では投稿できない" do
        @comic.volume = ""
        @comic.valid?
        expect(@comic.errors.full_messages).to include("巻数を入力してください")
      end

      it 'target_age_idが空では投稿できない' do
        @comic.target_age_id = 0
        @comic.valid?
        expect(@comic.errors.full_messages).to include("対象年齢を選択してください")
      end

      it 'genre_idが空では投稿できない' do
        @comic.genre_id = 0
        @comic.valid?
        expect(@comic.errors.full_messages).to include("ジャンルを選択してください")
      end

      it "volumeが半角数字以外では投稿できない" do
        @comic.volume = "１１"
        @comic.valid?
        expect(@comic.errors.full_messages).to include("巻数は数値で入力してください")
      end

      it "volumeが0未満では投稿できない" do
        @comic.volume = "-10"
        @comic.valid?
        expect(@comic.errors.full_messages).to include("巻数は0以上の値にしてください")
      end

      it "volumeが10000以上では投稿できない" do
        @comic.volume = "10000"
        @comic.valid?
        expect(@comic.errors.full_messages).to include("巻数は9999以下の値にしてください")
      end

      it 'userが紐付いていないと保存できない' do
        @comic.user = nil
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
