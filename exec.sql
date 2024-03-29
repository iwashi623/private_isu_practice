ALTER TABLE comments ADD INDEX index_comments_on_post_id_created_at(post_id, created_at);

ALTER TABLE posts ADD INDEX index_posts_on_created_at(created_at);

ALTER TABLE comments ADD INDEX index_comments_on_user_id(user_id);

ALTER TABLE users ADD INDEX index_users_on_account_name(account_name);
