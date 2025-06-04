create database cafetaria;
use cafetaria;
CREATE TABLE kantin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100),
  deskripsi TEXT,
  foto VARCHAR(255)
);

CREATE TABLE menu (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_kantin INT,
  nama VARCHAR(100),
  harga INT,
  stok INT,
  foto VARCHAR(255),
  FOREIGN KEY (id_kantin) REFERENCES kantin(id)
);

CREATE TABLE pesan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100),
  email VARCHAR(100),
  pesan TEXT
); 
INSERT INTO kantin (nama, deskripsi, foto) VALUES
('Kantin Ateng', 'Kantin dengan berbagai pilihan makanan yang digoreng dan minuman segar.', 'kantin1.jpg'),
('Kantin Bro Gembul', 'Kantin modern dengan menu kekinian dan harga terjangkau.', 'kantin2.jpg');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(1, 'Nasi Goreng', 13000, 20, 'nasgor.jpg'),
(1, 'Toge Goreng', 10000, 25, 'togegoreng.jpg'),
(1, 'Es Teh Manis', 5000, 30, 'esteh.png'),
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(2, 'Roti Gandum', 5000, 30, 'rotigandum.jpg'),
(2, 'Roti Bakar Isi', 9000, 18, 'rotibakarisi.jpg'),
(2, 'Americano', 10000, 25, 'americano.jpg'),
(2, 'Susu', 8000, 20, 'susu.jpg');
INSERT INTO pesan (nama, email, pesan) VALUES
('Andi', 'andi@email.com', 'Terima kasih untuk pelayanannya!');

INSERT INTO kantin (nama, deskripsi, foto) VALUES
('Kantin Batagor Bang Rizal', 'Kantin Sehat, enak dan murah.', 'kantin3.jpg'),
('Kantin Masakan Mpo Ropiah', 'Kantin dengan masakan rumahan, cocok untuk makan siang sehat dan bergizi.', 'kantin4.jpg');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(4, 'Bebek Bakar', 15000, 18, 'bebekbakar.jpg'),
(4, 'Sayur Asem', 7000, 20, 'sayurasem.png'),
(4, 'Tempe Orek', 5000, 30, 'tempeorek.png'),
(4, 'Teh Hangat', 4000, 25, 'tehhangat.png');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(3, 'Salad Warp', 18000, 20, 'saladwrap.jpg'),
(3, 'Russischer Salat', 20000, 20, 'russischersalat.jpg'),
(3, 'Es Jeruk', 6000, 25, 'esjeruk.png'),
(3, 'Kebab', 15000, 15, 'kebab.jpg'); 
