# matrix DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :todos

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|urgency|string|null: false|
|importance|string|null: false|
|status|string|null: false|
|deadline|string|null: false|
|user_id|reference|null: false, foreign_key :true|
|content|string|

### Association
- belongs_to :user
