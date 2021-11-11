class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }, presence: true
  validates :movie_id, presence: true
  validates_uniqueness_of :list_id, :scope => [:movie_id]
end
