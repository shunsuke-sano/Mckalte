class AddImpToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :impression, :text
  end
end
