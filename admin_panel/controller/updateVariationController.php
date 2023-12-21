<?php
include_once "../config/dbconnect.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $v_id = $_POST['v_id'];
    $product = $_POST['product'];
    $status = $_POST['status'];
    $qty = $_POST['qty'];

    // Debugging statements
    echo "Received data: v_id=$v_id, product=$product, status=$status, qty=$qty";

    $updateItem = mysqli_query($conn, "UPDATE product_size_variation SET
        product_id = $product,
        status_id = $status,
        quantity_in_stock = $qty 
        WHERE variation_id = $v_id");

    if ($updateItem) {
        echo "Update successful";
    } else {
        echo "Update failed: " . mysqli_error($conn);
    }
}
?>
