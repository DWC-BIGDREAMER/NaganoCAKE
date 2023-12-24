# README

### 概要

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトを開発。<br>
……という設定で行われるDMM Webcamp2ヶ月目の課題（チーム開発）です。<br>
先達の遺した様々な資料に助けられ、作成しました。少しでも後進の参考になれば幸いです。

### 背景設定

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。<br>
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、<br>
管理機能を含んだ通販サイトを開設しようと思い至った。

### 言語とフレームワークのVersion

- Ruby 3.1.2p20
- Rails 6.1.7.6
- Bootstrap v4.6.2

**使用したGem**

```
gem 'devise'
gem 'kaminari','~> 1.2.1'
gem 'ransack'
```

## 実装した機能
**顧客側**
- 会員登録、ログイン・ログアウト、退会
- 会員情報の編集
- カートへの追加、商品購入
- 支払い方法、配送先の指定
- 注文履歴の閲覧
- 商品名検索機能
- ジャンル検索機能

**管理者側**
- 商品の新規追加、編集、閲覧
- 商品情報の編集
- 会員登録されているユーザ情報の閲覧、編集、退会処理
- ユーザの注文履歴閲覧、注文/製作ステータスの管理
- ユーザー名検索機能

### 導入方法
```
$ git clone git@github.com:DWC-BIGDREAMER/NaganoCAKE.git
$ cd NaganoCAKE
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
$ rails s
```

管理者ページのログイン（/admin/sign_in)<br>
初期段階での管理者ページのログインに必要なメールアドレス及びパスワードは下記の通りです。<br>
URLの後ろに/admin/sign_inをつけてください。

- メールアドレス：admin@admin.com
- パスワード:niceadmin

### 設計図書
- ER図(https://x.gd/BvUxz)
- テーブル定義書(https://x.gd/PUawR)
- アプリケーション詳細設計(https://x.gd/HVBKM)