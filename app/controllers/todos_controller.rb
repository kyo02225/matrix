class TodosController < ApplicationController
before_action :set_params, only: [:edit, :update, :destroy, :done, :done_back]

  def index
    @todos_upper_left = current_user.todos.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
    @todos_upper_right = current_user.todos.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
    @todos_lower_left = current_user.todos.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
    @todos_lower_right = current_user.todos.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
  end

  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    @todo.status = "アクティブ"
    if @todo.save
      redirect_to root_path, notice: "タスクを作成しました"
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
      render  :new
    end
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    if @todo.save
      redirect_to root_path, notice: "タスクを作成しました"
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
      render :edit
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

  def done_back
    @todo.status = "アクティブ"
    @todo.save
    redirect_to root_path
  end

  def done_index
    @todos_upper_left = current_user.todos.where(urgency: "low").where(importance: "high").where(status: "完了")
    @todos_upper_right = current_user.todos.where(urgency: "high").where(importance: "high").where(status: "完了")
    @todos_lower_left = current_user.todos.where(urgency: "low").where(importance: "low").where(status: "完了")
    @todos_lower_right = current_user.todos.where(urgency: "high").where(importance: "low").where(status: "完了")
    render :index
  end

  def deadline
    @todos_upper_left = current_user.todos.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(deadline: "desc")
    @todos_upper_right = current_user.todos.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(deadline:"desc")
    @todos_lower_left = current_user.todos.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(deadline: "desc")
    @todos_lower_right = current_user.todos.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(deadline: "desc")
    render :index
  end

  def search 
    @todos = current_user.todos.search(params[:search])
    if @todos.present?
      @todos_upper_left = @todos.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
      @todos_upper_right = @todos.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
      @todos_lower_left = @todos.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
      @todos_lower_right = @todos.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
    else
      @todos_upper_left = current_user.todos.where(urgency: "low").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
      @todos_upper_right = current_user.todos.where(urgency: "high").where(importance: "high").where(status: "アクティブ").order(created_at: "desc")
      @todos_lower_left = current_user.todos.where(urgency: "low").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
      @todos_lower_right = current_user.todos.where(urgency: "high").where(importance: "low").where(status: "アクティブ").order(created_at: "desc")
    end
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

