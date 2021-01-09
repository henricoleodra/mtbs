<?php

namespace App\Models;

use CodeIgniter\Model;

class GejalaModel extends Model
{
    protected $table = 'mtbs_gejala';
    protected $primaryKey = 'idGejala';
    protected $allowedFields = ['namaGejala'];
}
