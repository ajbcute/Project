<?php
session_start();
include 'dbconnect.php'; // Include your database connection file

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    // Redirect to login page or handle the case where the user is not logged in
    header("location: loginform.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch the user's orders from the database
$orders_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE `user_id` = $user_id ORDER BY `order_id` DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xr+M1gdYXSSQ5/4iIcz7pOhUwL3/x3ovJk+BvLDUioLwYiYcJv1sSPD5oErI/NZ/MF1cfZH2/CMqDDxJu2I6vA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/style.css">
    <style>
        /* Custom styles for increased font size */
        .card-body p {
            font-size: 18px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Order Tracking</title>

    <!-- Add your stylesheets or other head content -->

</head>
<body>

<?php include 'header.php'; ?>
<div class="container mt-5">

    <section class="order-tracking">

        <h1 class="display-4 mb-4">Order Tracking</h1>

        <?php
        // Check if there are any orders for the logged-in user
        if (mysqli_num_rows($orders_query) > 0) {
            while ($order = mysqli_fetch_assoc($orders_query)) {
                ?>
                <div class="card mb-4">
                    <div class="card-header">
                        <h3 class="card-title">Order ID: <?= $order['order_id']; ?></h3>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><strong>Fullname:</strong> <?= $order['fullname']; ?></p>
                        <p class="card-text"><strong>Contact Number:</strong> <?= $order['contact_no']; ?></p>
                        <p class="card-text"><strong>User Address:</strong> <?= $order['user_address']; ?></p>
                        <p class="card-text"><strong>Payment Method:</strong> <?= $order['pay_method']; ?></p>
                        <p class="card-text"><strong>Order Status:</strong> 
                            <?php
                                if ($order['order_status'] == 0) {
                                    echo "Pending";
                                } elseif ($order['order_status'] == 1) {
                                    echo "Delivered";
                                }
                            ?>
                        </p>
                    </div>
                </div>
                <?php
            }
        } else {
            echo "<p class='lead'>No orders found for the logged-in user.</p>";
        }
        ?>

    </section>

</div>

<!-- Add your footer or other HTML content as needed -->

</body>
</html>
