ALTER TABLE comments ADD INDEX index_comments_on_post_id_created_at(post_id, created_at);
