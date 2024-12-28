class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: %i[ edit update destroy ]

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list), notice: "Tarefa criada com sucesso!"
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@list), notice: "Tarefa atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to list_path(@list)
  end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = @list.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
