class KittensController < ApplicationController
  before_action :kitten, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.valid?
      flash[:notice] = 'Kitten added successfully!'
      redirect_to kittens_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @kitten.update(kitten_params)
    if @kitten.valid?
      flash[:notice] = "Kitten has been updated!"
      redirect_to kittens_path
    end
  end

  def destroy
    @kitten.destroy
    flash[:notice] = "Kitten has been deleted!"
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def kitten
    @kitten = Kitten.find(params[:id])
  end
end
