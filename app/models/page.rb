class Page < ActiveRecord::Base
  extend FriendlyId

  # Relations.
  belongs_to(:user)

  # Validations.
  validates(:title, :presence => true,
                    :uniqueness => true)
  validates(:content, :presence => true)
  validates(:user_id, :presence => true)
  validates(:slug, :uniqueness => true)

  # Use title as slug.
  friendly_id(:title, :use => [:slugged, :finders])
end

