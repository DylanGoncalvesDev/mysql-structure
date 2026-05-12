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

INSERT INTO Users
(user_name, email, password_hash, birth_date, sex, country, postal_code)
VALUES
('ana_dev', 'ana@mail.com', 'hash_ana_123', '2000-04-12', 'female', 'Spain', '08001'),
('luis_games', 'luis@mail.com', 'hash_luis_123', '1998-09-21', 'male', 'Spain', '28001'),
('marta_code', 'marta@mail.com', 'hash_marta_123', '2002-01-05', 'female', 'Mexico', '01000'),
('sofia_music', 'sofia@mail.com', 'hash_sofia_123', '1995-07-18', 'female', 'Argentina', 'C1001');

INSERT INTO Channels
(channel_name, channel_description, creation_date, user_id)
VALUES
('Ana Aprende', 'Canal de tutoriales de programación y bases de datos', '2025-01-10 10:00:00', 1),
('Luis Gaming', 'Canal de videojuegos y directos', '2025-02-15 12:30:00', 2),
('Marta Tech', 'Tecnología, SQL y desarrollo web', '2025-03-20 09:15:00', 3);

INSERT INTO Videos
(video_title, video_description, video_size, video_file_name, video_duration, thumbnail, views_count, likes_count, dislikes_count, publication_date, visibility, user_id)
VALUES
('Aprendiendo SQL', 'Curso básico para entender SELECT, JOIN y GROUP BY', 52428800, 'aprendiendo_sql.mp4', 600, 'sql_thumb.jpg', 1200, 2, 0, '2025-04-10 18:00:00', 'public', 1),
('Tutorial MySQL Workbench', 'Cómo crear diagramas EER paso a paso', 73400320, 'mysql_workbench.mp4', 720, 'workbench_thumb.jpg', 850, 1, 1, '2025-04-12 19:30:00', 'public', 1),
('Partida Minecraft', 'Gameplay de supervivencia con amigos', 104857600, 'minecraft.mp4', 900, 'minecraft_thumb.jpg', 2500, 2, 1, '2025-05-01 21:00:00', 'public', 2),
('Video privado de pruebas', 'Video interno para pruebas', 20480000, 'privado.mp4', 300, 'private_thumb.jpg', 0, 0, 0, '2025-05-05 10:00:00', 'private', 1),
('Introducción a HTML', 'Primeros pasos con HTML', 41943040, 'html_intro.mp4', 480, 'html_thumb.jpg', 600, 1, 0, '2025-06-01 16:00:00', 'hidden', 3);

INSERT INTO Tags
(tag_name)
VALUES
('sql'),
('mysql'),
('tutorial'),
('gaming'),
('minecraft'),
('programacion'),
('html');

INSERT INTO Video_Tags
(video_id, tag_id)
VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 2),
(2, 3),
(2, 6),
(3, 4),
(3, 5),
(4, 3),
(5, 3),
(5, 6),
(5, 7);

INSERT INTO Subscriptions
(user_id, channel_id, subscription_date)
VALUES
(2, 1, '2025-04-11 09:00:00'),
(3, 1, '2025-04-11 10:00:00'),
(4, 1, '2025-04-12 11:00:00'),
(1, 2, '2025-05-02 12:00:00'),
(3, 2, '2025-05-03 15:30:00'),
(1, 3, '2025-06-02 08:45:00');

INSERT INTO Playlists
(playlist_name, creation_date, visibility, user_id)
VALUES
('Favoritos de Ana', '2025-05-10 10:00:00', 'public', 1),
('Gaming para ver luego', '2025-05-11 11:30:00', 'private', 3),
('Aprender programación', '2025-06-05 09:00:00', 'public', 4);

INSERT INTO Playlists_Videos
(video_id, playlist_id)
VALUES
(1, 1),
(3, 1),
(3, 2),
(1, 3),
(2, 3),
(5, 3);

