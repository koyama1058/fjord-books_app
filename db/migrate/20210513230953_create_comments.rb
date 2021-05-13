class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentalbe, polymorphic: true, null: false
      t.references :user

      t.timestamps
    end
  end
end
