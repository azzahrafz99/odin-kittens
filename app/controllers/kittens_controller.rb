class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @kittens }
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @kitten }
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.valid?
      flash[:notice] = 'Kitten added successfully!'
    else
      flash[:errors] = "Warning : #{@kitten.errors.full_messages}"
    end
    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    if @kitten.valid?
      flash[:notice] = "Kitten has been updated!"
      redirect_to kittens_path
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id]).destroy
    flash[:notice] = "Kitten has been deleted!"
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
