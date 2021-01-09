<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanKlasifikasiModel extends Model
{
  protected $table = 'mtbs_pemeriksaan_klasifikasi';
  protected $allowedFields = ['idPemeriksaan', 'idKlasifikasi'];
}
