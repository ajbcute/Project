<?php
include("../dbconnect.php");
include("../auth.php");


$user_data = check_login($conn);

if (!$user_data) {
    header("Location: ../loginform.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xr+M1gdYXSSQ5/4iIcz7pOhUwL3/x3ovJk+BvLDUioLwYiYcJv1sSPD5oErI/NZ/MF1cfZH2/CMqDDxJu2I6vA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Client's Home Page</title>
</head>
<body>

<?php
include("dbconnect.php");
include_once('products.php');
?>


</body>
</html>
