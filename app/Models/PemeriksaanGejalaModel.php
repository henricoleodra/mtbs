<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanGejalaModel extends Model
{
  protected $table = 'mtbs_pemeriksaan_gejala';
  protected $allowedFields = ['idPemeriksaan', 'idGejala'];
}
