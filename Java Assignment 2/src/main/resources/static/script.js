// Global variable
let currentEmployeeId = null;

// Load employees when page loads
document.addEventListener('DOMContentLoaded', function() {
    if (window.location.pathname.includes('employees.html')) {
        loadEmployees();
    }
    
    // Check if we're on the employee form page and if there's an ID in the URL
    if (window.location.pathname.includes('employee_form.html')) {
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get('id');
        
        if (id) {
            currentEmployeeId = id;
            document.getElementById('formTitle').textContent = 'Edit Employee';
            loadEmployeeData(id);
        }
    }
    
    // Set up form submission
    const employeeForm = document.getElementById('employeeForm');
    if (employeeForm) {
        employeeForm.addEventListener('submit', function(e) {
            e.preventDefault();
            saveEmployee();
        });
    }
});

// Load all employees
function loadEmployees() {
    fetch('http://localhost:8082/api/employees')
        .then(response => response.json())
        .then(employees => {
            const tableBody = document.getElementById('employeeTable');
            tableBody.innerHTML = '';
            
            employees.forEach(employee => {
                const row = document.createElement('tr');
                
                row.innerHTML = `
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.department}</td>
                    <td>${employee.email}</td>
                    <td>${employee.salary}</td>
                    <td>
                        <button onclick="editEmployee(${employee.id})">Edit</button>
                        <button onclick="deleteEmployee(${employee.id})">Delete</button>
                    </td>
                `;
                
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to load employees');
        });
}

// Load employee data for editing
function loadEmployeeData(id) {
    fetch(`http://localhost:8082/api/employees/${id}`)
        .then(response => response.json())
        .then(employee => {
            document.getElementById('empId').value = employee.id;
            document.getElementById('name').value = employee.name;
            document.getElementById('department').value = employee.department;
            document.getElementById('email').value = employee.email;
            document.getElementById('salary').value = employee.salary;
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to load employee data');
        });
}

// Save employee (create or update)
function saveEmployee() {
    const employee = {
        name: document.getElementById('name').value,
        department: document.getElementById('department').value,
        email: document.getElementById('email').value,
        salary: parseFloat(document.getElementById('salary').value)
    };
    
    const url = currentEmployeeId 
        ? `http://localhost:8082/api/employees/${currentEmployeeId}`
        : 'http://localhost:8082/api/employees';
    
    const method = currentEmployeeId ? 'PUT' : 'POST';
    
    fetch(url, {
        method: method,
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(employee)
    })
    .then(response => response.json())
    .then(() => {
        window.location.href = 'employees.html';
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to save employee');
    });
}

// Edit employee - redirect to form with ID
function editEmployee(id) {
    window.location.href = `employee_form.html?id=${id}`;
}

// Delete employee
function deleteEmployee(id) {
    if (confirm('Are you sure you want to delete this employee?')) {
        fetch(`http://localhost:8082/api/employees/${id}`, {
            method: 'DELETE'
        })
        .then(() => {
            loadEmployees(); // Refresh the list
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to delete employee');
        });
    }
}

// Logout function
function logout() {
    window.location.href = 'login.html';
}