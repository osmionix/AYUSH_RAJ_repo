# HR Portal Application

## Overview
This is a simple HR Portal application built with Spring Boot for the backend and HTML/CSS/JavaScript for the frontend. The portal allows HR personnel to manage employee records after logging in.  
- **Backend**: Spring Boot (REST API, Spring Data JPA)
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL

## Features
- ✅ HR Login Authentication
- 📋 View Employee List
- ➕ Add New Employees
- ✏️ Edit Employee Details
- ❌ Delete Employees

## Application Structure
src/  
├── main/  
│  ├── java/  
│  │    └── com/ayush/hr_portal/  
│  │    ├── config/  
│  │    ├── controller/  
│  │    ├── model/  
│  │    ├── repository/  
│  │    ├── service/  
│  │    └── HrPortalApplication.java  
│  └── resources/  
│    ├── static/           # Frontend files (HTML, CSS, JS)  
│    └──  application.properties  

## API Endpoints
**HR Authentication**  
- POST /api/hr/login - Authenticate HR user  

**Employee Management**  
- GET /api/employees - Get all employees  
- GET /api/employees/{id} - Get employee by ID  
- POST /api/employees - Create new employee
- PUT /api/employees/{id} - Update employee
- DELETE /api/employees/{id} - Delete employee

