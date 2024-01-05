-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 07:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE Login (
    login_id INT,
    IP VARCHAR(255),
    login_time TIMESTAMP
);

INSERT INTO `Login` (`login_id`, `IP`, `login_time`) VALUES
(1, '192.168.1.1', CURRENT_TIMESTAMP),
(2, '192.168.1.2', CURRENT_TIMESTAMP);

CREATE TABLE User (
    user_id INT,
    username VARCHAR(255),
    profile_photo_url VARCHAR(255),
    bio TEXT,
    email VARCHAR(255),
    isActive BOOLEAN,
    Login_id INT
);

INSERT INTO `User` (`user_id`, `username`, `profile_photo_url`, `bio`, `email`, `isActive`, `Login_id`) VALUES
(1, 'JohnDoe', 'http://example.com/photo1.jpg', 'Bio of John Doe', 'johndoe@example.com', TRUE, 1),
(2, 'JaneDoe', 'http://example.com/photo2.jpg', 'Bio of Jane Doe', 'janedoe@example.com', TRUE, 2);


CREATE TABLE Page (
    page_id INT,
    page_name VARCHAR(255),
    page_content TEXT,
    user_id INT
);

INSERT INTO `Page` (`page_id`, `page_name`, `page_content`, `user_id`) VALUES
(1, 'Page 1', 'Content of Page 1', 1);

CREATE TABLE Post (
    post_id INT,
    created_at TIMESTAMP,
    location VARCHAR(255),
    caption TEXT,
    user_id INT NULL,
    page_id INT NULL
);

INSERT INTO `Post` (`post_id`, `created_at`, `location`, `caption`, `user_id`, `page_id`) VALUES
(1, CURRENT_TIMESTAMP, 'New York', 'My first post!', 1, NULL);


CREATE TABLE Photos (
    photo_id INT,
    photo_url VARCHAR(255),
    size INT,
    post_id INT NULL,
    story_id INT NULL,
    message_id INT NULL
);

INSERT INTO `Photos` (`photo_id`, `photo_url`, `size`, `post_id`, `story_id`, `message_id`) VALUES
(1, 'http://example.com/photo1.jpg', 1024, 1, NULL, NULL);


CREATE TABLE Videos (
    video_id INT,
    video_url VARCHAR(255),
    size INT,
    post_id INT NULL,
    story_id INT NULL,
    message_id INT NULL
);

INSERT INTO `Videos` (`video_id`, `video_url`, `size`, `post_id`, `story_id`, `message_id`) VALUES
(1, 'http://example.com/video1.mp4', 5000, 1, NULL, NULL);

CREATE TABLE Story (
    story_id INT,
    created_at TIMESTAMP,
    location VARCHAR(255),
    caption TEXT NULL,
    user_id INT NULL,
    page_id INT NULL
);

INSERT INTO `Story` (`story_id`, `created_at`, `location`, `caption`, `user_id`, `page_id`) VALUES
(1, CURRENT_TIMESTAMP, 'Paris', 'My trip to the Eiffel Tower!', 1, NULL);


CREATE TABLE User_Follows (
    follower_id INT,
    followed_id INT,
    created_at TIMESTAMP
);

INSERT INTO `User_Follows` (`follower_id`, `followed_id`, `created_at`) VALUES
(1, 2, CURRENT_TIMESTAMP),
(2, 1, CURRENT_TIMESTAMP);

CREATE TABLE Page_Like (
    page_id INT,
    user_id INT,
    created_at TIMESTAMP
);

INSERT INTO `Page_Like` (`page_id`, `user_id`, `created_at`) VALUES
(1, 1, CURRENT_TIMESTAMP),
(1, 2, CURRENT_TIMESTAMP);


CREATE TABLE Admin (
    user_id INT,
    page_id INT
);

INSERT INTO `Admin` (`user_id`, `page_id`) VALUES (1, 1);


CREATE TABLE Post_Like (
    post_id INT,
    user_id INT,
    created_at TIMESTAMP
);

INSERT INTO `Post_Like` (`post_id`, `user_id`, `created_at`) VALUES (1, 1, CURRENT_TIMESTAMP);

CREATE TABLE Bookmarks (
    user_id INT,
    post_id INT,
    saved_at TIMESTAMP
);

INSERT INTO `Bookmarks` (`user_id`, `post_id`, `saved_at`) VALUES (1, 1, CURRENT_TIMESTAMP);

