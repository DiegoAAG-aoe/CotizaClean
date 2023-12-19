class PostSearch < ActiveRecord::Migration[7.1]
  def up
    execute("CREATE VIRTUAL TABLE fts_posts USING fts5(title, content, post_id)")
  end

  def down
    execute("DROP TABLE IF EXISTS fts_posts")
  end
end
