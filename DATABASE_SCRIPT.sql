/*Database Table*/

CREATE TABLE `lms_admin` (
 `admin_id` int(11) NOT NULL AUTO_INCREMENT,
 `admin_email` varchar(200) NOT NULL,
 `admin_password` varchar(200) NOT NULL,
 PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lms_author` (
 `author_id` int(11) NOT NULL AUTO_INCREMENT,
 `author_name` varchar(200) NOT NULL,
 `author_status` enum('Enable','Disable') NOT NULL,
 `author_created_on` datetime NOT NULL,
 `author_updated_on` datetime NOT NULL,
 PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `lms_book` (
 `book_id` int(11) NOT NULL AUTO_INCREMENT,
 `book_pic` varchar(100) NOT NULL,
 `book_category` varchar(200) NOT NULL,
 `book_author` varchar(200) NOT NULL,
 `book_name` text NOT NULL,
 `book_isbn_number` varchar(30) NOT NULL,
 `book_no_of_copy` int(5) NOT NULL,
 `book_status` enum('Enable','Disable') NOT NULL,
 `book_added_on` datetime NOT NULL,
 `book_updated_on` datetime NOT NULL,
 PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `lms_category` (
 `category_id` int(11) NOT NULL AUTO_INCREMENT,
 `category_name` varchar(200) NOT NULL,
 `category_status` enum('Enable','Disable') NOT NULL,
 `category_created_on` datetime NOT NULL,
 `category_updated_on` datetime NOT NULL,
 PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `lms_issue_book` (
 `issue_book_id` int(11) NOT NULL AUTO_INCREMENT,
 `book_id` varchar(30) NOT NULL,
 `user_id` varchar(30) NOT NULL,
 `issue_date_time` datetime NOT NULL,
 `expected_return_date` datetime NOT NULL,
 `return_date_time` datetime NOT NULL,
 `book_issue_status` enum('Issue','Return','Not Return') NOT NULL,
 PRIMARY KEY (`issue_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `lms_setting` (
 `setting_id` int(11) NOT NULL AUTO_INCREMENT,
 `library_name` varchar(200) NOT NULL,
 `library_address` text NOT NULL,
 `library_contact_number` varchar(30) NOT NULL,
 `library_email_address` varchar(100) NOT NULL,
 `library_total_book_issue_day` int(5) NOT NULL,
 `library_issue_total_book_per_user` int(3) NOT NULL,
 `library_timezone` varchar(100) NOT NULL,
 PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `lms_user` (
 `user_id` int(11) NOT NULL AUTO_INCREMENT,
 `user_name` varchar(200) NOT NULL,
 `user_address` text NOT NULL,
 `user_contact_no` varchar(30) NOT NULL,
 `user_email_address` varchar(200) NOT NULL,
 `user_password` varchar(30) NOT NULL,
 `user_unique_id` varchar(30) NOT NULL,
 `user_status` enum('Enable','Disable') NOT NULL,
 `user_created_on` datetime NOT NULL,
 `user_updated_on` datetime NOT NULL,
 PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


/* Database Data*/

INSERT INTO `lms_admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'DrAliJaber@gmail.com', 'password123');



INSERT INTO `lms_author` (`author_id`, `author_name`, `author_status`, `author_created_on`, `author_updated_on`) VALUES
(1, 'Aghatha Christie', 'Enable', '2023-12-28 14:54:51', '2024-01-23 14:20:48'),
(2, 'Victoria Aveyard', 'Enable', '2023-12-28 14:57:27', '0000-00-00 00:00:00'),
(3, 'Mari Hannah', 'Enable', '2024-01-06 18:38:55', '0000-00-00 00:00:00'),
(4, 'J.R.R. Tolkien', 'Enable', '2024-01-06 19:20:22', '0000-00-00 00:00:00'),
(5, 'J.K. Rowling', 'Enable', '2024-01-06 19:32:39', '0000-00-00 00:00:00'),
(6, 'N.K. Jemisin', 'Enable', '2024-01-06 20:09:20', '0000-00-00 00:00:00'),
(7, 'Rupi Kaur', 'Enable', '2024-01-06 20:18:41', '0000-00-00 00:00:00'),
(8, 'Walt Whitman', 'Enable', '2024-01-06 20:31:03', '0000-00-00 00:00:00'),
(9, 'Edgar Allan Poe', 'Enable', '2024-01-06 20:49:09', '0000-00-00 00:00:00');



INSERT INTO `lms_book` (`book_id`, `book_pic`, `book_category`, `book_author`, `book_name`, `book_isbn_number`, `book_no_of_copy`, `book_status`, `book_added_on`, `book_updated_on`) VALUES
(21, 'redqueen.jpg', 'fantasy', 'Victoria Aveyard', 'Red Queen', '76565483', 5, 'Enable', '2024-01-07 01:38:03', '0000-00-00 00:00:00'),
(22, '16366.jpg', 'crime fiction', 'Aghatha Christie', 'Endless Night', '98943633', 6, 'Enable', '2024-01-07 01:40:13', '0000-00-00 00:00:00'),
(23, 'crookedhouse.jpg', 'crime fiction', 'Aghatha Christie', 'Crooked House', '8786763', 7, 'Enable', '2024-01-07 01:43:35', '2024-01-09 10:32:46'),
(24, 'Roger.jpg', 'crime fiction', 'Aghatha Christie', 'The Murder of Roger Ackyord', '77766888', 9, 'Enable', '2024-01-07 01:44:33', '0000-00-00 00:00:00'),
(25, 'themurderwall.webp', 'crime fiction', 'Mari Hannah', 'The Murder Wall', '1122244444', 4, 'Enable', '2024-01-07 01:45:45', '0000-00-00 00:00:00'),
(26, 'glasssword.jpg', 'fantasy', 'Victoria Aveyard', 'Glass Sword', '76564536', 3, 'Enable', '2024-01-07 01:46:55', '0000-00-00 00:00:00'),
(27, 'rings.jpg', 'fantasy', 'J.R.R. Tolkien', 'Lord of the Rings', '88653452', 11, 'Enable', '2024-01-07 01:47:50', '0000-00-00 00:00:00'),
(28, 'potter.jpg', 'fantasy', 'J.K. Rowling', 'Harry Potter', '3432556', 13, 'Enable', '2024-01-07 01:48:56', '0000-00-00 00:00:00'),
(29, 'hobbit-cover.jpg', 'fantasy', 'J.R.R. Tolkien', 'The Hobbit', '09734856', 12, 'Enable', '2024-01-07 01:50:10', '0000-00-00 00:00:00'),
(30, 'season.jpg', 'fantasy', 'N.K. Jemisin', 'The Fifth Season', '24154675', 4, 'Enable', '2024-01-07 01:51:46', '0000-00-00 00:00:00'),
(31, 'honey.jpg', 'poetry', 'Rupi Kaur', 'Milk and Honey', '7231308', 7, 'Enable', '2024-01-07 01:52:48', '2024-01-07 01:54:12'),
(32, 'grass.jpg', 'poetry', 'Walt Whitman', 'Leaves of Grass', '763268', 1, 'Enable', '2024-01-07 01:53:53', '2024-01-23 14:15:13'),
(33, 'myself.jpg', 'poetry', 'Walt Whitman', 'Song of Myself', '13506946', 2, 'Enable', '2024-01-07 02:01:36', '2024-01-23 14:14:07'),
(35, 'heart.jpg', 'poetry', 'Edgar Allan Poe', 'The Tell Tale heart', '12211232234', 6, 'Enable', '2024-01-07 02:06:27', '0000-00-00 00:00:00');



INSERT INTO `lms_issue_book` (`issue_book_id`, `book_id`, `user_id`, `issue_date_time`, `expected_return_date`, `return_date_time`, `book_issue_status`) VALUES
(1, '8786763', 'U89904597', '2024-01-09 10:32:46', '2024-01-24 10:32:46', '0000-00-00 00:00:00', 'Not Return');



INSERT INTO `lms_setting` (`setting_id`, `library_name`, `library_address`, `library_contact_number`, `library_email_address`, `library_total_book_issue_day`, `library_issue_total_book_per_user`, `library_timezone`) VALUES
(1, 'Beautiful Mind Library', 'Lebanon, Beirut, Al-Hamra, bliss-street, Central-Building', '+11/223344455', 'beautiful-mind11@gmail.com', 15, 3, 'Asia/Beirut');


INSERT INTO `lms_user` (`user_id`, `user_name`, `user_address`, `user_contact_no`, `user_email_address`, `user_password`, `user_unique_id`, `user_status`, `user_created_on`, `user_updated_on`) VALUES
(1, 'mark', 'Beirut', '7664836', 'mark2@gmail.com', 'password', 'U68366277', 'Enable', '2023-12-28 19:05:51', '0000-00-00 00:00:00'),
(2, 'lara', 'Saida', '7846383', 'lara1@gmail.com', 'password', 'U89904597', 'Enable', '2023-12-28 19:41:32', '0000-00-00 00:00:00');
