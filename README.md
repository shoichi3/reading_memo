# テーブル設計

## usersテーブル

|  Column  |  Type  |   Option   |
| -------- | ------ | ---------- |
|   name   | string | null:false |
|   email  | string | null:false |
| password | string | null:false |  

### Association

- has_many :user_books
- has_many :books, though: user_books
- has_many :memos

## booksテーブル

|  Column  |  Type  |   Option   |
| -------- | ------ | ---------- |
|  title   | string | null:false |

### Association

- has_many :user_books
- has_many :users, though: user_books
- has_many :memos

## user_booksテーブル

|  Column  |    Type    |            Option             |
| -------- | ---------- | ----------------------------- |
|   user   | references | null:false, foreign_key: true |
|   book   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book

## memosテーブル

|  Column  |    Type    |            Option             |
| -------- | ---------- | ----------------------------- |
|   text   |    text    | null:false                    |
|   user   | references | null:false, foreign_key: true |
|   book   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book
- has_one_attached :image