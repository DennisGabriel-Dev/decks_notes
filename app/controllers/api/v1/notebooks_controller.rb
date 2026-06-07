class Api::V1::NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :update, :destroy]

  def index
    @notebooks = Notebook.all
    render json: @notebooks, status: :ok if @notebooks.present?
    render json: { error: 'No notebooks found' }, status: :no_content
  end

  def show
    render json: @notebook, status: :ok if @notebook.present?
    render json: { error: 'Notebook not found' }, status: :not_found
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user = current_user
    if @notebook.save
      render json: @notebook, status: :created
    else
      render json: @notebook.errors, status: :unprocessable_entity
    end
  end

  def update
    if @notebook.update(notebook_params)
      render json: @notebook, status: :ok
    else
      render json: @notebook.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @notebook.destroy
    head :no_content
  end

  private

  def set_notebook
    @notebook = Notebook.find(params[:id])
  end

  def notebook_params
    params.require(:notebook).permit(:name)
  end
end
