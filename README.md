# ReadingMemo

紙の本に関するメモを整理するためのアプリケーションです。  
本にメモを結びつけることでメモを探す手間を省略することができます。

# URL

http://175.41.211.1  
トップページからログインページへ遷移してください。メールアドレスとパスワードは入力しておりますので、すぐにログインすることができます。

# 使用技術一覧

- ruby 2.6.5  
- rails 6.0.0
- MySql 5.6.47
- Nginx
- Unicorn
- AWS
  - EC2
  - S3
- Capistrano3
- RSpec

# AWS構成図
<img width="100%" alt="スクリーンショット 2020-09-27 15 28 12" src="https://user-images.githubusercontent.com/69130053/94357813-03ffda80-00d7-11eb-97f8-86255b46ce0b.png">

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