<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Citizen Dashboard</title>
    <!-- Include Chart.js for rendering the chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Custom Styles -->
    <style>
        /* General Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
            header {
            background-color: #1a5f7a;
            color: #fff;
            padding: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease;
        }
        .container {
            width: 90%;
            margin: 30px auto;
        }
        h1, h2 {
            color: #333;
        }
        .card {
            background-color: #fff;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Form Styles */
        form div {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        button {
            background-color: #4CAF50;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }

          .issue-item {
        border-bottom: 1px solid #eee;
        padding: 15px 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        border-radius: 8px;
        background: linear-gradient(45deg, #f0f0f0, #fafafa);
    }
    .issue-item:hover {
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .issue-details h3 {
        margin: 0 0 5px 0;
        color: #333;
        font-size: 18px;
    }
    .issue-details p {
        margin: 0;
        color: #666;
        font-size: 14px;
    }
    .status {
        font-weight: bold;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 12px;
        text-transform: uppercase;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease;
    }
    .status.resolved {
        background-color: #e6f7e6;
        color: #4CAF50;
    }
    .status.in-progress {
        background-color: #fff3e0;
        color: #FF9800;
    }
    .status:hover {
        transform: scale(1.05);
    }
    .date {
        color: #888;
        font-size: 12px;
        margin-top: 5px;
    }

    /* Enhanced Issue Resolution Progress Styles */
    .chart-container {
        position: relative;
        height: 300px;
        width: 100%;
        border: 1px solid #e0e0e0;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        padding: 15px;
        background-color: #fff;
    }
    #issueProgressChart {
        border-radius: 12px;
        background: linear-gradient(135deg, #f7f7f7, #ffffff);
    }

    /* Global Styling Enhancements */
    h2 {
        color: #444;
        margin-top: 0;
        font-size: 24px;
        font-weight: bold;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    .card {
        background-color: #fff;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    </style>
</head>
<body>
    <div class="container">
        <h1>Citizen Dashboard</h1>
          <div class="header-content">
               
                <a href="login.jsp" class="logout-btn">Logout</a>
            </div>

        <!-- Report New Issue -->
        <div class="card">
            <h2>Report New Issue</h2>
            <form action="submitIssue" method="post" enctype="multipart/form-data">
                <div>
                    <label for="title">Issue Title</label>
                    <input type="text" id="title" name="title" placeholder="Enter issue title" required />
                </div>
                <div>
                    <label for="description">Issue Description</label>
                    <input type="text" id="description" name="description" placeholder="Enter issue description" required />
                </div>
                <div>
                    <label for="imageCapture">Capture Issue Image</label>
                    <input type="file" id="imageCapture" name="issueImage" accept="image/*" />
                </div>
                <button type="submit">Submit Issue</button>
            </form>
        </div>

        <!-- Enhanced Issue Tracker -->
        <div class="card">
            <h2>Issue Tracker</h2>
            <div class="issue-list">
                <c:forEach var="issue" items="${issuesList}">
                    <div class="issue-item">
                        <div class="issue-details">
                            <h3>${issue.title}</h3>
                            <p>${issue.description}</p>
                        </div>
                        <div class="issue-meta">
                            <span class="status ${issue.status == 'Resolved' ? 'resolved' : (issue.status == 'In Progress' ? 'in-progress' : 'open')}">
                                ${issue.status}
                            </span>
                            <p class="date">${issue.date}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Enhanced Issue Resolution Progress (Chart) -->
        <div class="card">
            <h2>Issue Resolution Progress</h2>
            <div class="chart-container">
                <canvas id="issueProgressChart"></canvas>
            </div>
        </div>
    </div>

    <!-- JavaScript to handle chart rendering -->
    <script>
        // Sample data for demonstration purposes
        const issuesData = [
            { id: 1, title: 'Road Repair', status: 'Open' },
            { id: 2, title: 'Water Supply Issue', status: 'In Progress' },
            { id: 3, title: 'Street Lighting', status: 'Resolved' },
            { id: 4, title: 'Garbage Collection', status: 'Open' },
            { id: 5, title: 'Public Transport', status: 'Resolved' },
        ];

        // If issuesJson is available from the backend, use it; otherwise, use the sample data
        const issues = ${issuesJson != null ? issuesJson : JSON.stringify(issuesData)};

        const ctx = document.getElementById('issueProgressChart').getContext('2d');

        // Count the number of issues in each status
        const statusCounts = {
            Open: 0,
            'In Progress': 0,
            Resolved: 0
        };

        issues.forEach(issue => {
            statusCounts[issue.status] = (statusCounts[issue.status] || 0) + 1;
        });

        const chart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: Object.keys(statusCounts),
                datasets: [{
                    data: Object.values(statusCounts),
                    backgroundColor: [
                        '#42a5f5', // Open - Blue
                        '#ffb74d', // In Progress - Orange
                        '#66bb6a'  // Resolved - Green
                    ],
                    hoverBackgroundColor: [
                        '#64b5f6',
                        '#ffcc80',
                        '#81c784'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                cutout: '70%',
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            font: {
                                size: 14
                            },
                            padding: 20
                        }
                    },
                    title: {
                        display: true,
                        text: 'Issue Resolution Status',
                        font: {
                            size: 18
                        },
                        padding: {
                            top: 20,
                            bottom: 20
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
