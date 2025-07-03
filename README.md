# 📚 Library Management System

A PHP, Bootstrap and MySQL-based web application for managing a library's resources and user interactions, designed for both administrators and users.

## 🔑 Features

### 🧑‍💼 Admin Panel
- **Login**: Admin logs in using their credentials stored in the database.
- **Dashboard**: Displays total counts for:
  - Books
  - Issued Books
  - Returned Books
  - Book Authors
  - Book Categories
- **Navigation Menu**: Admin can access and manage:
  - `author.php`: Add/Edit/Delete authors
  - `category.php`: Add/Edit/Delete categories
  - `book.php`: Add/Edit/Delete books
  - `issuebook.php`: Issue/Return books and track their status
- **Search Functionality**: Admin can search records in all pages.
- **Settings Page**: Admin can configure:
  - Library address and phone number
  - Maximum books issued per user
  - Book issue duration (return deadline)
- **Logout**: Secure logout to admin login page.

---

### 👤 User Panel
- **Sign Up / Login**: Users can register and log in using their credentials.
- **Home Page**: Lists all available books in the library with a search function.
- **Issued Books Page**: Displays the user's currently issued books and their status:
  - `Returned`
  - `Issued`
  - `Overdue`
- **Settings**: Users can update their:
  - Email
  - Password
  - Phone
  - Address
- **Logout**: Secure logout to user login page.

---

## 🛠 Tech Stack
- **Frontend**: Bootsrap, HTML, CSS
- **Backend**: PHP (Procedural)
- **Database**: MySQL (via PDO)
- **Environment**: XAMPP (Apache + MySQL)

---

## 🚀 How to Run Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/Israa-Alzein/library-management-system.git

2. Place the project folder inside your htdocs directory in XAMPP.

3. Import the DATABASE_SCRIPT.sql into your local MySQL database under name: library_management_system

4. Update database_connection.php with your local DB credentials.

5. Start Apache and MySQL in XAMPP.

6. Visit the site in your browser:
   http://localhost/library_management_system/index.php

---

## 💡 Pay Attention:

1. Make sure to place only the sub folder library_management_system directly in the htdocs: 
htdocs/
└── library_management_system/
    ├── index.php
    ├── user_login.php
    ├── admin/
    ├── asset/
    └── database_connection.php

2. if You changed the path of the library_management_system folder in the htdocs, open the page function.php => inside function base_url(), change http://localhost/library_management_system/index.php to the location you used. Also write the suitable url in chrome that aligns with where you put your project inside htdocs to display the website.

3. Make sure to name your SQL database library_management_system orelse open page   database_connection.php => inside $connect string change dbname value to your database name.

4. if your MySql is working on different Port, open database_connection.php => inside $connect string add: port = Your_Port_Number

5. Make sure that you activated the ports Apache and MySQL in Xampp.