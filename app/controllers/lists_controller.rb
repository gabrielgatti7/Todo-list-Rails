class ListsController < ApplicationController
  # A before_action allows you to extract shared code between actions and run it before the action
  before_action :set_list, only: %i[ show edit update destroy ]

  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "Lista criada com sucesso!"
    else
      flash[:alert] = "O nome da lista não pode estar vazio."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "Lista atualizada com sucesso!"
    else
      flash[:alert] = "O nome da lista não pode estar vazio."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end


  private

    def set_list
      # To query the database, we use params to access the request parameters.
      # In this case, we're using the :id from our route /lists/:id.
      # When we visit /lists/1, the params hash contains {id: 1} which results in our show action calling
      # List.find(1) to load List with ID of 1 from the database.

      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
