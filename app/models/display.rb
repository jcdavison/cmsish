class Display < ActiveRecord::Base
  include PublishableHelper
  has_many :tile_indices
  has_many :tiles, through: :tile_indices
end
