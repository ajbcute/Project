
<header class="header">
    <div class="flex">
        <a href="products.php" class="logo">Home</a>
        <a href="order_history.php" class="logo">Orders</a>
        <nav class="navbar">
            <a href="products.php">View Products</a>
        </nav>

        <?php
        include("dbconnect.php");
        $select_rows = mysqli_query($conn, "SELECT * FROM `cart`") or die('query failed');
        $row_count = mysqli_num_rows($select_rows);
        ?>
        
        <a href="cart.php" class="cart">Cart <span><?php echo $row_count; ?></span> </a>

        <div class="col-md-4 mt-2">
    <nav class="navbar">
        <div class="btn-group">
            <?php
            if (isset($_SESSION['user_id'])) {
                $user_id = $_SESSION['user_id'];
                $username_query = mysqli_query($conn, "SELECT username FROM users WHERE user_id = $user_id");
                $user_data = mysqli_fetch_assoc($username_query);
                $username = $user_data['username'];
            ?>
                <button type="button" class="btn btn-light" style="font-size: 18px;">
                    <?php echo $username; ?>
                </button>
            <?php
            } else {
            ?>
                <!-- If user_id is not set, you can display a default text or handle it as needed -->
                <button type="button" class="btn btn-light" style="font-size: 18px;">
                    Guest
                </button>
            <?php
            }
            ?>
            <!-- Replace the toggle dropdown button with a logout icon and "Logged in as" text -->
        </div>
    </nav>
</div>


        <div class="col-md-2 mt-2">
            <nav class="navbar">
               <a href="logout.php" class="btn btn-light" title="Logout">
                  <i class="fas fa-sign-out-alt"></i>Logout
               </a>
            </nav>
        </div>
    </div>
</header>
