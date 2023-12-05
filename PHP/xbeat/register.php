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

    // Sanitize user input
    $username = sanitize_input($data["username"]);
    $password = sanitize_input($data["password"]);
    $email = sanitize_input($data["email"]);

    // Insert user data into the database
    $sql = "INSERT INTO users (username, password, email) VALUES ('$username', '$password', '$email')";
    
    if ($conn->query($sql) === TRUE) {
        // Registration successful
        $response['status'] = 'success';
        $response['message'] = 'Registration successful!';
        $response['id'] = $conn->insert_id;
    } else {
        // Registration failed
        $response['status'] = 'error';
        $response['message'] = 'Registration failed. Error: ' . $conn->error;
        $response['id'] = -1;
    }
}

// Close the database connection
$conn->close();

// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);
?>