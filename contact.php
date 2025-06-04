<?php
include 'inc/header.php';
include 'inc/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $pesan = $_POST['pesan'];
    mysqli_query($conn, "INSERT INTO pesan (nama, email, pesan) VALUES ('$nama', '$email', '$pesan')");
    echo "<div class='alert alert-success'>Pesan berhasil dikirim!</div>";
}
?>
<h2>Contact Me</h2>
<form method="post">
  <input type="text" name="nama" placeholder="Nama" required><br>
  <input type="email" name="email" placeholder="Email" required><br>
  <textarea name="pesan" placeholder="Pesan" required></textarea><br>
  <button type="submit">Submit</button>
</form>
<?php include 'inc/footer.php'; ?> 