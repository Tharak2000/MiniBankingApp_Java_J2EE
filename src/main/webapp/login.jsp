<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <style>
        /* Reset */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(37, 117, 252, 0.3);
            width: 320px;
            backdrop-filter: blur(10px);
        }
        
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            color: #e0e0ff;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #cfd8dc;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 8px #2575fc;
            color: #fff;
        }
        
        button {
            width: 100%;
            padding: 14px;
            background: #2575fc;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 700;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        button:hover {
            background-color: #6a11cb;
        }
        
        .footer-text {
            margin-top: 18px;
            text-align: center;
            font-size: 13px;
            color: #b0bec5;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
	        <% String error = (String) request.getAttribute("error"); %>
			<% if (error != null) { %>
		    <div style="color: #ff5252; text-align:center; margin-bottom: 15px; font-weight: bold;">
		        <%= error %>
		    </div>
			<% } %>
        
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required />
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required />
            
            <button type="submit">Sign In</button>
        </form>
        <div class="footer-text">© 2025 YourCompany</div>
    </div>
</body>
</html>
