# README

## users テーブル

| Column            | Type       | Options    |
| ----------------  |-------     | ---------- |
| nickname          | string     | null: fals |
| email             | string     | null: fals |
| password          | string     | null: fals |
| familyname_kanji  | string     | null: fals |
| firstname_kanji   | string     | null: fals |
| familyname_kana   | string     | null: fals |
| firstname_kana    | string     | null: fals |
| birthday          | date       | null: fals |

### Association

- has_many :items
- has_many :buys



## items テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ------      | ------------------------------- |
| product_name           | string      | null: fals                      |
| product_introduction   | text        | null: fals                      |
| product_category_id    | integer     | null: fals                      |
| product_status_id      | integer     | null: fals                      |
| delivery_burden_id     | integer     | null: fals                      |
| delivery_area_id       | integer     | null: fals                      |
| delivery_day_id        | integer     | null: fals                      |
| price                  | integer     | null: fals                      |
| user                   | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type        | Options                         |
| --------------- | ------      | ------------------------------- |
| user            | references  | null: false, foreign_key: true  |
| item            | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column                | Type        | Options                         |
| --------------------  | ------      | ------------------------------- |
| credit_postalcode_id  | string      | null: fals                      |
| credit_prefectures_id | integer     | null: fals                      |
| credit_city           | string      | null: fals                      |
| credit_housenumber    | string      | null: fals                      |
| credit_building       | string      |                                 |
| credit_phonenumber    | string      | null: fals                      |
| shipping_addrss       | string      | null: fals                      |


### Association

- belongs_to :buy