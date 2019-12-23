class TodosController < ApplicationController
  def index
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").order(created_at: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").order(created_at: "desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").order(created_at: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").order(created_at: "desc")
  end

  def new
  end
  
  def create
     if @todo = Todo.create(todo_params)
      @todo.status = "アクティブ"
      @todo.save
     redirect_to root_path
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
      render :new
    end
  end

  private
  def todo_params
    params.permit(
      :title,
      :content,
      :urgency,
      :importance
    ).merge(user_id: current_user.id)
  end
end

