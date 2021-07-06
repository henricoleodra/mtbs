<?php

namespace App\Controllers;

use App\Models\PemeriksaanModel;
use App\Models\PasienModel;
use App\Models\KlasifikasiModel;
use App\Models\PemeriksaanKlasifikasiModel;
use App\Models\TindakanModel;
use App\Models\PemeriksaanTindakanModel;
use CodeIgniter\API\ResponseTrait;

class Pemeriksaan extends BaseController
{
  use ResponseTrait;

  protected $pemeriksaanModel;
  protected $pasienModel;
  protected $klasifikasiModel;
  protected $pemeriksaanKlasifikasiModel;
  protected $tindakanModel;
  protected $pemeriksaanTindakanModel;

  public function __construct()
  {
    $this->pemeriksaanModel = new PemeriksaanModel();
    $this->pasienModel = new PasienModel();
    $this->klasifikasiModel = new KlasifikasiModel();
    $this->pemeriksaanKlasifikasiModel = new PemeriksaanKlasifikasiModel();
    $this->tindakanModel = new TindakanModel();
    $this->pemeriksaanTindakanModel = new PemeriksaanTindakanModel();
  }

  public function getAllPemeriksaan()
  {
    $data = $this->pemeriksaanModel->findAll();
    return $this->respond($data, 200);
  }

  public function getPemeriksaan($id){
    $data = $this->pemeriksaanModel
    ->where("idPasien", $id)
    ->findAll();
    return $this->respond($data, 200);
  }

  public function getPemeriksaanDetail($id){
    $data = $this->pemeriksaanModel
    ->join('mtbs_pasien', 'mtbs_pemeriksaan.idPasien = mtbs_pasien.idPasien')
    ->where("idPemeriksaan", $id)
    ->findAll();
    return $this->respond($data, 200);
  }

  public function getPemeriksaanKlasifikasi($id){
    $data = $this->pemeriksaanModel
    ->select('namaKlasifikasi, status, idPenyakit')
    ->join('mtbs_pemeriksaan_klasifikasi', 'mtbs_pemeriksaan.idPemeriksaan = mtbs_pemeriksaan_klasifikasi.idPemeriksaan')
    ->join('mtbs_klasifikasi', 'mtbs_pemeriksaan_klasifikasi.idKlasifikasi = mtbs_klasifikasi.idKlasifikasi')
    ->where("mtbs_pemeriksaan.idPemeriksaan", $id)
    ->findAll();
    return $this->respond($data, 200);
  }

  public function getPemeriksaanTindakan($id){
    $data = $this->pemeriksaanModel
    ->select('namaTindakan, idPenyakit')
    ->join('mtbs_pemeriksaan_tindakan', 'mtbs_pemeriksaan.idPemeriksaan = mtbs_pemeriksaan_tindakan.idPemeriksaan')
    ->join('mtbs_tindakan', 'mtbs_pemeriksaan_tindakan.idTindakan = mtbs_tindakan.idTindakan')
    ->where("mtbs_pemeriksaan.idPemeriksaan", $id)
    ->findAll();
    return $this->respond($data, 200);
  }

  public function createPemeriksaan()
  {
    $data = [
      'tanggalPemeriksaan' => $this->request->getPost('tanggalPemeriksaan'),
      'suhu' => $this->request->getPost('suhu'),
      'beratBadan' => $this->request->getPost('beratBadan'),
      'tinggiBadan' => $this->request->getPost('tinggiBadan'),
      'kunjungan' => $this->request->getPost('kunjungan'),
      'keluhan' => $this->request->getPost('keluhan'),
      'idPasien' => $this->request->getPost('idPasien'),
      'idPerawat' => $this->request->getPost('idPerawat'),
      'idPuskesmas' => $this->request->getPost('idPuskesmas'),
    ];
    $this->pemeriksaanModel->insert($data);
    return $this->respond("Successfully Insert Pemeriksaan", 201);
  }

  public function akhiriPemeriksaan(){
    $data = json_decode($this->request->getBody());
    $idPasien = $data->dataAnak->idAnak;
    $kunjungan = 0;
    $jenisKelamin = 1;
    if($data->dataAnak->jenisKelamin != true){
      $jenisKelamin = 0;
    }
    if($idPasien == null){
      $anak = [
        'namaIbu' => $data->dataAnak->namaIbu,
        'namaAnak' =>  $data->dataAnak->namaAnak,
        'jenisKelamin' => $jenisKelamin,
        'tanggalLahir' =>  $data->dataAnak->tglLahir,
        'provinsi' =>  $data->dataAnak->provinsiAnak,
        'kota' => $data->dataAnak->kotaAnak,
        'alamat' => $data->dataAnak->alamatAnak,
        'rt' => $data->dataAnak->rtAnak,
        'rw' => $data->dataAnak->rwAnak,
        'kelurahanDesa' => $data->dataAnak->kelDesAnak,
        'kecamatan' => $data->dataAnak->kecamatanAnak
      ];
      $this->pasienModel->insert($anak);
      $idPasien = $this->pasienModel->getInsertID();
    }
    else{
      $kunjungan = $this->pemeriksaanModel->getKunjungan($idPasien);
    }
    $pemeriksaan = [
      'tanggalPemeriksaan' => $data->dataAnak->tglKunjungan,
      'suhu' => $data->dataAnak->suhuAnak,
      'beratBadan' => $data->dataAnak->beratAnak,
      'tinggiBadan' => $data->dataAnak->tinggiAnak,
      'kunjungan' => $kunjungan+1,
      'keluhan' => $data->dataAnak->keluhanAwal,
      'idPasien' => $idPasien,
      'idPerawat' => 1,
      'idPuskesmas' => 1
    ];
    $this->pemeriksaanModel->insert($pemeriksaan);
    $idPemeriksaan = $this->pemeriksaanModel->getInsertID();
    $this->handleTBU($idPemeriksaan, $data);
    $this->handleBatuk($idPemeriksaan, $data);
    $this->handleDiare($idPemeriksaan, $data);
    $this->handleDemam($idPemeriksaan, $data);
    $this->handleTelinga($idPemeriksaan, $data);
    $this->handleGizi($idPemeriksaan, $data);
    $this->handleAnemia($idPemeriksaan, $data);
    $this->handleHIV($idPemeriksaan, $data);
    return $this->respond(['message'=> $idPasien], 200);
  }

