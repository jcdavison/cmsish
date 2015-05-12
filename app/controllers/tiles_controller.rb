class TilesController < ApplicationController
  def index
    @tiles = Tile.all
  end

  def create
    tile = Tile.create tile_params
    tile.publish! if should_publish? :tile
    redirect_to tiles_path
  end

  def new
    @tile = Tile.new
  end

  def edit
    @tile = Tile.find params[:id]
  end

  def update
    tile = Tile.find params[:id]
    tile.publish! if should_publish? :tile
    redirect_to tiles_path
  end

  def destroy
    tile = Tile.find params[:id]
    tile.destroy
    redirect_to tiles_path
  end

  private
    def tile_params
      params.require(:tile).permit(:href, :content)
    end
end
