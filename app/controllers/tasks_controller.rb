class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: %i[ edit update destroy toggle ]

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list), notice: "Tarefa criada com sucesso!"
    else
      flash[:alert] = "A tarefa não pode estar vazia."
      redirect_to list_path(@list)
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@list), notice: "Tarefa atualizada com sucesso!"
    else
      flash[:alert] = "A tarefa não pode estar vazia."
      redirect_to edit_list_task_path(@list)
    end
  end

  def destroy
    @task.destroy
    redirect_to list_path(@list), notice: "Tarefa removida com sucesso!"
  end

  def toggle
    @task.completed = !@task.completed
    if @task.save
      respond_to do |format|
        format.html { redirect_to list_path(@task.list) }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to list_path(@task.list), alert: "Tarefa não pode ser atualizada com sucesso." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
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
