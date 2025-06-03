<?php
include 'inc/header.php';
include 'inc/db.php';

$kantin_terpilih = isset($_GET['kantin']) ? intval($_GET['kantin']) : 0;

// Proses pembelian
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['kantin'])) {
    $kantin_terpilih = intval($_POST['kantin']);
    $total = 0;
    if (isset($_POST['menu']) && is_array($_POST['menu'])) {
        foreach ($_POST['menu'] as $id => $qty) {
            if ($qty > 0) {
                $menu = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM menu WHERE id=$id"));
                $total += $menu['harga'] * $qty;
                // Update stok
                mysqli_query($conn, "UPDATE menu SET stok = stok - $qty WHERE id=$id");
            }
        }
        echo "<h3>Total Harga: Rp$total</h3>";
        echo "<p>Dummy QR: <img src='assets/img/qr.png' width='500'></p>";
    }
}
?>

<form method="get">
  <label for="kantin">Pilih Kantin:</label>
  <select name="kantin" id="kantin" class="form-control" onchange="this.form.submit()" required>
    <option value="">-- Pilih Kantin --</option>
    <?php
    $kantin = mysqli_query($conn, "SELECT * FROM kantin");
    while ($k = mysqli_fetch_assoc($kantin)) {
        $selected = ($kantin_terpilih == $k['id']) ? 'selected' : '';
        echo "<option value='{$k['id']}' $selected>{$k['nama']}</option>";
    }
    ?>
  </select>
</form>

<?php if ($kantin_terpilih) : ?>
  <form method="post" id="formMenu">
    <input type="hidden" name="kantin" value="<?= $kantin_terpilih ?>">
    <h2>Pilih Menu Makanan/Minuman</h2>
    <?php
    $menu = mysqli_query($conn, "SELECT * FROM menu WHERE id_kantin=$kantin_terpilih AND stok > 0");
    $adaMenu = false;
    while ($m = mysqli_fetch_assoc($menu)) {
        $adaMenu = true;
        echo "<div class='row align-items-center mb-2'>";
        echo "<div class='col-md-5'>{$m['nama']}</div>";
        echo "<div class='col-md-2'>Rp{$m['harga']}</div>";
        echo "<div class='col-md-2'>Stok: {$m['stok']}</div>";
        echo "<div class='col-md-3'><input type='number' name='menu[{$m['id']}]' min='0' max='{$m['stok']}' value='0' class='form-control'></div>";
        echo "</div>";
    }
    if (!$adaMenu) {
        echo "<em>Tidak ada menu tersedia.</em>";
    }
    ?>
    <button type="submit" class="btn btn-primary mt-2" id="btnBeli" disabled>Beli</button>
  </form>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
      const form = document.getElementById('formMenu');
      if (!form) return;
      const inputs = form.querySelectorAll('input[type="number"][name^="menu"]');
      const btnBeli = document.getElementById('btnBeli');

      function checkInput() {
          let adaPesanan = false;
          inputs.forEach(input => {
              if (parseInt(input.value) > 0) adaPesanan = true;
          });
          btnBeli.disabled = !adaPesanan;
      }

      inputs.forEach(input => {
          input.addEventListener('input', checkInput);
      });

      checkInput(); // cek awal
  });
  </script>
<?php endif; ?>

<?php include 'inc/footer.php'; ?>