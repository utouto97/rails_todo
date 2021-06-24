class TodosController < ApplicationController
  def index
    @todos = Todo.order(:created_at, :id)
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to :action => 'index'
    else
      @todos = Todo.all
      render 'index'
    end
  end

  def destroy
    @todo = Todo.find(params.require(:id))
    @todo.destroy
    redirect_to :action => 'index'
  end

  def toggle
    @todo = Todo.find(params.require(:id))
    new_status = @todo.status == 'In progress' ? 'Complete' : 'In progress'
    @todo.update(status: new_status)
    redirect_to :action => 'index'
  end

  def pre_edit
    @edit_id = params.require(:id)
    @todos = Todo.order(:created_at, :id)
    render :index
  end

  def change
    @todo = Todo.find(params.require(:id))
    @todo.update(todo_params)
    redirect_to :action => 'index'
  end

  private
  def todo_params
    return params.permit(:title, :description, :status)
  end
end
