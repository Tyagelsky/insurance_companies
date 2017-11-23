class Company < ApplicationRecord
  has_attached_file :logotype, styles: { thumb: "30x30>" }
  validates_attachment_content_type :logotype, content_type: /\Aimage\/.*\z/
  validates :name, :description, presence: true

  def logotype_attributes=(attributes)
    logotype.clear if has_destroy_flag?(attributes) && !logotype.dirty?
  end
end
