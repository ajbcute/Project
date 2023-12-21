<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fce4ec; /* Light pink background color */
            font-family: 'Georgia', sans-serif;
        }

        h1 {
            color: #333;
            font-size: 36px;
            text-align: center;
            margin-top: 50px;
        }

        .container {
            margin-top: 50px;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h1>Welcome to Log-in Form</h1>

    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 form-container">
                <form action="login.php" method="POST">
                    <div class="mb-3">
                        <label for="uname" class="form-label">Username</label>
                        <input type="text" class="form-control" name="uname" required>
                    </div>

                    <div class="mb-3">
                        <label for="pword" class="form-label">Password</label>
                        <input type="password" class="form-control" name="pword" required>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Login">
                </form>
                
                <div class="register-link">
                    <p>Don't have an account? <a href="registration.php">Register here</a></p>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

    <script src="js/bootstrap.js"></script>
</body>
</html>
