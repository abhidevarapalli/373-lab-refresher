class Task < ApplicationRecord
    has_many :chores
    has_many :children, through: :chores

    validates_presence_of :name
    validates_numericality_of :points
    validates :points, numericality: { only_integer: true }
    validates :points, numericality: { greater_than: 0 }
    scope :active, -> {where(active: true)}
    scope :alphabetical, -> {order('name')}
end
