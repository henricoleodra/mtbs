<?php

namespace App\Models;

use CodeIgniter\Model;

class TindakanModel extends Model
{
  protected $table = 'mtbs_tindakan';
  protected $primaryKey = 'idTindakan';
  protected $allowedFields = ['namaTindakan'];
}
