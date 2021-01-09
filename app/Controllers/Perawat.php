<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\PerawatModel;

class Perawat extends BaseController
{
  use ResponseTrait;

  protected $perawatModel;

  public function __construct()
  {
    $this->perawatModel = new PerawatModel();
  }

  public function createPerawat()
  {
    $data = [
      'namaPerawat' => $this->request->getPost('namaPerawat'),
      'username' => $this->request->getPost('username'),
      'password' => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
      'idPuskesmas' => $this->request->getPost('idPuskesmas')
    ];
    $this->perawatModel->insert($data);
    return $this->respond("Successfully Insert Perawat", 201);
  }
}


