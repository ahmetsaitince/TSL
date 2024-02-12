class PersonelsController < ApplicationController
  def index
    @personels = Personel.all
  end

  def show
    @personel = Personel.find(params[:id])
  end

  def new
    @personel = Personel.new
  end

  def create
    @personel = Personel.new(personel_params) # this part is important try to understand here.

    if @personel.save
      redirect_to @personel
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @personel = Personel.find(params[:id])
  end

  def update
    @personel = Personel.find(params[:id])

    if @personel.update(personel_params)
      redirect_to @personel
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @personel = Personel.find(params[:id])
    @personel.destroy

    redirect_to root_path, status: :see_other # 303 See Other code
  end

  private

  def personel_params
    # permit! allows all
    params.require(:personel).permit(:name, :surname, :department, :nation, :status, :entry, :due, :birth)
  end
end
