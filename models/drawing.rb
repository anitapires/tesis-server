class Drawing < ActiveRecord::Base
  has_many :sections

  accepts_nested_attributes_for :sections

  def as_json(options={})
    super(include: { sections: { include: { points: { only: [:id, :latitude, :longitude] } } } })
  end
end