# README

# テーブル設計

##  users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| last_name | string | NOT NULL    |
| first_name |  string | NOT NULL   |
| last_name_kana | string | NOT NULL   |
| first_name_kana|  string | NOT NULL   |
| nickname  |  string | NOT NULL   |
| email     | string  | NOT NULL   |
| date      | date | NOT NULL    |
| encrypted_password  | string  | NOT NULL   | 

###   Association

- has_many   :product_informations
- has_may    :buys





##  product_informations テーブル　#商品情報

|        Column               | Type         | Options     |
| -------------------- -------| ------ ----------|---------|
| name                           | string | NOT NULL   |
| price                         | integer | NOT NULL   |
| informaion                    | text    | NOT NULL   |
| category_id                   | integer | NOT NULL   |
| burden of shipping charges_id | string | NOT NULL    |
| shipping area_id              | string | NOT NULL    |
| Estimated shipping_id         | string | NOT NULL    |
| product condition_id          |string_ | NOT NULL    |
| user_id                       | references|foreign_key: true|


###   Association

- belongs_to :user
- has_may :buy






##          buys テーブル
| Column  | Type       |             Options            |
| -----   | ----------------------------------------｜ 
｜user_id  | references | null: false, foreign_key: true |
｜product_information_id| references | null: false, foreign_key: true |

###   Association

- belongs_to :user
- has_one :street_address
- belongs_to :product_information



##  Street address テーブル　#住所
| Column  | Type       |             Options            |
| -----   | ---------- | -------------------------------|
| post    | string | NOT NULL    |
| prefecture_id    | integer | NOT NULL    |
| municipality     | string | NOT NULL    |
| address           | string | NOT NULL    |
| building_name    | string | --------    |
| phone_number   | string| NOT NULL | 
| buy_id | references | foreign_key: true |

### Association

- belongs_to :buys
