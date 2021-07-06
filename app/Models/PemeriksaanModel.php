<?php

namespace App\Models;

use CodeIgniter\Model;

class PemeriksaanModel extends Model
{
  protected $table = 'mtbs_pemeriksaan';
  protected $primaryKey = 'idPemeriksaan';
  protected $allowedFields = ['idPemeriksaan', 'tanggalPemeriksaan', 'suhu', 'beratBadan','tinggiBadan','kunjungan','keluhan','idPasien','idPerawat','idPuskesmas'];


  public function __construct()
  {
    parent::__construct();
    $this->db = \Config\Database::connect();
  }

  public function getKunjungan($idPasien)
  {
    $query = $this->db->table("mtbs_pasien")
    ->where("rt",1)
    ->countAllResults();
    return $query;
  }


}
