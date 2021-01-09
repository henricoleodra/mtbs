<?php

namespace App\Models;

use CodeIgniter\Model;

class PenyakitModel extends Model
{
  protected $table = 'mtbs_penyakit';
  protected $primaryKey = 'idPenyakit';
  protected $allowedFields = ['namaPenyakit'];
}
