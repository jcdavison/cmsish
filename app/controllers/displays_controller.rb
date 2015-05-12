class DisplaysController < ApplicationController
  def new
    @tiles = Tile.published
  end

  def create
    display = Display.create display_params
    set_indices display
    display.publish! if should_publish? :display
    redirect_to root_path
  end

  def edit
    @tiles = Tile.published
    @display = Display.find(params[:id])
    @display_tiles = @display.tiles
    @tile_indices = @display.tile_indices
  end

  def update
    display = Display.find(params[:id])
    update_tile_indices display
    display.toggle_published! if should_toggle_publish? display
    redirect_to root_path
  end
  private

    def update_tile_indices display
      params[:display][:tile_indices_attributes].each_with_index do |ti_info|
        tile_index = display.tile_indices.find_by(tile_index: ti_info[0].to_i + 1)
        tile_index.update_attributes tile_id: ti_info[1][:tile_id]
      end
    end

    def display_params
      params.require(:display).permit(:href, :content)
    end

    def tile_index_params
      params.require(:display).permit(:position_1, :position_2, :position_3)
    end

    def set_indices display
      tile_index_params.each do |position_key, tile_id|
        position_index = position_key.to_s[-1].to_i
        display.tile_indices.create tile_id: tile_id, tile_index: position_index
      end
    end

    def update_indices tile_indices
      tile_indices.each do |tile_index_obj|
        params[:display_indices].each do |k,v|
          if k[-1].to_i == tile_index_obj.tile_index
            tile_index_obj.update_attributes tile_id: v
          end
        end
      end
    end

end
