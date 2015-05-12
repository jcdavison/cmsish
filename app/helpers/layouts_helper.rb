module LayoutsHelper
  def set_display_index_value position, tile_indices
    tile_indices.select {|i| i.tile_index == position}.first.tile_id
  end
end
