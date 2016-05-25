class Section < ActiveRecord::Base
  belongs_to :drawing

  def as_json(options={})
    super(only: [:id, :latitude, :longitude])
  end
end