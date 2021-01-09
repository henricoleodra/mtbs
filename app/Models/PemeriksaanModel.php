<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanModel extends Model
{
  protected $table = 'mtbs_pemeriksaan';
  protected $primaryKey = 'idPemeriksaan';
  protected $allowedFields = ['idPemeriksaan', 'tanggalPemeriksaan', 'suhu', 'beratBadan','tinggiBadan','kunjungan','keluhan','idPasien','idPerawat','idPuskesmas'];
}
