class PlayersController < ApplicationController
  def create
    @personel = Personel.find(params[:personel_id])
    @player = @personel.players.create(player_params)
    redirect_to personel_path(@personel)
  end

  def destroy
    @personel = Personel.find(params[:personel_id])
    @player = @personel.players.find(params[:id])
    @player.destroy
    redirect_to personel_path(@personel), status: :see_other
  end

  private

  def player_params
    params.require(:player).permit!
  end
end
