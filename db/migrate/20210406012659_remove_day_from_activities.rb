class RemoveDayFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :day, :datetime
  end
end
