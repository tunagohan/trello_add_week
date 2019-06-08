# trello_add_week
レーンを指定して1週間分出力するよ

## 実行手順

member -> board -> lane -> card

という流れになっています。

## 初回設定

### KEYの取得

[Trello API KEY Generate](https://trello.com/1/appKey/generate) から `KEY` を取得します。

### API TOKENの発行

```

https://trello.com/1/authorize?key=<上で取得したKey>&name=&expiration=never&response_type=token&scope=read,write

```

キーを取得した後上のURLを完成させて ブラウザにペーストしましょう。

注意: ログイン状態でないと表示されません。

画面が表示されるので、「Allow」をクリックします。

トークンが表示されますので、これをメモしましょう。

### direnv

```

export KEY=
export TOKEN=
export USERNAME=

```

### 実行

```

$ ruby provisioning/get_lane_id.rb


{"name"=>"Trelloへようこそ", "id"=>"xxxxxxxxxxxxxxxxxxxxxxxxxx"}

------------------------------
対象のボードのIDを入力してください。
対象ボードIDは上記で表示されているIDのいずれかをコピペし入力してください。

board_id: xxxxxxxxxxxxxxxxxxxxxxxxxx

Success.
------------------------------

{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"WIP"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Reviewing"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Waiting for Release"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Done"}


※ レーンIDを direnv などで環境変数として登録してください。

Finish.

```

レーンIDが取得できるので対象のレーンIDをdirenvなどで環境変数として登録します。


### direnv

上記のIDをLANE_IDに入れてください。

```

export KEY=
export TOKEN=
export USERNAME=
# 追加
export LANE_ID=

```
