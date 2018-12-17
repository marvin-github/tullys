class AddCommentToSires < ActiveRecord::Migration[5.1]

  def up
    add_column :sires, :comment, :binary
  end

  def down
    remove_column :sires, :comment, :binary
  end
end
