class HomeController < ApplicationController
  def index
    @display = set_display
  end

  private 
    def set_display
      first_published_display = Display.published.last
      if first_published_display.nil? || Tile.published.nil?
        OpenStruct.new id: nil, tiles: nil
      else
        OpenStruct.new id: first_published_display.id, tiles: first_published_display.tiles
      end
    end
end
