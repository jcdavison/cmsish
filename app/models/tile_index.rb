class TileIndex < ActiveRecord::Base
  belongs_to :display
  belongs_to :tile
end
