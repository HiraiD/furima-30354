# README

# テーブル設計

##  users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | NOT NULL    |
| nickname  |  string | NOT NULL   |
| email     | string  | NOT NULL   |
| date      | string | NOT NULL    |
| encrypted_password  | string  | NOT NULL   | 

###   Association

- has_many    :Product information
- belongs_to  :buy
- belongs_to  :Street address




##  Product information テーブル　#商品情報

|        Column    | Type   | Options     |
| ---------------  | ------ | ----------- |
| Seller   | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| comment  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |
| integer  | string | NOT NULL    |



###   Association

- belongs_to :user
- belongs_to :buy






##          buys テーブル
| Column  | Type       |             Options            |
| -----   | ----------------------------------------｜ 
｜user  | references | null: false, foreign_key: true |
｜Product information| references | null: false, foreign_key: true |

###   Association


- belongs_to :user
- belongs_to :Street address



##  Street address テーブル　#住所
| Column  | Type       |             Options            |
| -----   | ---------- | -------------------------------|
| post    | string | NOT NULL    |
| prefectures    | string | NOT NULL    |
| municipality   | string | NOT NULL    |
| address        | string | NOT NULL    |
| Building name  | string | --------    |
| phone number   | references| NOT NULL | 

### Association

- belongs_to :buys
- belongs_to :user