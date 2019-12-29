class TodosController < ApplicationController
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
      @todo = @project.todos.new(todo_params)
      @todo = @context.todos.new(todo_params)
      @todo.status = "アクティブ"
      if @todo.save
        redirect_to root_path
      else
        flash.now[:alert] = "タスクの作成に失敗しました"
        render :new
      end
  end

  private
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

