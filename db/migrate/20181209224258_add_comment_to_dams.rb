class AddCommentToDams < ActiveRecord::Migration[5.1]

  def up
    add_column :dams, :comment, :binary
  end

  def down
    remove_column :dams, :comment, :binary
  end
end
