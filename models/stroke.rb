class Stroke < ActiveRecord::Base
  belongs_to :section

  def as_json(options={})
    super(only: [:id, :color])
  end
end 
