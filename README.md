# 🏛️ HIMA Treasury Web3

Platform **Decentralized Multi-Signature Treasury** berbasis Blockchain untuk lingkungan kampus. Sistem tata kelola dana keuangan himpunan mahasiswa yang 100% transparan, kebal manipulasi, dan memerlukan persetujuan kolektif (Multi-Sig) untuk setiap pencairan dana.

---

## 🎯 Mengapa Proyek Ini Dibuat? (Problem Solving)

Dalam pengelolaan kas organisasi kemahasiswaan, seringkali muncul permasalahan klasik berikut:

* **Kurangnya Transparansi** — Mahasiswa rutin membayar uang kas, tetapi sulit melacak ke mana saja aliran dana tersebut digunakan secara *real-time*.
* **Risiko Penyalahgunaan Dana (Single Point of Failure)** — Jika dana dipegang penuh oleh satu orang (misal: Bendahara), ada risiko dana dipakai untuk kepentingan pribadi atau hilang.
* **Laporan Keuangan Fiktif** — Bukti transfer atau kuitansi manual bisa dimanipulasi atau dipalsukan menggunakan *software* editing.
* **Birokrasi Pencairan Lambat** — Membutuhkan banyak tanda tangan basah yang memakan waktu lama saat dana mendesak dibutuhkan untuk *event* kampus.

**HIMA Treasury** hadir untuk menyelesaikan masalah tersebut dengan teknologi *Smart Contract*:

| Masalah Organisasi | Solusi Web3 HIMA Treasury |
| :--- | :--- |
| **Tidak Transparan** | **On-Chain Public Ledger** — Setiap Rupiah (ETH) yang masuk dan keluar tercatat abadi di Sepolia Etherscan dan bisa diaudit oleh seluruh mahasiswa kapan saja. |
| **Risiko Penyalahgunaan** | **Multi-Signature (Multi-Sig) Wallet** — Dana tidak bisa dicairkan sepihak. Membutuhkan minimal 2 dari 3 persetujuan Pengurus (misal: Ketua & Bendahara) untuk mengeksekusi pencairan. |
| **Laporan Palsu** | **Immutable Data** — Data di blockchain tidak bisa diedit atau dihapus oleh siapapun, bahkan oleh pembuat sistem (Admin) sekalipun. |
| **Birokrasi Lambat** | **Auto-Execution** — Begitu syarat persetujuan (*approval*) terpenuhi, *Smart Contract* otomatis mengirim dana ke dompet vendor/panitia dalam hitungan detik. |

---

## 🏗️ Arsitektur Sistem & Tech Stack

Sistem ini dibangun menggunakan arsitektur *Decentralized Application* (dApp) murni tanpa *database* terpusat (SQL/NoSQL). Seluruh *state* dan *logic* keuangan berjalan di atas *Blockchain*.

* **Smart Contract:** `Solidity` (v0.8.19)
* **Frontend:** `HTML5`, `CSS3` (Glassmorphism UI), `Vanilla JavaScript`
* **Web3 Interactor:** `Ethers.js` (v5.7.2)
* **Wallet Provider:** `MetaMask`
* **Network:** `Ethereum Sepolia Testnet`
* **Deployment:** `Vercel`

---

## ⚙️ Alur Kerja (How It Works)

Sistem ini membagi pengguna menjadi dua *Role* utama: **Mahasiswa** dan **Pengurus (Ketua, Bendahara, Pembina)**.

1. **Top-up Uang Kas (Mahasiswa):**
   Mahasiswa menghubungkan dompet MetaMask dan mengirimkan iuran kas bulanan melalui web. Dana langsung terkunci dengan aman di dalam *Smart Contract*.
2. **Pengajuan Proposal (Bendahara):**
   Saat ada kebutuhan (contoh: DP Sewa Gedung Event), Bendahara membuat "Proposal Penarikan" berisi alamat dompet tujuan, jumlah dana, dan deskripsi acara.
3. **Persetujuan / Approval (Ketua & Pembina):**
   Ketua dan Pembina meninjau proposal tersebut di sistem. Jika setuju, mereka memberikan *Approval* secara kriptografis menggunakan MetaMask.
4. **Pencairan Otomatis (Smart Contract):**
   Ketika syarat minimal persetujuan tercapai (2 dari 3 pengurus), tombol pencairan akan aktif. Dana otomatis ditransfer oleh *Smart Contract* ke dompet tujuan tanpa perantara bank.

---

## 🚀 Cara Menjalankan Proyek Secara Lokal

Jika Anda ingin menguji sistem ini di komputer lokal:

### Persiapan:
1. Pastikan browser Anda memiliki ekstensi **MetaMask**.
2. Ubah jaringan MetaMask ke **Sepolia Testnet**.
3. Pastikan Anda memiliki saldo *Sepolia ETH* (Bisa didapatkan gratis dari Sepolia Faucet).

### Instalasi:
1. *Clone repository* ini:
   ```bash
   git clone [https://github.com/faqih101/hima-treasury-dapp.git](https://github.com/faqih101/hima-treasury-dapp.git)
2. Buka folder proyek di Text Editor (VS Code direkomendasikan).

3. Jalankan file index.html menggunakan ekstensi Live Server.

4. Aplikasi akan terbuka di http://127.0.0.1:5500.

(Catatan: Anda dapat bereksperimen dengan menggunakan beberapa akun/dompet di MetaMask untuk menyimulasikan peran Mahasiswa dan Pengurus).

👨‍💻 Pengembang
Proyek ini dikembangkan sebagai bagian dari portofolio Bootcamp Web3 dan solusi inovasi teknologi kampus.
Adnan Faqih Yudha Mulia * Mahasiswa Informatika, dan Kawan-kawan satu kelompok 8 yang tidak bisa disebutkan satu per satu

Universitas Muhammadiyah Prof. Dr. HAMKA (UHAMKA)
