<?php
session_start();

function check_login($conn) {
    if (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];

        $stmt = $conn->prepare("SELECT * FROM users WHERE `user_id` = ?");
        $stmt->bind_param("s", $user_id);
        $stmt->execute();
        $user_result = $stmt->get_result();

        if ($user_result->num_rows == 1) {
            return $user_result->fetch_assoc();
        }
    }

    return null; // Return null if not logged in or user not found
}
?>
