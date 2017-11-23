class AddAttachmentLogotypeToCompanies < ActiveRecord::Migration[4.2]
  def self.up
    change_table :companies do |t|
      t.attachment :logotype
    end
  end

  def self.down
    remove_attachment :companies, :logotype
  end
end
