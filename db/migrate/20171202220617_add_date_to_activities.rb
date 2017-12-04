class AddDateToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :date, :string
  end
end
