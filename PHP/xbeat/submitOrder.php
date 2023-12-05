<?php
include 'config.php';

// Create connection
$conn = new mysqli($hostname, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to sanitize user input
function sanitize_input($input) {
    // Implement your sanitization logic here
    $input = trim($input);
    $input = stripslashes($input);
    $input = htmlspecialchars($input);
    return $input;
}

// Initialize response array
$response = array();

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get raw JSON data
    $json_data = file_get_contents("php://input");
   
    // Decode JSON data
    $data = json_decode($json_data, true);

    // // Sanitize user input
    $user_id = sanitize_input($data["user_id"]);
    $products = json_encode($data["products"]);
    $price = sanitize_input($data["price"]);

    $date = date('Y-m-d H:i:s');
    
    // Update the quantity of the item in the cart
    $sql = "INSERT INTO orders (user_id, price, products, date, status) VALUES ('$user_id', '$price', '$products', '$date', '0')";

    // $response['sql'] = $sql;
    
    // $response['products'] = $products;
    if ($conn->query($sql) === TRUE) {
        // Update successful
        $response['status'] = 'success';
        $response['message'] = 'Cart item updated successfully!';
    } else {
        // Update failed
        $response['status'] = 'error';
        $response['message'] = 'Update failed. Error: ' . $conn->error;
        $response['sql'] = $sql;
    }
}

// Close the database connection
$conn->close();

// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);
?>