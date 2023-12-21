<?php
include 'dbconnect.php';

if (isset($_POST['add_to_cart'])) {
    $product_name = $_POST['product_name'];
    $product_price = $_POST['product_price'];
    $product_image = $_POST['product_image'];
    $product_quantity = 1;

    // Retrieve variation_id directly from product_size_variation
    $select_variation_query = "SELECT variation_id FROM product_size_variation WHERE LOWER(product_name) = LOWER('$product_name')";
    $variation_result = mysqli_query($conn, $select_variation_query);

    if ($variation_result) {
        $variation_data = mysqli_fetch_assoc($variation_result);

        if ($variation_data['variation_id']) {
            // Update cart with variation_id
            $update_query = "UPDATE cart SET variation_id = '{$variation_data['variation_id']}'
                             WHERE LOWER(product_name) = LOWER('$product_name')";
            $update_result = mysqli_query($conn, $update_query);

            if ($update_result) {
                $message[] = 'variation_id updated successfully';
            } else {
                $message[] = 'Error updating variation_id: ' . mysqli_error($conn);
            }
        } else {
            $message[] = 'variation_id not found for product_name';
        }
    } else {
        $message[] = 'Error fetching variation_id: ' . mysqli_error($conn);
    }

    $select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE LOWER(product_name) = LOWER('$product_name')");

    if (mysqli_num_rows($select_cart) > 0) {
        $message[] = 'product already added to cart';
    } else {
        $insert_product = mysqli_query($conn, "INSERT INTO `cart`(product_name, price, product_image, quantity, variation_id) 
                                             VALUES('$product_name', '$product_price', '$product_image', '$product_quantity', '{$variation_data['variation_id']}')");
        $message[] = 'product added to cart successfully';
    }
}

?>



<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <style>
/* Add your custom styles here */
.col-md-6 .special-h1 {
        margin-left: 10px;
        font-size: 50px;
        font-family: 'Times New Roman', Times, serif;
        font-weight: bold;
    }

    .TASSD-image {
      margin-left: 30px;
        width: 100%;
        max-width: 500px; /* Adjust this value as needed */
        height: auto;
        animation: bounce 2s infinite;
    }

    @keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            transform: translateY(0);
        }
        40% {
            transform: translateY(-20px);
        }
        60% {
            transform: translateY(-10px);
        }
    }

   .box {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      height: 500px; /* Set the desired height for the box */
   }

   .box img {
      max-width: 100%;
      max-height: 100%; /* Ensure the image doesn't exceed the box height */
      object-fit: contain; /* Maintain aspect ratio while filling the box */
      margin-bottom: 10px;
   }
</style>

   <title>Products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">
</head>

<body>
<?php

if(isset($message)){
   foreach($message as $message){
      echo '<div class="message"><span>'.$message.'</span> <i class="fas fa-times" onclick="this.parentElement.style.display = `none`;"></i> </div>';
   };
};

?>

<?php include 'header.php'; ?>

<div class="container">
    <div class="row">
        <!-- Quotation and Animated Burger Image -->
        <div class="col-md-6">
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            <h1 class="special-h1">"Big Mouth: Bites of joy, clicks of convenience."</h1>
        </div>
        <div class="col-md-6">
            <br><br><br><br><br><br>
            <img src="uploads/TASSD.png" alt="TASSD" class="TASSD-image img-fluid">
            <br><br><br><br><br><br>


        </div>
        
    </div>
</div>

<div class="container">

<section class="products">

   <h1 class="heading">Latest products</h1>

   <div class="box-container">

      <?php
      
      $select_products = mysqli_query($conn, "SELECT * FROM `product`");
      if(mysqli_num_rows($select_products) > 0){
         while($fetch_product = mysqli_fetch_assoc($select_products)){
      ?>

      <form action="" method="post">
      <div class="box">
   <?php
   $imagePath = $fetch_product['product_image'];
   if (file_exists($imagePath)) {
      echo '<img src="' . $imagePath . '" alt="">';
   } else {
      echo '<span style="color: red;">Image not found</span>';
   }
   ?>
   <h3><?php echo $fetch_product['product_name']; ?></h3>
   <div class="price">₱<?php echo $fetch_product['price']; ?></div>
   <input type="hidden" name="product_name" value="<?php echo $fetch_product['product_name']; ?>">
   <input type="hidden" name="product_price" value="<?php echo $fetch_product['price']; ?>">
   <input type="hidden" name="product_image" value="<?php echo $fetch_product['product_image']; ?>">
   <input type="submit" class="btn" value="add to cart" name="add_to_cart">
</div>
      </form>

      <?php
         };
      };
      ?>

   </div>

</section>

</div>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>