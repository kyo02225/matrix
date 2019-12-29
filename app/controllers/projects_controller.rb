class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(created_at: "desc")
  end

  def show
    @project = Project.find(params[:id])
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").where(project_id: @project.id).order(created_at: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").where(project_id: @project.id).order(created_at: "desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").where(project_id: @project.id).order(created_at: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").where(project_id: @project.id).order(created_at: "desc")
  end
end
