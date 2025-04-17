document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:8082/api/hr/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
    })
    .then(response => response.json())
    .then(data => {
        if (data) {
            window.location.href = 'employees.html';
        } else {
            alert('Invalid email or password');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Login failed');
    });
});
