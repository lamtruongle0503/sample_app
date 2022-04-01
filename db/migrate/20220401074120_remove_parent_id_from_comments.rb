class RemoveParentIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :ParentId, :integer
  end
end
