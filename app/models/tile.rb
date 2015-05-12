class Tile < ActiveRecord::Base
  include PublishableHelper
  has_many :tile_indices
  has_many :displays, through: :tile_indices
end
