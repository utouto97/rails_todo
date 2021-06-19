class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(
      title: params[:title],
      description: params[:description],
      status: 'In progress'
    )

    if @todo.save
      redirect_to :action => 'index'
    else
      @todos = Todo.all
      @title = params[:title]
      @description = params[:description]
      render 'index'
    end
  end
end
