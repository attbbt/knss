class Pet < ActiveRecord::Base

  validates_presence_of :age, :weight, :breed, :name

  validates_length_of :name, maximum: 35
  validates_length_of :breed, maximum: 35

  validates_inclusion_of :pet_type, in: %w(dog cat bird)

  has_many :appointments
  belongs_to :customer, class_name: "User"

end