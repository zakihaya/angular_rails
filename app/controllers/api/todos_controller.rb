class Api::TodoListsController < ApplicationController
  before_action :set_todo_list

  def create
    todo = @todo_list.todos.create!(todo_params)
    render json: todo, status: 201
  end

  def update
    todo = @todo_list.find(params[:id])
    todo.update!(todo_params)
    render json: todo, status: 204
  end

  def destroy
    todo = @todo_list.find(params[:id])
    todo.update!(todo_params)
    render json: todo, status: 204
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
