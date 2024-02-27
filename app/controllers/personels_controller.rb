class PersonelsController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    # @personels = Personel.all

    @q = Personel.ransack(params[:q])
    @personels = @q.result(distinct: true)

    render Personels::IndexView.new(
      q: @q, personels: @personels)
  end

  def show
    @personel = Personel.find(params[:id])

    render Personels::ShowView.new(
      personel: @personel)
  end

  def new # row
    @personel = Personel.new

    render Personels::NewView.new(personel: @personel)
  end

  def create # row
    @personel = Personel.new(personel_params) # this part is important try to understand here.

    if @personel.save
      redirect_to @personel
    else
      render Personels::ShowView.new(
        personel: @personel), status: :unprocessable_entity
    end
  end

  def edit # row
    @personel = Personel.find(params[:id])
  end

  def update # row
    @personel = Personel.find(params[:id])

    if @personel.update(personel_params)
      redirect_to @personel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy # row
    @personel = Personel.find(params[:id])
    @personel.destroy

    redirect_to root_path, status: :see_other # 303 See Other code
  end

  private

  def personel_params
    # permit! allows all
    params.require(:personel).permit(:name, :surname, :department, :nation, :status, :entry, :due, :birth, :img)
  end
end
