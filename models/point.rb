class Point < ActiveRecord::Base
  belongs_to :section

  def as_json(options={})
    super(only: [:id, :latitude, :longitude])
  end
end 
