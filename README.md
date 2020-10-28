# README

## users テーブル

| Column            | Type       | Options     |
| ----------------  |-------     | ----------  |
| nickname          | string     | null: false |
| email             | string     | null: false |
| password          | string     | null: false |
| familyname_kanji  | string     | null: false |
| firstname_kanji   | string     | null: false |
| familyname_kana   | string     | null: false |
| firstname_kana    | string     | null: false |
| birthday          | date       | null: false |

### Association

- has_many :items
- has_many :buys



## items テーブル

| Column                 | Type        | Options                          |
| ---------------------- | ------      | -------------------------------  |
| product_name           | string      | null: false                      |
| product_introduction   | text        | null: false                      |
| product_category_id    | integer     | null: false                      |
| product_status_id      | integer     | null: false                      |
| delivery_burden_id     | integer     | null: false                      |
| prefecture_id          | integer     | null: false                      |
| delivery_day_id        | integer     | null: false                      |
| price                  | integer     | null: false                      |
| user                   | references  | foreign_key: true                |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type        | Options                         |
| --------------- | ------      | ------------------------------- |
| user            | references  | foreign_key: true               |
| item            | references  | foreign_key: true               |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column          | Type        | Options                          |
| --------------- | ------      | -------------------------------  |
| postalcode_id   | string      | null: false                      |
| prefecture_id   | integer     | null: false                      |
| city            | string      | null: false                      |
| housenumber     | string      | null: false                      |
| building        | string      |                                  |
| phonenumber     | string      | null: false                      |
| buy             | references  | foreign_key: true                |


### Association

- belongs_to :buy