<?php
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['upload']))
    {
       
        $product = $_POST['product'];
        $status= $_POST['status'];
        $qty = $_POST['qty'];

         $insert = mysqli_query($conn,"INSERT INTO product_size_variation
         (product_id,status_id,quantity_in_stock) VALUES ('$product','$status','$qty')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
             header("Location: ../index.php?variation=error");
         }
         else
         {
             echo "Records added successfully.";
             header("Location: ../index.php?variation=success");
         }
     
    }
        
?>