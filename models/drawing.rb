class Drawing < ActiveRecord::Base
  has_many :sections, dependent: :destroy

  accepts_nested_attributes_for :sections

  def as_json(options={})
    super(include: { sections: { include: { stroke: { only: [:color] }, points: { only: [:id, :latitude, :longitude] } } } })
  end
end