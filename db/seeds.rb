# frozen_string_literal: true

Cage.create!([
               { capacity: 6, power_status: :active },
               { capacity: 4, power_status: :active },
               { capacity: 4, power_status: :active }
             ])

Dinosaur.create!([
                   { name: 'Rex', species: :tyrannosaurus, diet: :carnivore, cage_id: 1 },
                   { name: 'Blue', species: :velociraptor, diet: :carnivore, cage_id: 1 },
                   { name: 'Spiny', species: :spinosaurus, diet: :carnivore, cage_id: 1 },
                   { name: 'Meg', species: :megalosaurus, diet: :carnivore, cage_id: 1 },
                   { name: 'Brad', species: :brachiosaurus, diet: :herbivore, cage_id: 2 },
                   { name: 'Stew', species: :stegosaurus, diet: :herbivore, cage_id: 2 },
                   { name: 'Annie', species: :ankylosaurus, diet: :herbivore, cage_id: 2 },
                   { name: 'Tim', species: :triceratops, diet: :herbivore, cage_id: 2 }
                 ])
