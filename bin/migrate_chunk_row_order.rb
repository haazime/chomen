ActiveRecord::Base.record_timestamps = false
Chunk.transaction do
  Chunk.order(updated_at: :desc).each do |c|
    c.update_attribute :row_order_position, 0
  end
end
ActiveRecord::Base.record_timestamps = true