  public function handleTBU($idPemeriksaan, $data){
    if($data->klasifikasiTBU->tbu_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
      ->where('namaKlasifikasi', $data->klasifikasiTBU->tbu_klasifikasi)
      ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_tbu;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 1)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 1
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleBatuk($idPemeriksaan, $data){
    if($data->klasifikasiBatuk->bsb_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $data->klasifikasiBatuk->bsb_klasifikasi)
        ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_batuk;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 2)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 2
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleDiare($idPemeriksaan, $data){
    if($data->klasifikasiDiare->diare_klasifikasi != ""){
      $klasifikasiDiare = explode("\n", $data->klasifikasiDiare->diare_klasifikasi);
      foreach ($klasifikasiDiare as &$value) {
        $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $value)
        ->findColumn('idKlasifikasi');
        $pemeriksaanKlasifikasi = [
          'idPemeriksaan' => $idPemeriksaan,
          'idKlasifikasi' => $idKlasifikasi[0]
        ];
        $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      }
      $tindakan = $data->tindakan->tindakan_diare;
        foreach($tindakan as &$value){
          $tmp = str_replace("\\", "", $value);
          $idTindakan = $this->tindakanModel
          ->where('namaTindakan', $tmp)
          ->where('idPenyakit', 3)
          ->findColumn('idTindakan');
          if($idTindakan == null){
            $newTindakan = [
              'namaTindakan' => $tmp,
              'idPenyakit' => 3
            ];
            $this->tindakanModel->insert($newTindakan);
            $newIdTindakan = $this->tindakanModel->getInsertID();
            $pemeriksaanTindakan = [
              'idPemeriksaan' => $idPemeriksaan,
              'idTindakan' => $newIdTindakan
            ];
            $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
          }
          else{
            $pemeriksaanTindakan = [
              'idPemeriksaan' => $idPemeriksaan,
              'idTindakan' => $idTindakan
            ];
            $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
          }
        }
    }
  }

  public function handleDemam($idPemeriksaan, $data){
    if($data->klasifikasiDemam->demam_klasifikasi != ""){
      $klasifikasiDemam = explode("\n", $data->klasifikasiDemam->demam_klasifikasi);
      foreach ($klasifikasiDemam as &$value) {
        $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $value)
        ->findColumn('idKlasifikasi');
        $pemeriksaanKlasifikasi = [
          'idPemeriksaan' => $idPemeriksaan,
          'idKlasifikasi' => $idKlasifikasi[0]
        ];
        $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      }
      $tindakan = $data->tindakan->tindakan_demam;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 4)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 4
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleTelinga($idPemeriksaan, $data){
    if($data->klasifikasiTelinga->telinga_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $data->klasifikasiTelinga->telinga_klasifikasi)
        ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_telinga;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 5)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 5
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleGizi($idPemeriksaan, $data){
    if($data->klasifikasiGizi->gizi_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $data->klasifikasiGizi->gizi_klasifikasi)
        ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_gizi;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 6)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 6
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleAnemia($idPemeriksaan, $data){
    if($data->klasifikasiAnemia->anemia_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $data->klasifikasiAnemia->anemia_klasifikasi)
        ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_anemia;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 7)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 7
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }

  public function handleHIV($idPemeriksaan, $data){
    if($data->klasifikasiHIV->hiv_klasifikasi != ""){
      $idKlasifikasi = $this->klasifikasiModel
        ->where('namaKlasifikasi', $data->klasifikasiHIV->hiv_klasifikasi)
        ->findColumn('idKlasifikasi');
      $pemeriksaanKlasifikasi = [
        'idPemeriksaan' => $idPemeriksaan,
        'idKlasifikasi' => $idKlasifikasi[0]
      ];
      $this->pemeriksaanKlasifikasiModel->insert($pemeriksaanKlasifikasi);
      $tindakan = $data->tindakan->tindakan_hiv;
      foreach($tindakan as &$value){
        $tmp = str_replace("\\", "", $value);
        $idTindakan = $this->tindakanModel
        ->where('namaTindakan', $tmp)
        ->where('idPenyakit', 8)
        ->findColumn('idTindakan');
        if($idTindakan == null){
          $newTindakan = [
            'namaTindakan' => $tmp,
            'idPenyakit' => 8
          ];
          $this->tindakanModel->insert($newTindakan);
          $newIdTindakan = $this->tindakanModel->getInsertID();
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $newIdTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
        else{
          $pemeriksaanTindakan = [
            'idPemeriksaan' => $idPemeriksaan,
            'idTindakan' => $idTindakan
          ];
          $this->pemeriksaanTindakanModel->insert($pemeriksaanTindakan);
        }
      }
    }
  }
}
