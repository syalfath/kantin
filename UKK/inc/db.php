<?php
  $host = "localhost";
  $user = "root";
  $pass = ""; // default XAMPP MySQL password is empty
  $db   = "kantinukk";
  
  $conn = mysqli_connect($host, $user, $pass, $db);
  if (!$conn) {
      die("Koneksi gagal: " . mysqli_connect_error());
  }
  ?>