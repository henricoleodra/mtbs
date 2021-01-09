<?php

namespace App\Models;

use CodeIgniter\Model;

class KlasifikasiModel extends Model
{
  protected $table = 'mtbs_klasifikasi';
  protected $primaryKey = 'idKlasifikasi';
  protected $allowedFields = ['namaKlasifikasi', 'idPenyakit'];
}
