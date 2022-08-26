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