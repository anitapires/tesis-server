class Drawing < ActiveRecord::Base
  has_many :sections

  def as_json(options={})
    super(include: {sections: { only: [:latitude, :longitude] } })
  end
end