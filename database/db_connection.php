<?php
$servername = "localhost";
$username = "root";
$password = "root"; // default for MAMP
$dbname = "byte2bite_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Database connected successfully!";
?>