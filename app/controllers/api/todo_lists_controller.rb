class Api::TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.find(params[:id])
  end
end
