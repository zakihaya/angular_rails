angular.module('sampleApp').controller 'DashboardCtrl', ($scope, TodoList) ->
  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    $scope.lists = @todoListService.all()

  $scope.createList = (list_name) ->
    list = @todoListService.create(name: list_name)
    $scope.lists.push(list)
    $scope.listName = ''

  $scope.deleteList = (list, index) ->
    @todoListService.delete(list)
    $scope.lists.splice(index, 1)

  serverErrorHandler = ->
    alert("サーバーでエラーが発生しました。画面を更新し、もう一度試してください。")
