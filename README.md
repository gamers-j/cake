# アプリケーション名																									
## cake																									

# 概要																									
## 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。																									

# ER図
![ER図](https://github.com/gamers-j/cake/blob/develop/ER%E5%9B%B3.png)

# アプリケーション詳細設計	
## public
|コントローラー|アクション|メソッド|URL|目的|
|---|---|---|---|---|
|_=/2.public/homes|top|GET|/|トップページ|
||about|GET|/about|アバウトページ|
|public/products|index|GET|/products|商品一覧|
||show|GET|/products/:id|商品詳細|
|public/registrations|new|GET|/customers/sign_up|顧客の会員登録画面|
||create|POST|/customers|顧客の会員登録|
|public/sessions|new|GET|/customers/sign_in|顧客ログイン画面|
||create|POST|/customers/sign_in|顧客ログイン|
||destroy|DELETE|/customers/sign_out|顧客ログアウト|
|public/customers|show|GET|/customers|顧客のマイページ|
||edit|GET|/customers/information/edit|顧客の登録情報編集画面|
||update|PATCH|/customers/infomation|顧客の登録情報更新|
||unsubscribe|GET|/customers/unsubscribe|顧客の退会確認画面|
||withdraw|PATCH|/customers/withdraw|顧客の退会処理(ステータスの更新)|
|public/cart_products|index|GET|/cart_products|カート内商品一覧画面(数量変更・カート削除の要素を含む)|
||update|PATCH|/cart_products/:id|カート内商品データ更新|
||destroy|DELETE|/cart_products/:id|カート内商品データ削除(一商品)|
||destroy_all|DELETE|/cart_products/destroy_all|カート内商品データ削除(全て)|
||create|POST|/cart_products|カート内商品データ追加|
|public/orders|new|GET|/orders/new|注文情報入力画面(支払方法・配送先の選択)|
||confirm|POST|/orders/confirm|注文情報確認画面|
||complete|GET|/orders/complete|注文完了画面|
||create|POST|/orders|注文確定処理|
||index|GET|/orders|注文履歴画面|
||show|GET|/orders/:id|注文履歴詳細画面|
|public/delivery|addresses|index|GET|/delivery_addresses|配送先登録/一覧画面|
||edit|GET|/delivery_addresses/:id/edit|配送先編集画面|
||create|POST|/delivery_addresses|配送先の登録|
||update|PATCH|/delivery_addresses/:id|配送先の更新|
||destroy|DELETE|/delivery_addresses/:id|配送先の削除|

## admin
|admin/sessions|new|GET|/admin/sign_in|管理者ログイン画面|
||create|POST|/admin/sign_in|管理者ログイン|
||destroy|DELETE|/admin/sign_out|管理者ログアウト|
|admin/homes|top|GET|/admin|管理者トップページ(注文履歴一覧)|
|admin/products|index|GET|/admin/products|商品一覧|
||new|GET|/admin/products/new|商品新規登録画面|
||create|POST|/admin/products|商品情報の新規登録|
||show|GET|/admin/products/:id|商品詳細画面|
||edit|GET|/admin/products/:id/edit|商品編集画面|
||update|PATCH|/admin/products/:id|商品情報の更新|
|admin/types|index|GET|/admin/types|ジャンル管理画面(一覧・追加を兼ねる)|
||create|POST|/admin/types|ジャンルデータ登録|
||edit|GET|/admin/types/:id/edit|ジャンル編集画面|
||update|PATCH|/admin/types/:id|ジャンルデータ更新|
|admin/customers|index|GET|/admin/customers|顧客一覧画面|
||show|GET|/admin/customers/:id|顧客詳細画面|
||edit|GET|/admin/customers/:id/edit|顧客編集画面|
||update|PATCH|/admin/customers/:id|顧客情報の更新|
|admin/orders|show|GET|/admin/orders/:id|注文詳細画面(ステータス編集を兼ねる)
#### admin/orders	         update	PATCH	/admin/orders/:id	注文ステータス・着手状況の更新
#### admin/product_orders   update	PATCH	/admin/product_orders/:id	製作ステータスの更新 

# アプリケーションURL																									
#### ながのcake(URL)																									

# 開発環境																									
# "ruby 3.1.2

# Rails 6.1.6.1"																									
