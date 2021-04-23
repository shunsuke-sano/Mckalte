class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :goodpoint
      t.string :badpoint
      t.text :free
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
