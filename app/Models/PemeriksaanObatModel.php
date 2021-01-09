<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanObatModel extends Model
{
  protected $table = 'mtbs_pemeriksaan_obat';
  protected $allowedFields = ['idPemeriksaan', 'idObat'];
}
