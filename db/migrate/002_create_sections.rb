class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :drawing, index: true, foreign_key: true
      t.string     :color
    end
  end
end