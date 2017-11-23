class Company < ApplicationRecord
  has_attached_file :logotype, styles: { thumb: "30x30>" }
  validates_attachment_content_type :logotype, content_type: /\Aimage\/.*\z/
  validates :name, :description, presence: true
end
