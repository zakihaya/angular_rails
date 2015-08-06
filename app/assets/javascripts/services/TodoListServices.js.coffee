angular.module('sampleApp').factory 'TodoList', ($resource, $http) ->
  class TodoList
    constructor: (errorHandler) ->
      @service = $resource('/api/todo_lists/:id',
        { id: '@id' },
        { update: { method: 'PUT' } }
      )
      @errorHandler = errorHandler

    all: ->
      @service.query (-> null), @errorHandler

    find: (id, successHandler) ->
      @service.get({ id: id }, ((list) ->
        successHandler?(list)
        list),
        @errorHandler)

    create: (todo_list_params) ->
      todo_list = new @service(todo_list_params)
      todo_list.$save({}, null, @errorHandler)
      todo_list

    delete: (todo_list_params) ->
      todo_list = new @service(todo_list_params)
      todo_list.$delete({}, null, @errorHandler)
