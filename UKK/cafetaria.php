<?php
include 'inc/header.php';
include 'inc/db.php';

$kantin = mysqli_query($conn, "SELECT * FROM kantin");
while ($k = mysqli_fetch_assoc($kantin)) {
    echo "<div class='card mb-4'>";
    echo "<div class='card-header bg-primary text-white'><h3 class='mb-0'>{$k['nama']}</h3></div>";
    echo "<div class='card-body'>";
    echo "<div class='row'>";
    echo "<div class='col-md-3'><img src='assets/img/{$k['foto']}' class='img-fluid rounded mb-2' alt='Foto Kantin'></div>";
    echo "<div class='col-md-9'><p>{$k['deskripsi']}</p></div>";
    echo "</div>";
    echo "<h5 class='mt-3'>Menu Makanan & Minuman</h5>";
    $menu = mysqli_query($conn, "SELECT * FROM menu WHERE id_kantin={$k['id']} LIMIT 4");
    echo "<div class='row'>";
    while ($m = mysqli_fetch_assoc($menu)) {
        echo "<div class='col-md-3 mb-3'>";
        echo "<div class='card h-100'>";
        echo "<img src='assets/img/{$m['foto']}' class='card-img-top' alt='Foto Menu'>";
        echo "<div class='card-body p-2'>";
        echo "<h6 class='card-title mb-1'>{$m['nama']}</h6>";
        echo "<p class='mb-1'>Harga: <b>Rp{$m['harga']}</b></p>";
        echo "<p class='mb-1'>Stok: {$m['stok']}</p>";
        echo "</div></div></div>";
    }
    echo "</div>";
    echo "</div></div>";
}
include 'inc/footer.php';
?> 