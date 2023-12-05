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
   
    // // Decode JSON data
    $data = json_decode($json_data, true);


    // // Sanitize user input
    $username = sanitize_input($data["username"]);
    $password = sanitize_input($data["password"]);
    

    // // Query to check if the username and password match
    $sql = "SELECT id FROM users WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Login successful
        $row = $result->fetch_assoc();
        $response['status'] = 'success';
        $response['message'] = 'Login successful!';
        $response['id'] = $row['id'];
    } else {
        // Login failed
        $response['status'] = 'error';
        $response['message'] = 'Login failed. Invalid username or password.';
        $response['id'] = -1;
    }
}

// Close the database connection
$conn->close();


// Return the response as JSON
header('Content-Type: application/json');
echo json_encode($response);
?>