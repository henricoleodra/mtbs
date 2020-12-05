<?php

namespace App\Models;

use CodeIgniter\Model;

class Pasien extends Model
{
  protected $table = 'mtbs_pasien';
  protected $primaryKey = 'idPasien';
  protected $allowedFields = ['namaIbu', 'namaAnak', 'tanggalLahir', 'provinsi', 'alamat', 'rt', 'rw', 'kelurahanDesa', 'kotaKecamatan'];
}
