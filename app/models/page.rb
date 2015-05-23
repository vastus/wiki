class Page < ActiveRecord::Base
  # Relations.
  belongs_to(:user)

  # Validations.
  validates(:title, :presence => true,
                    :uniqueness => true)
  validates(:content, :presence => true)
  validates(:user_id, :presence => true)
end

