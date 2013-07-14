class AddMediaTypeToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :mediatype_id, :integer
  end
end
