class Page < ActiveRecord::Base
  extend FriendlyId
  include PgSearch

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

  # Search (weight of A is heaviest).
  pg_search_scope(
    :search,
    :against => {
      :title => "A",
      :content => "B"
    },
    :using => {
      :tsearch => {
        :prefix => true,
        :dictionary => "english"
      }
    })
end

