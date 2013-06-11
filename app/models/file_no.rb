class FileNo < ActiveRecord::Base
  belongs_to :account
  attr_accessible :file_no

  def self.next_file_no(a)
    if a.nil?
      a = current_user.account
    end
    FileNo.transaction do
      r = FileNo.find_or_create_by_account_id(a, :file_no => 0)
      r.file_no = r.file_no + 1
      r.save!
      r.file_no
    end
  end
end
