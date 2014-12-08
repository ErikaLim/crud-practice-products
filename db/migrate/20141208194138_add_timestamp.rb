class AddTimestamp < ActiveRecord::Migration
  def change
    add_timestamps(:products)
    
  end
end
