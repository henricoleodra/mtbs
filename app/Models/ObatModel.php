<?php

namespace App\Models;

use CodeIgniter\Model;

class ObatModel extends Model
{
  protected $table = 'mtbs_obat';
  protected $primaryKey = 'idObat';
  protected $allowedFields = ['namaObat', 'pemberian'];
}
