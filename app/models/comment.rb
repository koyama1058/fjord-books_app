class Comment < ApplicationRecord
  belongs_to :commentalbe, polymorphic: true
end
