<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\PasienModel;

class Pasien extends BaseController
{
  use ResponseTrait;

  protected $pasienModel;

  public function __construct()
  {
    $this->pasienModel = new PasienModel();
  }

  public function getAllPasien(){
    $data = $this->pasienModel->findAll();
    return $this->respond($data, 200);
  }

  public function createPasien(){
    $data = [
      'namaIbu' => $this->request->getPost('namaIbu'),
      'namaAnak' => $this->request->getPost('namaAnak'),
      'tanggalLahir' => $this->request->getPost('tanggalLahir'),
      'provinsi' => $this->request->getPost('provinsi'),
      'kota' => $this->request->getPost('kota'),
      'alamat' => $this->request->getPost('alamat'),
      'rt' => $this->request->getPost('rt'),
      'rw' => $this->request->getPost('rw'),
      'kelurahanDesa' => $this->request->getPost('kelurahanDesa'),
      'kecamatan' => $this->request->getPost('kecamatan'),
    ];
    $this->pasienModel->insert($data);
    return $this->respond("Successfully Insert Pasien", 201);
  }
}

