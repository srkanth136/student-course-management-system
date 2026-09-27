# Student Course Management System

A MySQL-based Student Course Management System designed to manage students, departments, instructors, courses, and enrollments.

## Project Overview

This project demonstrates how SQL can be used to design and manage a relational database for an educational institution.

The system stores student information, department details, instructor information, course details, and student enrollments.

## Technologies Used

- MySQL
- SQL
- MySQL Workbench

## Database Tables

The project contains the following tables:

1. departments
2. students
3. instructors
4. courses
5. enrollments
6. enrollment_audit

## SQL Concepts Used

- database and table creation
- primary keys
- foreign keys
- constraints
- insert
- select
- update
- delete
- where
- order by
- group by
- having
- aggregate functions
- joins
- subqueries
- views
- stored procedures
- input, output and input-output parameters
- triggers
- union
- union all
- window functions
- reports

## Main Features

- Manage student information
- Manage departments
- Manage instructors
- Manage courses
- Manage student enrollments
- Generate enrollment reports
- Find popular courses
- Analyze students by department
- Analyze instructors and courses
- Use stored procedures for reusable operations
- Use triggers for enrollment auditing

## Database Relationships

- A department can have multiple students.
- A department can have multiple instructors.
- A department can offer multiple courses.
- An instructor can teach multiple courses.
- A student can enroll in multiple courses.
- A course can have multiple students.

The `enrollments` table connects students and courses.

## Views

The project includes views for:

- student and course information
- course and instructor information
- student course counts
- course enrollment counts
- student department information

## Stored Procedures

The project includes stored procedures for:

- finding students by course
- finding courses by department
- counting students in a department
- displaying course details
- finding students enrolled after a specific year
- returning student counts using an output parameter
- modifying a value using an input-output parameter

## Trigger

An enrollment audit trigger records newly inserted enrollment information in the `enrollment_audit` table.

## Reports

The project generates reports such as:

- top 5 popular courses
- department with the most students
- instructor with the most courses
- enrollment count by semester
- highest-credit courses
- second-most enrolled course

## How to Run

1. Install MySQL or MySQL Workbench.
2. Open `student-course-management.sql`.
3. Execute the database and table creation statements.
4. Insert the sample data.
5. Run the SQL queries, views, procedures and reports.

## Project Structure

```text
student-course-management-system/
│
├── student-course-management.sql
├── README.md
└── LICENSE
