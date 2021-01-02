<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\PasienModel;
use CodeIgniter\HTTP\Response;

class Pasien extends ResourceController
{
  use ResponseTrait;
  public function index()
  {
    $model = new PasienModel();
    $data = $model->findAll();
    return $this->respond($data, 200);
  }

  public function show($id = null)
  {
    $model = new PasienModel();
    $data = $model->getWhere(['idPasien' => $id])->getResult();
    if ($data) {
      return $this->respond($data);
    } else {
      return $this->failNotFound('No Data Found with id ' . $id);
    }
  }

  public function michCupu()
  {
    $data = array('nama' => 'mich');
    return $this->setResponseFormat('json')->respond($data);
  }

  // public function create()
  // {
  //   $model = new PasienModel();
  //   $data = [
  //     'product_name' => $this->request->getPost('product_name'),
  //     'product_price' => $this->request->getPost('product_price')
  //   ];
  //   $data = json_decode(file_get_contents("php://input"));
  //   $model->insert($data);
  //   $response = [
  //     'status'   => 201,
  //     'error'    => null,
  //     'messages' => [
  //       'success' => 'Data Saved'
  //     ]
  //   ];

  //   return $this->respondCreated($data, 201);
  // }

  // public function update($id = null)
  // {
  //     $model = new ProductModel();
  //     $json = $this->request->getJSON();
  //     if($json){
  //         $data = [
  //             'product_name' => $json->product_name,
  //             'product_price' => $json->product_price
  //         ];
  //     }else{
  //         $input = $this->request->getRawInput();
  //         $data = [
  //             'product_name' => $input['product_name'],
  //             'product_price' => $input['product_price']
  //         ];
  //     }
  //     // Insert to Database
  //     $model->update($id, $data);
  //     $response = [
  //         'status'   => 200,
  //         'error'    => null,
  //         'messages' => [
  //             'success' => 'Data Updated'
  //         ]
  //     ];
  //     return $this->respond($response);
  // }

  // public function delete($id = null)
  // {
  //     $model = new ProductModel();
  //     $data = $model->find($id);
  //     if($data){
  //         $model->delete($id);
  //         $response = [
  //             'status'   => 200,
  //             'error'    => null,
  //             'messages' => [
  //                 'success' => 'Data Deleted'
  //             ]
  //         ];

  //         return $this->respondDeleted($response);
  //     }else{
  //         return $this->failNotFound('No Data Found with id '.$id);
  //     }

  // }
}
