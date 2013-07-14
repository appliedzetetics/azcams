class AddAttachmentTemplateToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :template
    end
  end

  def self.down
    drop_attached_file :templates, :template
  end
end
