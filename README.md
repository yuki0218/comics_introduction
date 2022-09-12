# アプリケーション名

comic introduction

# アプリケーション概要

漫画の管理と他ユーザーの漫画閲覧

# URL

https://comics-introduction.herokuapp.com/

# テスト用アカウント

- Basic認証ID：unbr
- Basic認証パスワード：0305
- メールアドレス：test@test1
- パスワード：aaa111

# 利用方法

## 漫画投稿

1.ヘッダーにあるnew comicから投稿を行う
2.投稿するボタンから投稿する

## タイトル検索

1.タイトル検索に検索したいタイトルを入力する
2.検索ボタンから検索する

## ジャンル検索

1.検索したいジャンルを選択する
2.検索ボタンから検索する

## お気に入り

1.星ボタンからお気に入り登録、削除する
2.お気に入りボタンからお気に入り登録済みの投稿を閲覧する

# アプリケーションを作成した背景

家に複数の漫画があり、どの漫画がどんな内容で何巻まで持っているかなどの情報をその都度本棚に見に行かないといけないくて大変だったので、それらの情報をまとめられるサイトを作成することにした。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1_tP0oU3lHrMOzhhkKzMUZybneiEXA1sQ7BczB8FjyWo/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

- お気に入り機能  
  - 投稿漫画の右にある星ボタンで登録、削除ができる
  - 非同期通信での実装なのでスクロールの一番上に戻らず効率よくお気に入りできるようになっている
  - https://i.gyazo.com/942003ba58d2d9194b3410573289dfd5.gif
- お気に入り閲覧機能
  - お気に入りボタンからお気に入りした投稿を閲覧できる
  - https://i.gyazo.com/0dedf8b8390f767e79050127ea96f728.gif
- タイトル検索機能
  - タイトル検索に検索したいタイトルを入力するとその文字列が含まれるタイトルの一覧が表示される
  - https://i.gyazo.com/484551df9751f4a8c535dd739401c87c.gif
- ジャンル検索機能
  - ジャンル検索に検索したいジャンルを選択するとそのジャンルの一覧が表示される
  - https://i.gyazo.com/8bbf7da68bf56046825a01daf3c9933b.gif

# 実装予定の機能

その漫画をAmazonや楽天に購入に行ける機能を実装予定

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :comics
- has_many :favorites

## comics テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| author    | string     | null: false                    |
| volume    | integer    | null: false                    |
| target_id | integer    | null: false                    |
| genre_id  | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites

## favorites テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| comic     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comic

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/4f1bfa6783f79bb513561fcb55833a87.png)](https://gyazo.com/4f1bfa6783f79bb513561fcb55833a87)

# 開発環境

- フロントエンド：HTML、CSS、Javascript
- バックエンド：Ruby
- インフラ：Ruby、devise
- テスト：rspec-rails、factory_bot_rails、faker
- テキストエディタ：VScode

# ローカルでの動作方法

以下のコマンドを実行  
% git clone https://github.com/comics_introduction  
% cd comics_introduction  
% bundle install  
% yarn install  

# 工夫したポイント

お気に入り機能は非同期通信にすることでボタンをクリックするたびにページの一番上に戻ってしまうことがないようにしている。  
検索機能はタイトルとジャンルの２種類で検索が掛けられるようにし、ジャンル検索の方では二つのジャンル区別の両方の選択すればどちらにも当てはまるものが、どちらか一方だけが選択されていればそのジャンルに当てはまるものが一覧で表示されるようになっている。