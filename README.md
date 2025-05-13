# USSD Student Management System (PHP Version)

A USSD-based system for managing student information, attendance, and academic records.

## Features

- Student Registration
- Attendance Tracking
- Exam Results Checking
- Course Enrollment
- Fee Payment Tracking
- Parent Access Portal

## Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Apache/Nginx web server
- Composer (for dependency management)

## Setup

1. Install dependencies:
```bash
composer install
```

2. Configure database:
- Create a MySQL database
- Import the database schema from `database/schema.sql`
- Update `config/database.php` with your database credentials

3. Configure USSD gateway:
- Update `config/ussd.php` with your USSD gateway settings
- Set up your USSD shortcode (e.g., *123#)

4. Set up web server:
- Point your web server to the `public` directory
- Ensure the `storage` directory is writable

## USSD Menu Structure

*123*1# - Student Registration
*123*2# - Attendance
*123*3# - Exam Results
*123*4# - Course Enrollment
*123*5# - Fee Payment
*123*6# - Parent Portal

## Security

- All USSD sessions are encrypted
- PIN-based authentication for sensitive operations
- Rate limiting to prevent abuse
- Input validation and sanitization
- Prepared statements for database queries 