class Section < ActiveRecord::Base
  belongs_to :drawing

  has_many :points, dependent: :destroy

  accepts_nested_attributes_for :points

  def as_json(options={})
    super(include: { points: { only: [:latitude, :longitude] } })
  end
end