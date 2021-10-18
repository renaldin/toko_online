<?php

namespace App\Controllers;

use CodeIgniter\Config\BaseConfig;
use phpDocumentor\Reflection\Types\This;

class User extends BaseController {
    
    public function __construct()
    {
        $this->session = session();
    }

    public function index()
    {
        $model = new \App\Models\UserModel();

        $data = [
            'users'  => $model->paginate(10),
            'pager'     => $model->pager,
        ];

        return view('user/index', [
            'data' => $data,
        ]);
    }
}