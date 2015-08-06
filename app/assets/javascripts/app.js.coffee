# AngularJSの設定ファイル
# 依存ライブラリを記述する
app = angular.module('sampleApp', ['ui.bootstrap', 'ngResource', 'ngRoute'])

# CSRFのトークンを設定するようにする
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# html5モードを有効にする
app.config ($locationProvider) ->
  $locationProvider.html5Mode true

# ルートの設定
app.config ($routeProvider) ->
  # /dashboard にアクセスすると、 /templates/dashboard.html を表示する（合わせてDashboardCtrlを読み込む)
  # /todo_lists/:list_id にアクセスすると、 /templates/task_list.html を表示する（合わせてTodoListCtrlを読み込む)
  $routeProvider.when '/',                    redirectTo: '/dashboard'
  $routeProvider.when '/dashboard',           templateUrl: '/templates/dashboard.html', controller: 'DashboardCtrl'
  $routeProvider.when '/todo_lists/:list_id', templateUrl: '/templates/todo_list.html', controller: 'TodoListCtrl'
