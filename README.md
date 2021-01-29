# README

# テーブル設計

##  users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | NOT NULL    |
| nickname  |  string | NOT NULL   |
| email     | string  | NOT NULL   |
| tanzyoubi | string | NOT NULL    |
| password  | string  | NOT NULL   | 

##  syouhinzyouhou テーブル

|        Column    | Type   | Options     |
| ---------------  | ------ | ----------- |
| syupinsya        | string | NOT NULL    |
| kategori-        | string | NOT NULL    |
| syouhinnnokinou  | string | NOT NULL    |
| komento          | string | NOT NULL    |
| haisouryounohutan| string | NOT NULL    |
| haxtusousiiki    | string | NOT NULL    |
| haxtubimeyasu    | string | NOT NULL    |
| image            | ActiveStorage | -----|


##          buy テーブル
| Column  | Type       |             Options            |
| -----   | ---------- | -------------------------------|
｜  user  | references | null: false, foreign_key: true |
｜  buy   | references | null: false, foreign_key: true |


##  osumai テーブル
| Column  | Type       |             Options            |
| -----   | ---------- | -------------------------------|
| yuubinbabgou    | string | NOT NULL    |
| todouhuken      | string | NOT NULL    |
| sityouson       | string | NOT NULL    |
| banti           | string | NOT NULL    |
| kenbutumei      | string | --------    |
| dennwabangou    | references| NOT NULL | 