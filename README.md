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
export TRELLONAME=

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
export TRELLONAME=
# 追加
export LANE_ID=

```

## 実行 (上記で指定したレーンに平日の日付を入れる)

どの曜日にいたとしても月曜日始まりで日付の一覧を指定したレーンに出力します。

```

$ ruby trello_add_weekday_to_specified_lane.rb

posted: 06月10日 (月)
posted: 06月11日 (火)
posted: 06月12日 (水)
posted: 06月13日 (木)
posted: 06月14日 (金)

```

## To Be Continue ...

- マニュアルモード

レーンを環境変数などで指定しません。

ボート内レーンを出力し直接キー操作で選択。
POSTしたい内容を入れると送信できる機能をリリース予定です。
