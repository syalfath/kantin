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
('Kantin Ibu Rika', 'Kantin dengan berbagai pilihan makanan tradisional dan minuman segar.', 'kantin1.png'),
('Kantin Mas Riki', 'Kantin modern dengan menu kekinian dan harga terjangkau.', 'kantin2.png');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(1, 'Nasi Goreng', 12000, 20, 'nasigoreng.png'),
(1, 'Mie Ayam', 10000, 15, 'mieayam.png'),
(1, 'Es Teh Manis', 5000, 30, 'esteh.png'),
(1, 'Bakso', 13000, 10, 'bakso.png');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(2, 'Sosis Bakar', 8000, 25, 'sosisbakar.png'),
(2, 'Roti Bakar', 9000, 18, 'rotibakar.png'),
(2, 'Jus Alpukat', 7000, 20, 'jusalpukat.png'),
(2, 'Kentang Goreng', 10000, 12, 'kentanggoreng.png');
INSERT INTO pesan (nama, email, pesan) VALUES
('Andi', 'andi@email.com', 'Terima kasih untuk pelayanannya!');

INSERT INTO kantin (nama, deskripsi, foto) VALUES
('Kantin Batagor Mas Riki', 'Kantin spesialis batagor dan jajanan khas Bandung, enak dan murah.', 'kantin3.png'),
('Kantin Masakan Rumah bu Eka', 'Kantin dengan masakan rumahan, cocok untuk makan siang sehat dan bergizi.', 'kantin4.png');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(4, 'Ayam Goreng', 14000, 18, 'ayamgoreng.png'),
(4, 'Sayur Asem', 7000, 20, 'sayurasem.png'),
(4, 'Tempe Orek', 5000, 30, 'tempeorek.png'),
(4, 'Teh Hangat', 4000, 25, 'tehhangat.png');
INSERT INTO menu (id_kantin, nama, harga, stok, foto) VALUES
(3, 'Batagor', 9000, 20, 'batagor.png'),
(3, 'Siomay', 8000, 15, 'siomay.png'),
(3, 'Es Jeruk', 6000, 25, 'esjeruk.png'),
(3, 'Tahu Gejrot', 7000, 10, 'tahugejrot.png'); 
