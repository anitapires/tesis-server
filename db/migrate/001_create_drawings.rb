class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.timestamps null: true
    end
  end
end