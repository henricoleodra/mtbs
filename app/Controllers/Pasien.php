<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\PasienModel;

class Pasien extends ResourceController
{
  use ResponseTrait;
  public function index()
  {
    $model = new Pasien();
    $data = $model->findAll();
    return $this->respond($data, 200);
  }
}
