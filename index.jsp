<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen-Politician Interaction Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    .transition-all {
            transition: all 0.3s ease;
        }
        .hover-scale:hover {
            transform: scale(1.05);
        }
        .hover-shadow:hover {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-100 to-purple-100"> 
    <nav class="bg-gradient-to-r from-purple-600 to-indigo-600 p-4 text-white shadow-lg">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">Citizen-Politician Interaction Platform</h1>
            <div class="space-x-4">
                <a href="login.jsp" class="bg-white text-purple-600 hover:bg-purple-100 px-4 py-2 rounded transition-all hover-scale">Login</a>
                <a href="signup.jsp" class="bg-white text-purple-600 hover:bg-purple-100 px-4 py-2 rounded transition-all hover-scale">Sign Up</a>
            </div>
        </div>
    </nav>

    <header class="bg-gradient-to-r from-indigo-600 to-purple-600 text-white py-16">
        <div class="container mx-auto text-center">
            <h1 class="text-5xl font-bold mb-4 animate-pulse">Bridging the Gap Between Citizens and Politicians</h1>
            <p class="text-xl mb-8">Join our platform to make your voice heard and stay informed about your community.</p>
            <a href="signup.jsp" class="bg-green-500 hover:bg-green-400 text-white font-bold py-3 px-6 rounded-lg text-lg transition-all hover-scale hover-shadow">Get Started</a>
        </div>
    </header>

    <main class="container mx-auto py-12">
        <section class="mb-16">
            <h2 class="text-3xl font-bold text-center mb-8 text-indigo-800">Platform Statistics</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-6 rounded-lg shadow-md text-center transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-2 text-purple-600">Active Users</h3>
                    <p class="text-4xl font-bold text-indigo-600">50,000+</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md text-center transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-2 text-purple-600">Issues Resolved</h3>
                    <p class="text-4xl font-bold text-green-600">5,000+</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md text-center transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-2 text-purple-600">Politicians Engaged</h3>
                    <p class="text-4xl font-bold text-indigo-600">500+</p>
                </div>
            </div>
        </section>

        <section class="mb-16">
            <h2 class="text-3xl font-bold text-center mb-8 text-indigo-800">Key Features</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-6 rounded-lg shadow-md transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-4 text-purple-600">Issue Reporting</h3>
                    <p class="text-gray-700">Easily report local issues and track their progress as they're addressed by your representatives.</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-4 text-purple-600">Direct Communication</h3>
                    <p class="text-gray-700">Engage in meaningful discussions with politicians and fellow citizens on matters that affect your community.</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md transition-all hover-scale hover-shadow">
                    <h3 class="text-xl font-semibold mb-4 text-purple-600">Transparency</h3>
                    <p class="text-gray-700">Stay informed with regular updates from politicians and track their performance on key issues.</p>
                </div>
            </div>
        </section>

        <section>
            <h2 class="text-3xl font-bold text-center mb-8 text-indigo-800">Get Involved Today</h2>
            <div class="text-center">
                <p class="text-xl mb-8 text-gray-700">Join thousands of engaged citizens and responsive politicians making a difference in their communities.</p>
                <a href="signup.jsp" class="bg-gradient-to-r from-purple-600 to-indigo-600 hover:from-purple-500 hover:to-indigo-500 text-white font-bold py-3 px-6 rounded-lg text-lg transition-all hover-scale hover-shadow">Create Your Account</a>
            </div>
        </section>
    </main>

    <footer class="bg-gradient-to-r from-gray-800 to-gray-900 text-white py-8">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 Citizen-Politician Interaction Platform. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Sample data for the activity chart
        var ctx = document.getElementById('activityChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Issues Reported',
                    data: [500, 800, 1200, 1800, 1500, 2200],
                    borderColor: 'rgba(109, 40, 217, 1)',
                    backgroundColor: 'rgba(109, 40, 217, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>