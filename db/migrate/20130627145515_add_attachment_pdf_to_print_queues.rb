class AddAttachmentPdfToPrintQueues < ActiveRecord::Migration
  def self.up
    change_table :print_queues do |t|
      t.has_attached_file :pdf
    end
  end

  def self.down
    drop_attached_file :print_queues, :pdf
  end
end
