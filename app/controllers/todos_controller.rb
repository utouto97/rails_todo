class TodosController < ApplicationController
  def index
    @todos = Todo.order(:created_at, :id)
  end

  def create
    @title = params[:title]
    @description = params[:description]

    @todo = Todo.new(
      title: @title,
      description: @description,
      status: 'In progress'
    )

    if @todo.save
      redirect_to :action => 'index'
    else
      @todos = Todo.all
      render 'index'
    end
  end

  def destroy
    @id = params[:id]
    @todo = Todo.find(@id)
    @todo.destroy
    redirect_to :action => 'index'
  end

  def toggle
    @id = params[:id]
    @todo = Todo.find(@id)
    new_status = @todo.status == 'In progress' ? 'Complete' : 'In progress'
    @todo.update(status: new_status)
    redirect_to :action => 'index'
  end
end
