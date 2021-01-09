<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanTindakanModel extends Model
{
  protected $table = 'mtbs_pemeriksaan_tindakan';
  protected $allowedFields = ['idPemeriksaan', 'idTindakan'];
}
