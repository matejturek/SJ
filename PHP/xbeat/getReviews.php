<?php
include 'config.php';

// Create a connection
$mysqli = new mysqli($hostname, $username, $password, $dbname);

// Check the connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Select data from the products table
$sql = "SELECT * FROM reviews";
$result = $mysqli->query($sql);

// Check if there are any results
if ($result->num_rows > 0) {
    // Fetch the results into an associative array
    $products = $result->fetch_all(MYSQLI_ASSOC);

    // Output the JSON
    header('Content-Type: application/json');
    echo json_encode($products, JSON_PRETTY_PRINT);
} else {
    echo "No products found.";
}

// Close the connection
$mysqli->close();

?>