CREATE TABLE Comment (
    comment_id INT,
    comment_text TEXT,
    user_id INT,
    created_at TIMESTAMP,
    post_id INT
  );

INSERT INTO `Comment` (`comment_id`, `comment_text`, `user_id`, `created_at`, `post_id`) VALUES (1, 'This is a great post!', 1, CURRENT_TIMESTAMP, 1);

CREATE TABLE Reply (
    reply_id INT,
    comment_id INT
);

INSERT INTO `Reply` (`reply_id`, `comment_id`) VALUES (1, 1);

CREATE TABLE Comment_like (
    comment_id INT,
    user_id INT,
    created_at TIMESTAMP
);

INSERT INTO `Comment_like` (`comment_id`, `user_id`, `created_at`) VALUES (1, 1, CURRENT_TIMESTAMP);

CREATE TABLE Hashtag (
    hashtag_id INT,
    hashtag_name VARCHAR(255)
);

INSERT INTO `Hashtag` (`hashtag_id`, `hashtag_name`) VALUES (1, 'Tech');

CREATE TABLE Hashtag_follow (
    hashtag_id INT,
    user_id INT
);

INSERT INTO `Hashtag_follow` (`hashtag_id`, `user_id`) VALUES (1, 1);

CREATE TABLE Hashtag_post (
    hashtag_id INT,
    post_id INT
);

INSERT INTO `Hashtag_post` (`hashtag_id`, `post_id`) VALUES (1, 1);

CREATE TABLE Story_likes (
    user_id INT,
    story_id INT,
    created_at TIMESTAMP
);

INSERT INTO `Story_likes` (`user_id`, `story_id`, `created_at`) VALUES (1, 1, CURRENT_TIMESTAMP);

CREATE TABLE Reply_to_story (
    reply_id INT,
    story_id INT,
    user_id INT,
    message_id INT
);

INSERT INTO `Reply_to_story` (`reply_id`, `story_id`, `user_id`, `message_id`) VALUES (1, 1, 1, 1);

CREATE TABLE Viewer (
    user_id INT,
    story_id INT
);

INSERT INTO `Viewer` (`user_id`, `story_id`) VALUES (1, 1);

CREATE TABLE Calls (
    call_id INT,
    call_type VARCHAR(255),
    timestamp TIMESTAMP,
    caller_user_id INT,
    receiver_user_id INT
);

INSERT INTO `Calls` (`call_id`, `call_type`, `timestamp`, `caller_user_id`, `receiver_user_id`) VALUES (1, 'Voice Call', CURRENT_TIMESTAMP, 2, 1);

CREATE TABLE Message (
    message_id INT,
    message_content TEXT,
    timestamp TIMESTAMP,
    isRead BOOLEAN,
    receiver_id INT NULL,
    sender_id INT NULL,
    group_id INT NULL
);

INSERT INTO `Message` (`message_id`, `message_content`, `timestamp`, `isRead`, `receiver_id`, `sender_id`, `group_id`) VALUES (1, 'Hello there!', CURRENT_TIMESTAMP, 0, 1, 2, NULL);

CREATE TABLE GroupMessages (
    group_id INT,
    group_name VARCHAR(255),
    user_id INT
);

INSERT INTO `GroupMessages` (`group_id`, `group_name`, `user_id`) VALUES (1, 'Tech Enthusiasts', 1);

CREATE TABLE Group_member (
    user_id INT,
    group_id INT
);

INSERT INTO `Group_member` (`user_id`, `group_id`) VALUES (1, 1);

CREATE TABLE Notification (
    notification_id INT,
    notification_Type VARCHAR(255),
    user_id INT
);

INSERT INTO `Notification` (`notification_id`, `notification_Type`, `user_id`) VALUES (1, 'New Message', 1);

ALTER TABLE Login
ADD PRIMARY KEY (login_id);

ALTER TABLE User
ADD PRIMARY KEY (user_id);

ALTER TABLE Page
ADD PRIMARY KEY (page_id);

ALTER TABLE Post
ADD PRIMARY KEY (post_id);

ALTER TABLE Photos
ADD PRIMARY KEY (photo_id);

ALTER TABLE Videos
ADD PRIMARY KEY (video_id);

ALTER TABLE Story
ADD PRIMARY KEY (story_id);

