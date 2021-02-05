# README

# テーブル設計

##  users テーブル

| Column           | Type   | Options     |
| --------ーーーーー| ------ | ----------- |
| last_name       | string | NOT NULL    |
| first_name      | string | NOT NULL    |
| last_name_kana  | string | NOT NULL    |
| first_name_kana | string | NOT NULL    |
| nickname        | string | NOT NULL    |
| email           | string | NOT NULL    |
| birth_date            | date    | NOT NULL   |
| encrypted_password  | string  | NOT NULL   | 

###   Association

- has_many   :items
- has_many    :buys





## items テーブル　#商品情報

|        Column               | Type     | Options     |
| -------------------- -------| ------ー--|---------ーー|
| name                           | string | NOT NULL   |
| price                         | integer | NOT NULL   |
| informaion                    | text    | NOT NULL   |
| category_id                   | integer | NOT NULL   |
| burden_of_shipping_charges_id | integer | NOT NULL   |
| shipping_area_id              | integer | NOT NULL   |
| Estimated_shipping_id         | integer | NOT NULL   |
| product_condition_id          |integer  | NOT NULL   |
| user                          | references|foreign_key: true|


###   Association

- belongs_to :user
- has_one :buy






##          buys テーブル
| Column               | Type    |             Options            |
| -----ーーーーーーーーー| ----------------------------------------｜ 
｜user               | references | null: false, foreign_key:true  |
｜product_information| references | null: false, foreign_key: true |

###   Association

- belongs_to :user
- has_one :street_address
- belongs_to :items



##  Street_address テーブル #住所
| Column  | Type       |             Options            |
| -----ーーーーーーー|----------ーーーーーーー | -------------------------------|
| post             | string  | NOT NULL   |
| prefecture_id    | integer | NOT NULL   |
| municipality     | string | NOT NULL    |
| address          | string | NOT NULL    |
| building_name    | string | --------    |
| phone_number     | string| NOT NULL     | 
| buy               | references          | foreign_key: true    |

### Association

- belongs_to :buy
