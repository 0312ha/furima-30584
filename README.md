# README

## users テーブル

| Column            | Type       | Options    |
| ----------------  |-------     | ---------- |
| nickname          | string     | not:  null |
| email             | string     | not:  null |
| password          | string     | not:  null |
| familyname_kanji  | string     | not:  null |
| firstname_kanji   | string     | not:  null |
| familyname_kana   | string     | not:  null |
| firstname_kana    | string     | not:  null |
| name_kana         | string     | not:  null |
| birthday          | date       | not:  null |

### Association

- has_many :items
- has_many :buys



## items テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ------      | ------------------------------- |
| product_name           | string      | not:  null                      |
| product_introduction   | text        | not:  null                      |
| product_category       | integer     | not:  null                      |
| product_status    　　　| integer     | not:  null                      |
| delivery_burden        | integer     | not:  null                      |
| delivery_area          | integer     | not:  null                      |
| delivery_day           | integer     | not:  null                      |
| price                  | string      | not:  null                      |
| user                   | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buys

## buys テーブル

| Column          | Type        | Options                         |
| --------------- | ------      | ------------------------------- |
| user            | references  | null: false, foreign_key: true  |
| item            | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : addrss

## addrsses テーブル

| Column               | Type        | Options                         |
| -------------------- | ------      | ------------------------------- |
| credit_infomation    | string      | not:  null                      |
| credit_data          | data        | not:  null                      |
| credit_security      | string      | not:  null                      |
| credit_postalcode    | string      | not:  null                      |
| credit_prefectures   | integer     | not:  null                      |
| credit_city          | string      | not:  null                      |
| credit_housenumber   | string      | not:  null                      |
| credit_building      | string      |                                 |
| credit_phonenumber   | string      | not:  null                      |
| shipping_addrss      | string      | not:  null                      |


### Association

- belongs_to :buy