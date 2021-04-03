class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.datetime :day
      
      t.timestamps
    end
  end
end
