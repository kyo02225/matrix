class ContextsController < ApplicationController
  def index
    @contexts = Context.all.order(created_at: "desc")
  end

  def show
    @context = Context.find(params[:id])
    @todos_upper_left = Todo.where(urgency: "low").where(importance: "high").where(context_id: @context.id).order(created_at: "desc")
    @todos_upper_right = Todo.where(urgency: "high").where(importance: "high").where(context_id: @context.id).order(created_at: "desc")
    @todos_lower_left = Todo.where(urgency: "low").where(importance: "low").where(context_id: @context.id).order(created_at: "desc")
    @todos_lower_right = Todo.where(urgency: "high").where(importance: "low").where(context_id: @context.id).order(created_at: "desc")
  end
end
