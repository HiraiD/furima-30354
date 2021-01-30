# README

# テーブル設計

##  users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| last_name | string | NOT NULL    |
| last_name |  string | NOT NULL   |
| last_name kana | string | NOT NULL   |
| last_name kana|  string | NOT NULL   |





| nickname  |  string | NOT NULL   |
| email     | string  | NOT NULL   |
| date      | date | NOT NULL    |
| encrypted_password  | string  | NOT NULL   | 

###   Association

- has_many   :Product information
- has_may    :buy
- has_one    :Street address




##  Product information テーブル　#商品情報

|        Column    | Type   | Options     |
| ---------------  | ------ | ----------- |
| Seller   | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |



###   Association

- belongs_to :user
- has_may :buy






##          buys テーブル
| Column  | Type       |             Options            |
| -----   | ----------------------------------------｜ 
｜user  | references | null: false, foreign_key: true |
｜Product information| references | null: false, foreign_key: true |

###   Association

- belongs_to :user
- belongs_to :Street address
- belongs_to :Product information



##  Street address テーブル　#住所
| Column  | Type       |             Options            |
| -----   | ---------- | -------------------------------|
| post    | string | NOT NULL    |
| prefectures    | string | NOT NULL    |
| municipality   | string | NOT NULL    |
| address        | string | NOT NULL    |
| Building name  | string | --------    |
| phone number   | string| NOT NULL | 

### Association

- belongs_to :buys
