CREATE DATABASE youtube;

USE youtube;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    email VARCHAR(254) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    sex ENUM('male','female') NOT NULL,
    country VARCHAR(45) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,

    CONSTRAINT email_UNIQUE UNIQUE (email),
    CONSTRAINT user_name_UNIQUE UNIQUE (user_name)
);

CREATE TABLE Channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(100) NOT NULL,
    channel_description LONGTEXT NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,

    CONSTRAINT channel_name_UNIQUE UNIQUE (channel_name),


    CONSTRAINT fk_user_channel
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    video_title VARCHAR(100) NOT NULL,
    video_description LONGTEXT NOT NULL,
    video_size BIGINT UNSIGNED NOT NULL,
    video_file_name VARCHAR(100) NOT NULL,
    video_duration INT UNSIGNED NOT NULL,
    thumbnail VARCHAR(100) NOT NULL,
    views_count BIGINT UNSIGNED NOT NULL DEFAULT 0,
    likes_count BIGINT UNSIGNED NOT NULL DEFAULT 0,
    dislikes_count BIGINT UNSIGNED NOT NULL DEFAULT 0,
    publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    visibility ENUM('public', 'hidden', 'private') NOT NULL,
    user_id INT NOT NULL,

    CONSTRAINT fk_user_videos
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(45) NOT NULL,

    CONSTRAINT tag_name_UNIQUE UNIQUE (tag_name)
);

CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(100) NOT NULL,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    visibility ENUM('public', 'private') NOT NULL,
    user_id INT NOT NULL,

    CONSTRAINT fk_user_playlist
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Video_Tags (
    video_id INT NOT NULL,
    tag_id INT NOT NULL,

    CONSTRAINT pk_video_tags PRIMARY KEY (video_id, tag_id),

    CONSTRAINT fk_video_tag_video
    FOREIGN KEY (video_id)
    REFERENCES Videos(video_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_video_tag_tag
    FOREIGN KEY (tag_id)
    REFERENCES Tags(tag_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Playlists_Videos (
    video_id INT NOT NULL,
    playlist_id INT NOT NULL,

    CONSTRAINT pk_playlists_videos PRIMARY KEY (video_id, playlist_id),

    CONSTRAINT fk_videos_playlists_video
    FOREIGN KEY (video_id)
    REFERENCES Videos(video_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_videos_playlists_playlist
    FOREIGN KEY (playlist_id)
    REFERENCES Playlists(playlist_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    channel_id INT NOT NULL,
    subscription_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_user_channel UNIQUE (user_id, channel_id),

    CONSTRAINT fk_user_subscriptor
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_channel_subscribed
    FOREIGN KEY (channel_id)
    REFERENCES Channels(channel_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Comments (
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text LONGTEXT NOT NULL,
    publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    video_id INT NOT NULL,

    CONSTRAINT fk_user_comment
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION,

    CONSTRAINT fk_video_comments
    FOREIGN KEY (video_id)
    REFERENCES Videos(video_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Video_Reactions (
    video_reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    reaction_type ENUM('like', 'dislike') NOT NULL,
    reaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_user_video UNIQUE (user_id, video_id),

    CONSTRAINT fk_user_reaction
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_video_reactioned
    FOREIGN KEY (video_id)
    REFERENCES Videos(video_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Comments_Reactions (
    comment_reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    reaction_type ENUM('like', 'dislike') NOT NULL,
    reaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_user_comment UNIQUE (user_id, comment_id),

    CONSTRAINT fk_user_comment_reaction
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_comment_reactioned
    FOREIGN KEY (comment_id)
    REFERENCES Comments(comment_id)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