ALTER TABLE User_Follows
ADD PRIMARY KEY (follower_id, followed_id);

ALTER TABLE Page_Like
ADD PRIMARY KEY (page_id, user_id);

ALTER TABLE Admin
ADD PRIMARY KEY (user_id, page_id);

ALTER TABLE Bookmarks
ADD PRIMARY KEY (user_id, post_id);

ALTER TABLE Comment
ADD PRIMARY KEY (comment_id);

ALTER TABLE Reply
ADD PRIMARY KEY (comment_id, reply_id);

ALTER TABLE Comment_like
ADD PRIMARY KEY (comment_id, user_id);

ALTER TABLE Story_likes
ADD PRIMARY KEY (user_id, story_id);

ALTER TABLE Reply_to_story
ADD PRIMARY KEY (reply_id);

ALTER TABLE Viewer
ADD PRIMARY KEY (user_id, story_id);

ALTER TABLE Calls
ADD PRIMARY KEY (call_id);

ALTER TABLE Message
ADD PRIMARY KEY (message_id);

ALTER TABLE GroupMessages
ADD PRIMARY KEY (group_id);

ALTER TABLE Group_member
ADD PRIMARY KEY (user_id, group_id);

ALTER TABLE Notification
ADD PRIMARY KEY (notification_id);

ALTER TABLE Post_Like
ADD PRIMARY KEY (post_id,user_id);

ALTER TABLE Hashtag
ADD PRIMARY KEY (hashtag_id);

ALTER TABLE Hashtag_follow
ADD PRIMARY KEY (hashtag_id,user_id);

ALTER TABLE Hashtag_post
ADD PRIMARY KEY (hashtag_id,post_id);



ALTER TABLE User
ADD FOREIGN KEY (login_id) REFERENCES Login(login_id);

ALTER TABLE Page
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Post
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (page_id) REFERENCES Page(page_id);

ALTER TABLE Photos
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id),
ADD FOREIGN KEY (story_id) REFERENCES Story(story_id),
ADD FOREIGN KEY (message_id) REFERENCES Message(message_id);

ALTER TABLE Videos
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id),
ADD FOREIGN KEY (story_id) REFERENCES Story(story_id),
ADD FOREIGN KEY (message_id) REFERENCES Message(message_id);

ALTER TABLE Story
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (page_id) REFERENCES Page(page_id);

ALTER TABLE User_Follows
ADD FOREIGN KEY (follower_id) REFERENCES User(user_id),
ADD FOREIGN KEY (followed_id) REFERENCES User(user_id);

ALTER TABLE Page_Like
ADD FOREIGN KEY (page_id) REFERENCES Page(page_id),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Admin
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (page_id) REFERENCES Page(page_id);

ALTER TABLE Bookmarks
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id);

ALTER TABLE Comment
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id);

ALTER TABLE Reply
ADD FOREIGN KEY (comment_id) REFERENCES Comment(comment_id),
ADD FOREIGN KEY (reply_id) REFERENCES Comment(comment_id);

ALTER TABLE Comment_like
ADD FOREIGN KEY (comment_id) REFERENCES Comment(comment_id),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Story_likes
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (story_id) REFERENCES Story(story_id);

ALTER TABLE Reply_to_story
ADD FOREIGN KEY (story_id) REFERENCES Story(story_id),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (message_id) REFERENCES Message(message_id);

ALTER TABLE Viewer
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (story_id) REFERENCES Story(story_id);

ALTER TABLE Calls
ADD FOREIGN KEY (caller_user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (receiver_user_id) REFERENCES User(user_id);

ALTER TABLE Message
ADD FOREIGN KEY (receiver_id) REFERENCES User(user_id),
ADD FOREIGN KEY (sender_id) REFERENCES User(user_id),
ADD FOREIGN KEY (group_id) REFERENCES GroupMessages(group_id);

ALTER TABLE GroupMessages
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Group_member
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (group_id) REFERENCES GroupMessages(group_id);

ALTER TABLE Notification
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Hashtag_post
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id),
ADD FOREIGN KEY (hashtag_id) REFERENCES Hashtag(hashtag_id);

ALTER TABLE Hashtag_follow
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (hashtag_id) REFERENCES Hashtag(hashtag_id);

ALTER TABLE Post_Like
ADD FOREIGN KEY (post_id) REFERENCES Post(post_id),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Page
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
