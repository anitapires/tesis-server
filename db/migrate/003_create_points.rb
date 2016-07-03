class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :section, index: true, foreign_key: true
      t.decimal    :latitude, precision: 11, scale: 8
      t.decimal    :longitude, precision: 11, scale: 8 
    end
  end
end