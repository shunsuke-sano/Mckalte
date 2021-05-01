class AddDourokuToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :douroku, :integer
  end
end
