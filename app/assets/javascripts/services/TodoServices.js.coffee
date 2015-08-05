angular.module('sampleApp').factory 'Todo', ($resource, $http) ->
  class Todo
    constructor: (todoListId, errorHandler) ->
      @service = $resource('/api/todo_lists/:todo_list_id/todos/:id',
        { todo_list_id: todoListId },
        { update: { method: 'PUT' } }
      )
      @errorHandler = errorHandler

    create: (attrs) ->
      new @service.save todo: attrs, ((todo) -> attrs.id = todo.id), @errorHandler
      attrs

    delete: (todo) ->
      new @service.delete { id: todo.id }, (-> null), @errorHandler

    update: (todo, attrs) ->
      #@service.get(todo.id).$update(attrs)
      new @service.update { id: todo.id }, { todo: attrs }, (-> null), @errorHandler
