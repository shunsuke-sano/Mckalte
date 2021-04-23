class AddFromToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :from, :string
  end
end
