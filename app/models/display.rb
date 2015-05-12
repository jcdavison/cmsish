class Display < ActiveRecord::Base
  include PublishableHelper
  has_many :tile_indices
  has_many :tiles, through: :tile_indices
  accepts_nested_attributes_for :tile_indices
end
