class Cage < ApplicationRecord
  has_many :dinosaurs

  enum :power_status, { active: 0, down: 1 }

  validates :power_status, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }

  def dinosaur_count
    dinosaurs.count
  end

  def has_dinosaurs?
     dinosaur_count > 0
  end

  def remaining_capacity
    capacity - dinosaurs.length
  end

  def full?
    remaining_capacity.zero? 
  end

  def space_available?
    empty? || !full?
  end

  def empty?
    dinosaurs.blank?
  end

  def type_match?(dinosaur)
    empty? || dinosaurs.first.diet == dinosaur.diet
  end

  def addition_possible?(dinosaur)
    active? && space_available? && type_match?(dinosaur)
  end
end