<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\PerawatModel;

class Login extends BaseController
{
  use ResponseTrait;

  public function validateUser()
  {
    $model = new PerawatModel();
    $username = $this->request->getPost('uname');
    $password = $this->request->getPost('password');
    $data = $model->where(['username' => $username])->first();
    if ($data) {
      if (password_verify($password, $data['password'])) {
        return $this->respond('Successfully Logged In.', 200);
      } else {
        return $this->fail('Invalid Username or Password.', 401);
      }
    } else {
      return $this->fail('Invalid Username or Password.', 401);
    }
  }
}
