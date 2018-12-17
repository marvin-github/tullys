class AddRecordsToSaleStatuses < ActiveRecord::Migration[5.1]
  def change
    SaleStatus.new(:name => "On Hold", :description => "On Hold").save
    SaleStatus.new(:name => "Med Room", :description => "Med Room").save
  end
end
