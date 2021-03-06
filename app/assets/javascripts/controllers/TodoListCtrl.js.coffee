angular.module('sampleApp').controller "TodoListCtrl", ($scope, $routeParams, TodoList, Todo) ->
  # Todoの初期値を作成する
  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService = new Todo(1, serverErrorHandler)

    $scope.list = @todoListService.find($routeParams.list_id, (res) -> $scope.totalTodos = res.totalTodos)

  # Todoを追加する
  $scope.addTodo = (todoDescription) ->
    # todoを追加する(POST /api/todo_lists/:todo_lsit_id/todos => Api::Todo#destroy)
    todo = @todoService.create(description: todoDescription, completed: false)

    # initメソッドで用意したtodosの先頭に、新しいtodoを追加する
    $scope.list.todos.unshift(todo)

    # Todo入力フィールドを空にする
    $scope.todoDescription = ''

  # Todoを削除する
  $scope.deleteTodo = (todo) ->
    # todoをサーバーから削除する(DELETE /api/todo_lists/todo_list_id/todos/:id => Api::Todo#destroy)
    @todoService.delete(todo)
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)

  # Todoの完了カラム ON/OFF
  $scope.toggleTodo = (todo) ->
    @todoService.update(todo, completed: todo.completed)

  # 検索する
  $scope.search = () ->
    # Ransackに対応したparamsを作成する
    # description_cont => descriptionカラムが特定の値を含む(like句に変換される)
    # completed_true   => completedカラムがtrueか
    params = {
      'q[description_cont]': $scope.descriptionCont,
      'q[completed_true]': $scope.completedTrue,
      'page': $scope.currentPage
    }
    $scope.list = @todoService.all(params, (res)-> $scope.totalTodos = res.totalTodos)

  serverErrorHandler = ->
    alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
