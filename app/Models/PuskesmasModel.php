<?php

namespace App\Models;

use CodeIgniter\Model;

class PuskesmasModel extends Model
{
  protected $table = 'mtbs_puskesmas';
  protected $primaryKey = 'idPuskesmas';
  protected $allowedFields = ['namaPuskesmas'];
}
