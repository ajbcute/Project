<?php
session_start();
include 'dbconnect.php';

if (isset($_POST['order_btn'])) {
    $name = $_POST['name'];
    $number = $_POST['number'];
    $method = $_POST['method'];
    $city = $_POST['city'];

    // Get the user_id from the session
    $user_id = $_SESSION['user_id'];

    $cart_query = mysqli_query($conn, "SELECT * FROM `cart`");
    $price_total = 0;
    if (mysqli_num_rows($cart_query) > 0) {
        while ($product_item = mysqli_fetch_assoc($cart_query)) {
            $product_name[] = $product_item['product_name'] . ' (' . $product_item['quantity'] . ') ';
            $product_price = number_format($product_item['price'] * $product_item['quantity']);
            $price_total += $product_price;
        };
    };

    $total_product = implode(', ', $product_name);

    // Insert the order into the orders table
    $order_insert_query = mysqli_query($conn, "INSERT INTO `orders`(fullname, contact_no, pay_method, user_address, user_id) 
                                               VALUES('$name','$number','$method','$city', $user_id)") or die('query failed');

    // Check if the order insertion was successful
    if ($order_insert_query) {
        $order_query = mysqli_query($conn, "SELECT * FROM `orders` ORDER BY `order_id` DESC LIMIT 1");
        $order_od = mysqli_fetch_assoc($order_query);
        $od_order_id = $order_od['order_id'];

        $cart_detail_query = mysqli_query($conn, "SELECT * FROM `cart`");
        if (mysqli_num_rows($cart_detail_query) > 0) {
            while ($product_detail_item = mysqli_fetch_assoc($cart_detail_query)) {
                $od_variation = $product_detail_item['variation_id'];
                $od_quantity = $product_detail_item['quantity'];
                $od_price = $product_detail_item['price'];

                $detail_query = mysqli_query($conn, "INSERT INTO `order_details` (`order_id`, `variation_id`, `quantity`, `price`) 
                                                    VALUES ('$od_order_id','$od_variation','$od_quantity','$od_price')") or die('query failed');
            };
        };

        $delete_cart_query = mysqli_query($conn, "DELETE FROM `cart`");

        if ($delete_cart_query) {
            // Display success message and order details
            echo "
            <div class='order-message-container'>
                <div class='message-container'>
                    <h3>Thank you for shopping!</h3>
                    <div class='order-detail'>
                        <span>" . $total_product . "</span>
                        <span class='total'> total : ₱" . $price_total . "</span>
                    </div>
                    <div class='customer-details'>
                        <p> your name : <span>" . $name . "</span> </p>
                        <p> your number : <span>" . $number . "</span> </p>
                        <p> your address : <span>" . $city . "</span> </p>
                        <p> your payment mode : <span>" . $method . "</span> </p>
                        <p>(*pay when product arrives*)</p>
                    </div>
                    <a href='products.php' class='btn'>continue shopping</a>
                </div>
            </div>
            ";
        } else {
            $message[] = 'Error deleting products from the cart: ' . mysqli_error($conn);
        }
    } else {
        echo "Error placing order: " . $conn->error;
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>checkout</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<?php include 'header.php'; ?>

<div class="container">

<section class="checkout-form">

    <h1 class="heading">complete your order</h1>

    <form action="" method="post">

    <div class="display-order">
        <?php
        $select_cart = mysqli_query($conn, "SELECT * FROM `cart`");
        $total = 0;
        $grand_total = 0;
        if (mysqli_num_rows($select_cart) > 0) {
            while ($fetch_cart = mysqli_fetch_assoc($select_cart)) {
                $total_price = number_format($fetch_cart['price'] * $fetch_cart['quantity']);
                $grand_total = $total += $total_price;
        ?>
        <span><?= $fetch_cart['product_name']; ?>(<?= $fetch_cart['quantity']; ?>)</span>
        <?php
            }
        } else {
            echo "<div class='display-order'><span>your cart is empty!</span></div>";
        }
        ?>
        <span class="grand-total"> grand total : ₱<?= $grand_total; ?></span>
    </div>

        <div class="flex">
            <div class="inputBox">
                <span>Your Fullname</span>
                <input type="text" placeholder="Enter your name" name="name" required
            </div>
            <div class="inputBox">
                <span>Your number</span>
                <input type="number" placeholder="Enter your number" name="number" required>
            </div>
            <div class="inputBox">
                <span>Payment method</span>
                <select name="method">
                    <option value="cash on delivery" selected>Cash On Delivery</option>
                    <option value="credit cart">Credit cart</option>
                    <option value="paypal">Paypal</option>
                </select>
            </div>
            <div class="inputBox">
                <span>Address</span>
                <input type="text" placeholder="e.g. Ligao" name="city" required>
            </div>
            <input type="submit" value="order now" name="order_btn" class="btn">
        </form>

    </section>

</div>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>
