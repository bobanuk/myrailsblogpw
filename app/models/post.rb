class Post < ActiveRecord::Base
  acts_as_punchable

  extend FriendlyId
  friendly_id :title, use: :slugged

end
