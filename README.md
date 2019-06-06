# trello_add_week
レーンを指定して1週間分出力するよ

## 実行手順

member -> board -> lane -> card

という流れになっています。

## member / board編

### KEYの取得

[Trello API KEY Generate](https://trello.com/1/appKey/generate) から `KEY` を取得します。

### API TOKENの発行

`https://trello.com/1/authorize?key=<上で取得したKey>&name=&expiration=never&response_type=token&scope=read,write`

キーを取得した後上のURLを完成させて ブラウザにペーストしましょう。

画面が表示されるので、「Allow」をクリックします。

トークンが表示されますので、これをメモしましょう。

### direnv などの環境変数編

```

export KEY=
export TOKEN=
export USERNAME=

```

ここまでくれば上記を埋められるはずなので埋めてください。

### 実行

```

ruby fetch_board_id.rb

{"name"=>"Trelloへようこそ", "id"=>"xxxxxxxxxxxxxxxxxxxxxxxxxx"}

```

idが取得できるので対象のボードIDをメモしておきましょう


## lane編

ボードのIDが取得できたので追加したいレーンのID取得しましょう

### direnv などの環境変数編

上記のIDをBOARD_IDに入れてください。

```

export KEY=
export TOKEN=
export USERNAME=
export BOARD_ID=

```

### 実行

```

ruby fetch_lane_id.rb

{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"WIP"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Reviewing"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Waiting for Release"}
{"id"=>"xxxxxxxxxxxxxxxx", "name"=>"Done"}

```

追加したいレーンのIDをメモしておきましょう

## 一週間分の曜日をAPI経由で追加

ここまでくれば好きなレーンに追加ができてしまいます

### direnv などの環境変数編

上記のIDをLANE_IDに入れてください。

```

export KEY=
export TOKEN=
export USERNAME=
export BOARD_ID=
export LANE_ID=

```

### 実行

```

ruby trello_add_week.rb

```

追加されているはずなのでみてみてください。
