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
