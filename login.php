<?php
include_once "dbconnect.php";
include_once "auth.php"; // Include the authentication file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['uname'];
    $password = $_POST['pword'];

    $stmt = $conn->prepare("SELECT user_id, username, password FROM users WHERE `username` = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $user_result = $stmt->get_result();

    if ($user_result->num_rows == 1) {
        $row = $user_result->fetch_assoc();

        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION['user_id'] = $row['user_id']; // Store user_id in session

            $user_data = check_login($conn); // Use the check_login function

            if ($user_data['user_type'] == 'A') {
                header("location: admin_panel/index.php");
                exit();
            } elseif ($user_data['user_type'] == 'U') {
                header("location: user/index.php");
                exit();
            }
        } else {
            header("location: loginform.php?error=InvalidCredentials");
            exit();
        }
    } else {
        header("location: loginform.php?error=UserNotFound");
        exit();
    }
}
?>
