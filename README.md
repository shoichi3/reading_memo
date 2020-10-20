# ReadingMemo

紙の本に関するメモを整理するためのアプリケーションです。  
本にメモを結びつけることでメモを探す手間を省略することができます。
<img width="1397" alt="スクリーンショット 2020-10-19 8 41 14" src="https://user-images.githubusercontent.com/69130053/96388875-dd6d2500-11e6-11eb-9183-1c21139a0aa6.png">

# URL

http://readingmemobook.com  
トップページからログインページへ遷移してください。メールアドレスとパスワードは入力しておりますので、すぐにログインすることができます。

# 使用技術一覧

- ruby 2.6.5  
- rails 6.0.0
- MySql 5.6.47
- Nginx
- Unicorn
- Docker
- CircleCI
- AWS
  - EC2
  - S3
  - Route 53
- Capistrano3
- RSpec

# AWS構成図
<img width="908" alt="スクリーンショット 2020-10-19 11 54 09" src="https://user-images.githubusercontent.com/69130053/96396312-e0c1da00-1201-11eb-975f-54bf40f18525.png">

# 機能一覧

- ユーザー登録、ログイン機能(devise)
- マイページ機能
- 本追加機能
- 本の詳細表示機能
- 本編集機能
- 本削除機能 
- メモ追加機能
  - 画像投稿(ActiveStorage, mini_magick, image_processing)
- メモの詳細表示機能
- メモ編集機能
- メモ削除機能 
- ページネーション機能(kaminari)
- 検索機能


# テスト
- RSpec
  - 単体テスト(model)
  - 結合テスト(system)  