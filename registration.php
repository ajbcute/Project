<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xr+M1gdYXSSQ5/4iIcz7pOhUwL3/x3ovJk+BvLDUioLwYiYcJv1sSPD5oErI/NZ/MF1cfZH2/CMqDDxJu2I6vA==" crossorigin="anonymous" />
    <title>Registration Form</title>
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

        .already-account {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h1>Welcome to Registration Form</h1>

    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4 form-container  mb-4">
                <form action="register.php" method="POST">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Fullname</label>
                        <input type="text" class="form-control" name="fullname" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="text" class="form-control" name="email" required>
                    </div>

                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>

                    <div class="mb-3">
                        <label for="cpassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" name="cpassword" required>
                    </div>

                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact No.</label>
                        <input type="text" class="form-control" name="contact" required>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" required>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Register">
                </form>

                <div class="already-account">
                    <p>Already have an account? <a href="loginform.php">Login here</a></p>
                </div>
            </div>

            <div class="col-md-4"></div>
        </div>
    </div>

</body>
</html>
