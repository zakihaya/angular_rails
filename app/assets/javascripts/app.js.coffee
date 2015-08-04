# AngularJSの設定ファイル
# 依存ライブラリを記述する
app = angular.module('sampleApp', ['ui.bootstrap'])

# CSRFのトークンを設定するようにする
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
