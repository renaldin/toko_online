<?php

namespace App\Controllers;

use CodeIgniter\Config\BaseConfig;
use phpDocumentor\Reflection\Types\This;

class Auth extends BaseController {
    
    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        $this->session = session();
    }
    
    
    public function register()
    {
        if ($this->request->getPost()) {
            // Validasi data yang dipost
            $data = $this->request->getPost();
            $validate = $this->validation->run($data, 'register');
            $errors = $this->validation->getErrors();

            // Jika tidak ada error
            if (!$errors) {
                $userModel = new \App\Models\UserModel();
                $user = new \App\Entities\User();

                $user->username = $this->request->getPost('username');
                $user->password = $this->request->getPost('password');
                $user->created_by = 0;
                $user->created_date = date("Y-m-d H:i:s");

                $userModel->save($user);

                return view('login');
            }

            $this->session->setFlashdata('errors', $errors);
        }

        return view('register');
    }

    public function login()
    {
        if ($this->request->getPost()) {
            $data = $this->request->getPost();
            // $validate = $this->validation->run($data, 'login');
            $errors = $this->validation->getErrors();

            if ($errors) {
                return view('login');
            }

            $userModel = new \App\Models\UserModel();

            $username = $this->request->getPost('username');
            $password = $this->request->getPost('password');

            $user = $userModel->where('username', $username)->first();
            if ($user) {
                $salt = $user->salt;
                if ($user->password !== md5($salt.$password)) {
                    $this->session->setFlashdata('errors', ['Password salah']);
                } else {
                    $sessData = [
                        'username'  => $user->username,
                        'id'        => $user->id,
                        'isLoggedIn'=> TRUE
                    ];

                    $this->session->set($sessData);

                    return redirect()->to(site_url('home/index'));
                }
            } else {
                $this->session->setFlashdata('errors', ['User tidak ditemukan']);
            }
        }
        return view('login');
    }

    public function logout()
    {
        $this->session->destroy();
        return redirect()->to(site_url('auth/login'));
    }
}


?>