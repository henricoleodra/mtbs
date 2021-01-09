<?php

namespace App\Models;

use CodeIgniter\Model;

class KlasifikasiObatModel extends Model
{
  protected $table = 'mtbs_klasifikasi_model';
  protected $allowedFields = ['idKlasifikasi', 'idObat', 'dosis'];
}
