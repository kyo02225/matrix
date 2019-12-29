class TodosController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :done]

  def index
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").order(created_at: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").order(created_at: "desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").order(created_at: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").order(created_at: "desc")
  end

  def new
    @project = Project.new
    @context = Context.new
    @todo = Todo.new
  end
  
  def create
    @project = Project.create(project_params)
    @context = Context.create(context_params)
    @todo = @context.todos.new(todo_params)
    @todo.project_id = @project.id
    @todo.status = "アクティブ"
    if @todo.save
      redirect_to root_path
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
    end
  end

  def show
  end

  def done
    @todo.status = "完了"
    @todo.save
    redirect_to root_path
  end

  def deadline
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").order(deadline: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").order(deadline:"desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").order(deadline: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").order(deadline: "desc")
  end

  private
  def set_params
    @todo = Todo.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :title
    ).merge(user_id: current_user.id)
  end
  
  def context_params
    params.require(:context).permit(
      :title
    ).merge(user_id: current_user.id)
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

