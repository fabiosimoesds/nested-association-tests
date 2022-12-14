class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.integer :parent_id
      t.text :description

      t.timestamps
    end
  end
end
