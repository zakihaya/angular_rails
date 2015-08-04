angular.module('sampleApp').controller "TodoListCtrl", ($scope) ->
  # Todoの初期値を作成する
  $scope.init = ->
    $scope.list = {
      'name': 'TODOリスト1',
      'todos': [
        { 'description': 'todo1', 'completed' : true },
        { 'description': 'todo2', 'completed' : false },
        { 'description': 'todo3', 'completed' : false }
      ]
    }

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
