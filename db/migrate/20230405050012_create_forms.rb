class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :title
      t.string :description
      t.jsonb :components

      t.timestamps
    end
  end
end
