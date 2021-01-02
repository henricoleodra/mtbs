<?php

namespace App\Models;

use CodeIgniter\Model;

class PasienModel extends Model
{
  protected $table = 'mtbs_pasien';
  protected $primaryKey = 'idPasien';
  protected $allowedFields = ['namaIbu', 'namaAnak', 'tanggalLahir', 'provinsi', 'kota', 'alamat', 'rt', 'rw', 'kelurahanDesa', 'kecamatan'];
}
