# 制作背景

## 1,アプリケーション概要
　マトリクス図を採用したtodoアプリです。
シンプルな機能ですがタスク新規作成の際、「優先度・緊急度」を選択する事で
マトリスク図に反映される仕様です。マーケティングや仕事術でよく使われますが
アプリでは見た事がなかったので作成しました。

・マトリクス図について
https://ne-tabase.com/freelance/814

## 2,アプリケーション機能
・ユーザー新規登録機能
・ユーザーログイン機能
・ユーザーログアウト機能
・ユーザー編集機能
・タスク新規作成機能
・タスク編集機能
・タスク削除機能
・タスク完了機能
・タスク検索機能

## 3,使用言語、技術
・HTML5/CSS3(haml,sass)
・ruby, ruby on rails
・heroku
・rspec
・javascriput,jQuery

## 4,今後実装したい機能
・google map api
・時間管理機能
・掲示板機能

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
