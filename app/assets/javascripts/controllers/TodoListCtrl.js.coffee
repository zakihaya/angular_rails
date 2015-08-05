angular.module('sampleApp').controller "TodoListCtrl", ($scope, TodoList, Todo) ->
  # Todoの初期値を作成する
  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService = new Todo(1, serverErrorHandler)

    $scope.list = @todoListService.find(1)

  # Todoを追加する
  $scope.addTodo = (todoDescription) ->
    # 新しいTodoを作成する
    todo = { 'description': todoDescription, 'completed' : false }

    # initメソッドで用意したtodosの先頭に、新しいtodoを追加する
    $scope.list.todos.unshift(todo)

    # Todo入力フィールドを空にする
    $scope.todoDescription = ''

  # Todoを削除する
  $scope.deleteTodo = (todo) ->
    $scope.list.todos = _.reject($scope.list.todos, (targetTodo) ->
      targetTodo == todo
    )

  serverErrorHandler = ->
    alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
