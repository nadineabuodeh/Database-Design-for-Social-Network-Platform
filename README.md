# Social Network Platform Database - README

## Overview

This repository contains the database design for a social network platform. The design is implemented using SQL with phpMyAdmin and MariaDB. The database covers essential entities like users, posts, stories, likes, comments, and more, tailored to foster social interactions and content sharing.

### Components

- **SQL Dump**: A complete SQL dump of the database structure and initial data.
- **ER Diagram**: A visual representation of the database schema, detailing relationships between tables.
- **Schema**: Detailed database schema in phpMyAdmin format.
- **SQL File**: The SQL file for setting up the database.

## Getting Started

### Prerequisites

- phpMyAdmin 5.1.1 or higher
- MariaDB 10.4.21 or similar compatible database server
- PHP 8.0.10 or higher

### Installation

1. **Clone the Repository**: 
   ```bash
   git clone [https://github.com/nadineabuodeh/Database-Design-for-Social-Network-Platform.git]
   ```

2. **Import SQL Dump**: 
   - Open phpMyAdmin.
   - Select your database, and go to the 'Import' tab.
   - Choose the provided SQL file and start the import process.

3. **Review ER Diagram and Schema**:
   - The ER Diagram can be viewed to understand the database structure.
   - The schema in phpMyAdmin format provides a comprehensive look at the database design.

## Database Structure

The database consists of several tables:

- `User`: Stores user information.
- `Post`: Details of individual posts.
- `Story`: For user stories.
- `Comments`, `Likes`, `Bookmarks`: Interaction tables.
- `Photos`, `Videos`: Media-related tables.
- `User_Follows`, `Page_Like`, `Hashtag`: Relationship and interaction tables.
- `Calls`, `Messages`, `GroupMessages`: Communication-related tables.
- `Notifications`: For user notifications.

Each table comes with appropriate relationships and constraints to ensure data integrity.

## Usage

- The database is designed to be used as the backend for a social network platform.
- It supports basic functionalities like user registration, posting, commenting, liking, and more.
- Advanced features include story sharing, messaging, group interactions, and notifications.

## Authors

- Nadine Abuodeh

