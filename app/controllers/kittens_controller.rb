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
      flash[:notice] = 'Kitten has been updated!'
      redirect_to kittens_path
    else
      render :edit
    end
  end

  def destroy
    flash[:error] = 'Kitten has been deleted!' if @kitten.destroy
    redirect_to kittens_path
  end

  def routing
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def kitten
    @kitten = Kitten.find(params[:id])
  end
end
