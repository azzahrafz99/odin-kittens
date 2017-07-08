class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { only_integer: true }
  validates :softness, presence: true
  validates :cuteness, presence: true
  validate :validate_cuteness
  validate :validate_softness

  def validate_cuteness
    unless cuteness == 'low' || cuteness == 'medium' || cuteness == 'high'
      errors.add(:cuteness, "Fill with low, medium, or high!")
    end
  end

  def validate_softness
    unless softness == 'low' || softness == 'medium' || softness == 'high'
      errors.add(:softness, "Fill with low, medium, or high!")
    end
  end
end
