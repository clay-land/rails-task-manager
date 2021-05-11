class TasksController < ApplicationController
  def all
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(strong_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(strong_params)
    redirect_to task_path(@task)
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
