<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politician Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            background-color: #1a5f7a;
            color: #fff;
            padding: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease;
        }
        header:hover {
            background-color: #144d62;
        }
        h1, h2, h3 {
            margin-bottom: 20px;
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout-btn {
            background-color: #fff;
            color: #1a5f7a;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .logout-btn:hover {
            background-color: #144d62;
            color: #fff;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .dashboard-card {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        .stats {
            display: flex;
            justify-content: space-around;
            text-align: center;
        }
        .stat-item {
            flex: 1;
        }
        .stat-value {
            font-size: 2.5em;
            font-weight: bold;
            color: #1a5f7a;
        }
        .update-form textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: vertical;
            transition: border-color 0.3s ease;
        }
        .update-form textarea:focus {
            border-color: #1a5f7a;
        }
        .btn {
            background-color: #1a5f7a;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn:hover {
            background-color: #144d62;
            transform: translateY(-3px);
        }
        .issue-list {
            max-height: 400px;
            overflow-y: auto;
        }
        .issue-item {
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
            display: flex;
            align-items: flex-start;
            gap: 15px;
            transition: background-color 0.3s ease;
        }
        .issue-item:hover {
            background-color: #e9ecef;
        }
        .issue-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .issue-content {
            flex-grow: 1;
        }
        .issue-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .issue-description {
            margin-bottom: 10px;
        }
        .issue-actions {
            display: flex;
            justify-content: flex-end;
        }
        .issue-actions button {
            margin-left: 10px;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .react-btn {
            background-color: #4caf50;
            color: white;
        }
        .ignore-btn {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <h1>Politician Dashboard</h1>
                <a href="login.jsp" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="dashboard-grid">
            <section class="dashboard-card">
                <h2>Your Status</h2>
                <div class="stats">
                    <div class="stat-item">
                        <div class="stat-value">4.8</div>
                        <div>Rating</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">35</div>
                        <div>Reports</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">85%</div>
                        <div>Response Rate</div>
                    </div>
                </div>
            </section>

            <section class="dashboard-card">
                <h2>Post an Update</h2>
                <form action="postUpdate" method="post" class="update-form">
                    <textarea id="update" name="update" placeholder="Share an update with your constituents..." required></textarea>
                    <button type="submit" class="btn">Post Update</button>
                </form>
            </section>

            <section class="dashboard-card">
                <h2>Citizen Concerns</h2>
                <div class="issue-list">
                    <c:forEach var="issue" items="${issuesList}">
                        <div class="issue-item">
                            <img src="${issue.image}" alt="Issue Image" class="issue-img" />
                            <div class="issue-content">
                                <div class="issue-title">${issue.title}</div>
                                <div class="issue-description">${issue.description}</div>
                                <div class="issue-actions">
                                    <button class="react-btn" onclick="reactToIssue(${issue.id})">React</button>
                                    <button class="ignore-btn" onclick="ignoreIssue(${issue.id})">Ignore</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
    </main>

    <script>
        function reactToIssue(issueId) {
            console.log("Reacting to issue:", issueId);
            // AJAX logic can be added here
        }

        function ignoreIssue(issueId) {
            console.log("Ignoring issue:", issueId);
            // AJAX logic can be added here
        }
    </script>
</body>
</html>
