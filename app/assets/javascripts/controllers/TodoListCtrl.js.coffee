angular.module('sampleApp').controller "TodoListCtrl", ($scope, TodoList, Todo) ->
  # Todoの初期値を作成する
  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService = new Todo(1, serverErrorHandler)

    $scope.list = @todoListService.find(1)

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

  serverErrorHandler = ->
    alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")

  # Todoの完了カラム ON/OFF
  $scope.toggleTodo = (todo) ->
    @todoService.update(todo, completed: todo.completed)
