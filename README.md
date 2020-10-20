# README

## users テーブル

| Column       | Type       | Options    |
| ------------ | ------     | ---------- |
| u_nickname   | string     | not:  null |
| u_email      | string     | not:  null |
| u_password   | string     | not:  null |
| u_name_kanji | string     | not:  null |
| u_name_kana  | string     | not:  null |
| u_birthday   | string     | not:  null |

### Association

- has_many :items
- has_many :buys



## items テーブル

| Column                 | Type        | Options                         |
| ---------------------- | ------      | ------------------------------- |
| i_image                | string      | not:  null                      |
| i_product_name         | string      | not:  null                      |
| i_product_introduction | text        | not:  null                      |
| i_delivery             | string      | not:  null                      |
| i_price                | string      | not:  null                      |
| user                   | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buys

## buys テーブル

| Column          | Type        | Options                         |
| --------------- | ------      | ------------------------------- |
| b_who_purchase  | string      | not:  null                      |
| b_when_purchase | string      | not:  null                      |
| b_what_purchase | string      | not:  null                      |
| user            | references  | null: false, foreign_key: true  |
| item            | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : addrss

## addrsses テーブル

| Column               | Type        | Options                         |
| -------------------- | ------      | ------------------------------- |
| a_credit_infomation  | string      | not:  null                      |
| a_shipping_addrss    | string      | not:  null                      |

### Association

- belongs_to :buy