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

## Snippets
![image](https://github.com/user-attachments/assets/d00ea827-737a-41c9-9482-d3658426459a)  
![image](https://github.com/user-attachments/assets/1d89a2ee-9e76-4d84-8574-1fcce0c98824)  
![image](https://github.com/user-attachments/assets/915fb152-ffc8-4408-930b-bb2a30c226e3)  
![image](https://github.com/user-attachments/assets/55b61e7f-a8a0-4aab-a927-87315641c2f8)  



