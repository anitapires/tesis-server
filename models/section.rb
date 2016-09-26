class Section < ActiveRecord::Base
  belongs_to :drawing

  has_many :points, dependent: :destroy

  has_one  :stroke

  accepts_nested_attributes_for :points
  accepts_nested_attributes_for :stroke

  def as_json(options={})
    super(include: { stroke: { only: [:color] }, points: { only: [:latitude, :longitude] } })
  end
end