<?php
session_start();
include_once 'dbconnect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];
    $contact = $_POST['contact'];
    $address = $_POST['address'];
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (fullname, email, username, password, contact_no, user_address) 
            VALUES ('$fullname', '$email', '$username', '$hashed_password', '$contact', '$address')";

    $result = mysqli_query($conn, $sql);

    if ($result) {
        $_SESSION['username'] = $username;
        $_SESSION['fullname'] = $fullname;

        header("Location: loginform.php");
        exit();
    } else {
        $error_message = "Registration failed. Please try again.";
    }
}
?>
