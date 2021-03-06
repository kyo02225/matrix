# 制作背景
> 物事を進める上で「優先度」「緊急度」「締め切り」の確認は必須ですが
>
> todoアプリはただ羅列するタイプの物が多く使いづらい。
>
>> →「優先度」等が一目で分かるtodoアプリがあれば、
>
>>> 自分が今何をすべきか明確になり、
>
>>> 限られた時間を有効活用出来ると考えました。

## 1.アプリケーションurl
>https://matrix-todo.herokuapp.com/users/sign_in

>>※初期値入力済み。テストユーザーでログイン出来ます。
## 2.サンプル画像
![F291F8FB-C557-47D6-A8D1-7B13CDB26803_1_105_c](https://user-images.githubusercontent.com/56025105/72196980-ba476500-345f-11ea-9b00-38b12cdea6e4.jpeg)

## 3.アプリケーション概要
>マーケティングや仕事術、指導方法等幅広く使われるとても便利なマトリクス図
を採用したtodoアプリです。
>
>シンプルな機能ですがタスク新規作成の際、「優先度・緊急度」を選択する事で
マトリスク図に反映される仕様です。

[マトリクス図について](https://ne-tabase.com/freelance/814)

## 4.アプリケーション機能
- ユーザー新規登録機能
- ユーザーログイン機能
- ユーザーログアウト機能
- ユーザー編集機能
- タスク新規作成機能
- タスク編集機能
- タスク削除機能
- タスク完了機能
- タスク検索機能

## 5.使用言語、技術
- HTML5/CSS3(haml,sass)
- ruby, ruby on rails
- heroku
- rspec
- javascriput,jQuery


# matrix DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :todos

## todoテーブル
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
