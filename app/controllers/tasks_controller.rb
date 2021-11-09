class TasksController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :delete]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def show; end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def delete
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_restaurant
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
