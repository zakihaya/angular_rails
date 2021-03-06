angular.module('sampleApp').factory 'Todo', ($resource, $http) ->
  class Todo
    constructor: (todoListId, errorHandler) ->
      @service = $resource('/api/todo_lists/:todo_list_id/todos/:id',
        { todo_list_id: todoListId, id: '@id' },
        { query: { isArray: false }, update: { method: 'PUT' } }
      )
      @errorHandler = errorHandler

    all: (params, successHandler) ->
      @service.query(params,((list)->
        successHandler?(list)
        list),
        @errorHandler)

    create: (todo_params) ->
      todo = new @service(todo_params)
      todo.$save({}, null, @errorHandler)
      todo

    delete: (todo_params) ->
      todo = new @service(todo_params)
      todo.$delete({}, null, @errorHandler)

    update: (todo_params, attrs) ->
      todo = new @service(todo_params)
      todo.$update({}, null, @errorHandler)
