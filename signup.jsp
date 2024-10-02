<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Citizen-Politician Interaction Platform</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="LoginWindow">
        <h2>Create Account</h2>
        <form action="signup" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required placeholder="Choose a username">

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required placeholder="Choose a password">

            <label for="role">Role</label>
            <select name="role" id="role">
                <option value="citizen">Citizen</option>
                <option value="politician">Politician</option>
            </select>

            <input type="submit" value="Sign Up">
        </form>
        <p style="text-align: center;">
            Already have an account? <a href="login.jsp">Login</a>
        </p>
    </div>
</body>
</html>