INSERT INTO Comments
(comment_text, publication_date, user_id, video_id)
VALUES
('Muy buen video, ahora entiendo mejor SQL.', '2025-04-10 19:00:00', 2, 1),
('Podrías hacer una segunda parte con subconsultas.', '2025-04-10 19:20:00', 3, 1),
('Me sirvió mucho para el diagrama.', '2025-04-12 20:00:00', 4, 2),
('Gran partida, estuvo divertida.', '2025-05-01 22:00:00', 1, 3),
('No sabía que existía el estado oculto.', '2025-06-01 17:10:00', 2, 5);

INSERT INTO Video_Reactions
(user_id, video_id, reaction_type, reaction_date)
VALUES
(2, 1, 'like', '2025-04-10 19:01:00'),
(3, 1, 'like', '2025-04-10 19:25:00'),
(4, 2, 'like', '2025-04-12 20:10:00'),
(1, 3, 'dislike', '2025-05-01 22:05:00'),
(3, 3, 'like', '2025-05-01 22:15:00'),
(4, 3, 'like', '2025-05-01 22:20:00'),
(1, 5, 'like', '2025-06-01 17:30:00');

INSERT INTO Comments_Reactions
(user_id, comment_id, reaction_type, reaction_date)
VALUES
(1, 1, 'like', '2025-04-10 19:10:00'),
(3, 1, 'like', '2025-04-10 19:30:00'),
(2, 2, 'like', '2025-04-10 19:35:00'),
(1, 3, 'like', '2025-04-12 20:15:00'),
(2, 4, 'dislike', '2025-05-01 22:10:00');

SELECT
Users.user_id,
Users.user_name,
Videos.video_id,
Videos.video_title,
Videos.publication_date
FROM Users
JOIN Videos ON Videos.user_id = Users.user_id
WHERE Users.user_id = 1;

SELECT 
Videos.video_id,
Tags.tag_id,
Tags.tag_name
FROM Videos
JOIN Video_Tags ON Video_Tags.video_id = Videos.video_id
JOIN Tags ON Video_Tags.tag_id = Tags.tag_id
WHERE Videos.video_id = 5;

SELECT 
Videos.video_id,
Videos.video_title,
Tags.tag_name
FROM Videos
JOIN Video_Tags ON Video_Tags.video_id = Videos.video_id
JOIN Tags ON Video_Tags.tag_id = Tags.tag_id
WHERE Tags.tag_name = 'tutorial';

SELECT
Users.user_id,
Users.user_name,
Channels.channel_id,
Channels.channel_name,
Subscriptions.subscription_id
FROM Channels
JOIN Subscriptions ON Subscriptions.channel_id = Channels.channel_id
JOIN Users ON Subscriptions.user_id = Users.user_id
WHERE Channels.channel_id = 1;

SELECT 
Videos.video_id,
Videos.video_title,
Video_Reactions.reaction_type,
COUNT(Video_Reactions.video_reaction_id) AS total_reactions
FROM Videos
JOIN Video_Reactions ON Video_Reactions.video_id = Videos.video_id
WHERE Videos.video_id = 3
GROUP BY 
Videos.video_id,
Videos.video_title,
Video_Reactions.reaction_type;

SELECT 
Videos.video_id,
Videos.video_title,
Playlists.playlist_id,
Playlists.playlist_name
FROM Playlists
JOIN Playlists_Videos ON Playlists_Videos.playlist_id = Playlists.playlist_id
JOIN Videos ON Videos.video_id = Playlists_Videos.video_id
WHERE Playlists.playlist_id = 3;

SELECT
Comments.comment_id,
Comments.comment_text,
Comments.publication_date,
Videos.video_id,
Videos.video_title
FROM Comments 
JOIN Videos ON Comments.video_id = Videos.video_id 
WHERE Videos.video_id = 1;

SELECT 
Comments.comment_id,
Comments.comment_text,
Comments.publication_date,
Comments_Reactions.reaction_type,
Comments_Reactions.reaction_date
FROM Comments
JOIN Comments_Reactions ON Comments_Reactions.comment_id = Comments.comment_id
WHERE Comments.comment_id = 1;
