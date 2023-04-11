ALTER TABLE comments ADD INDEX index_comments_on_post_id_created_at(post_id, created_at);

ALTER TABLE posts ADD INDEX index_posts_on_created_at(created_at);
