<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\GejalaModel;

class Gejala extends BaseController
{
    use ResponseTrait;

    protected $gejalaModel;

    public function __construct()
    {
        $this->gejalaModel = new GejalaModel();
    }

    public function getAllGejala(){
        $data = $this->gejalaModel->findAll();
        return $this->respond($data, 200);
    }

    public function createGejala(){
        $data = [
            'namaGejala' => $this->request->getPost('namaGejala'),
        ];
        $this->gejalaModel->insert($data);
        return $this->respond("Successfully Insert Pasien", 201);
    }
}

