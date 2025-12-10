# 📺 Netflix SQL Project

A complete SQL project built to analyze a Netflix-style dataset using a single, well-structured SQL script.
This project demonstrates database schema creation, sample data insertion, and analytical SQL queries — all in one place.

## 🚀 Project Overview

This project showcases:

Database schema design for a streaming platform (movies, shows, ratings, user activity, categories, etc.)

Sample/seed data insertion to make the tables usable for testing and practice.

Analytical SQL queries for exploring trends, top content, viewer behavior, ratings, and more.

A single SQL file (Netflix_final_sql.sql) that can fully recreate and analyze the dataset.

It is perfect for learning SQL, showcasing SQL skills for interviews, or using as a GitHub portfolio project.

## 📁 Repository Structure
Netflix-SQL-Project/
├── Netflix_final_sql.sql     # Main SQL script: schema + data + analysis queries
└── README.md                 # Project documentation


🧰 How to Run This Project

You can run this SQL script on any SQL database (SQLite, PostgreSQL, MySQL, etc.) with minor or no modifications.

✔️ Option 1 — Run with SQLite (easiest)
sqlite3 netflix.db < Netflix_final_sql.sql

✔️ Option 2 — Run in PostgreSQL
psql -U your_username -d your_database -f Netflix_final_sql.sql

✔️ Option 3 — Run in MySQL / MariaDB
mysql -u root -p your_database < Netflix_final_sql.sql


After loading, you can run the analysis queries included at the bottom of the script.

## 📝 What’s Inside the SQL File

The Netflix_final_sql.sql script includes:

- Schema Creation

  * Tables for movies, shows, categories, users, ratings, metadata, etc.

  * Primary keys, foreign keys, data types, constraints.

- Sample Data

  * Fictional data to simulate Netflix usage.

  * Enough rows to make analysis meaningful.

- Analytical Queries

  * Some examples include:

  * Top-rated movies and shows

  * Most active users

  * Category-wise content distribution

  * Ratings trends

  * Viewing history patterns

- These queries demonstrate SQL skills like:

  * JOINs

  * GROUP BY / HAVING

  * Window functions

  * Aggregations

  * Filtering

  * Sorting

## 🎯 Project Purpose

This project was created to:

- Practice and demonstrate SQL proficiency

- Model real-world streaming platform datasets

- Build a portfolio-ready project

- Provide reusable analysis queries for interviews and assessments

## 🔧 Tools Used

- SQL (postgre)

- Compatible with: PostgreSQL, MySQL, MariaDB, SQLite, Snowflake, etc.

- GitHub for version control & documentation.

## 📊 Potential Enhancements (Future Scope)

You can extend this project by adding:

- An ER Diagram (docs/ERD.png)

- A data dictionary explaining each table

- Separate SQL files:

   * /schema

  * /seed

  * /analysis

  * Visualization dashboards (Power BI, Tableau, Python, etc.)

  * Dockerized PostgreSQL environment

  * Stored procedures, functions, triggers


👤 Author

Prabin Gaire
Graduate Student — MS in Business Analytics
Aspiring Business/Data Analyst
Loves SQL, Databases, and Data Projects 🚀
