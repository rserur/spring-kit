class AddPaperclipAttachment < ActiveRecord::Migration
  def up
    add_attachment :posts, :media
  end

  def down
    remove_attachment :posts, :media
  end
end
