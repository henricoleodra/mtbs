<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\PasienModel;
use App\Models\PemeriksaanModel;

class Pasien extends BaseController
{
  use ResponseTrait;

  protected $pasienModel;
  protected $pemeriksaanModel;

  public function __construct()
  {
    $this->pasienModel = new PasienModel();
    $this->pemeriksaanModel = new PemeriksaanModel();
  }

  public function getAllPasien(){
    $data = $this->pasienModel->findAll();
    return $this->respond($data, 200);
  }

  public function getPasien($id){
    $data = $this->pasienModel->find($id);
    return $this->respond($data, 200);
  }
  public function getPasienKunjungan($id){
    $data = $this->pemeriksaanModel
    ->where("idPasien", $id)
    ->countAllResults();
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

