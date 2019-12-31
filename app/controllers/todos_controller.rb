class TodosController < ApplicationController
before_action :set_params, only: [:edit, :update, :destroy, :done]

  def index
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
  end

  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    @todo.status = "アクティブ"
    if @todo.save
      redirect_to root_path
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
    end
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    if @todo.save
      redirect_to root_path
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
    end
  end

  def destroy
    if @todo.destroy
    redirect_to root_path
    end
  end

  def done
    @todo.status = "完了"
    @todo.save
    redirect_to root_path
  end

  def done_index
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").where(status: "完了")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").where(status: "完了")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").where(status: "完了")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").where(status: "完了")
    render action: :index
  end

  def deadline
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(deadline: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(deadline:"desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(deadline: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(deadline: "desc")
    render action: :index
  end

  private
  def set_params
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(
      :title,
      :content,
      :urgency,
      :importance,
      :deadline
    ).merge(user_id: current_user.id)
  end
end

