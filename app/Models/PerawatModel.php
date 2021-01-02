<?php

namespace App\Models;

use CodeIgniter\Model;

class PerawatModel extends Model
{
  protected $table = 'mtbs_perawat';
  protected $primaryKey = 'idPerawat';
  protected $allowedFields = ['namaPerawat', 'username', 'password', 'idPuskesmas'];
}
