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