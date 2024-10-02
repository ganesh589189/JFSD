<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Citizen-Politician Interaction Platform</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script>
        function redirectToDashboard(event) {
            event.preventDefault();
            var role = document.getElementById("role").value;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if ((username === "citizen" && password === "password") && role === "citizen") {
                window.location.href = "citizen.jsp";
            } else if ((username === "politician" && password === "password") && role === "politician") {
                window.location.href = "politician.jsp";
            } else {
                alert("Invalid credentials. Please try again.");
            }
        }
    </script>
</head>
<body>
    <div class="LoginWindow">
        <h2>Welcome Back</h2>
        <form onsubmit="redirectToDashboard(event)">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required placeholder="Enter your username">

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password">

            <label for="role">Role</label>
            <select name="role" id="role" required>
                <option value="citizen">Citizen</option>
                <option value="politician">Politician</option>
            </select>

            <input type="submit" value="Login">
        </form>
        <p style="text-align: center;">
            Don't have an account? <a href="signup.jsp">Sign Up</a>
        </p>
    </div>
</body>
</html>