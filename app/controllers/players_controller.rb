class PlayersController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    # @players = Player.all

    render Players::IndexView.new(
      player: @players)
  end

  def show
    @player = Player.find(params[:id])

    render Players::ShowView.new(
      player: @player)
  end

  def new # row
    @player = Player.new

    render Players::NewView.new(player: @player) # klasör adı, name adı, render ettiğin yerdeki isimlere bak
  end

  def create
    @player = Player.new(player_params)
    puts 'MARK - START'
    if @player.save
      redirect_to @player
    else
      puts 'MARK - END'
      render Players::NewView.new(
        player: @player), status: :unprocessable_entity
    end
  end

  def edit # row
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player = @personel.find(params[:id])
    @player.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def player_params
    params.require(:player).permit!
  end
end
