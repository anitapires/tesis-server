class CreateStrokes < ActiveRecord::Migration
  def change
    create_table :strokes do |t|
      t.references :section, index: true, foreign_key: true
      t.string     :color
    end

    remove_column :sections, :color, :string
  end
end