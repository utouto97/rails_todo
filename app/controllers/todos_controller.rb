class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @title = params[:title]
    @description = params[:description]

    @todo = Todo.new(
      title: @title,
      description: @Description,
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
end
