class AddMokuhyouToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :basetarget, :string
    add_column :activities, :basecomment, :text
    add_column :activities, :extarget, :string
    add_column :activities, :excomment, :text
    add_column :activities, :mctarget, :string
    add_column :activities, :mccomment, :text
    add_column :activities, :fb, :text
  end
end
