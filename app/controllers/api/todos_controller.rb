class Api::TodoListsController < ApplicationController
  before_action :set_todo_list

  def create
    todo = @todo_list.todos.create!(todo_params)
    render json: todo, status: 201
  end

  def update

  end

  def destroy

  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
