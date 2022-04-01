class CreateCommentHierarchies < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_hierarchies do |t|

      t.timestamps
    end
  end
end
