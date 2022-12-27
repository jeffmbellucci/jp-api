class Dinosaur < ApplicationRecord
  belongs_to :cage

  enum :species, {
    tyrannosaurus: 0,
    velociraptor: 1,
    spinosaurus: 2, 
    megalosaurus: 3, 
    brachiosaurus: 4, 
    stegosaurus: 5, 
    ankylosaurus: 6,
    triceratops: 7
  }

  enum :diet, {carnivore: 0, herbivore: 1}

  validates :name, presence: true
  validates :species, presence: true
  validates :diet, presence: true
  validate :cage_compatible

  def cage_compatible
    errors.add(:cage, "incompatible cage") if cage.present? && !cage.addition_possible?(self)
  end
end
