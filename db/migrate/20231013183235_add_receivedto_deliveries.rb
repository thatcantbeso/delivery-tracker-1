class AddReceivedtoDeliveries < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :received, :boolean
  end
end
