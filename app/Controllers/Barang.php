<?php

namespace App\Controllers;

use CodeIgniter\Config\BaseConfig;
use phpDocumentor\Reflection\Types\This;

class Barang extends BaseController {
    
    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        $this->session = session();
    }

    public function index()
    {
        return view('barang/index');
    }

    public function view()
    {

    }

    public function create()
    {
        return view('barang/create');
    }

    public function update()
    {

    }

    public function delete()
    {
        
    }
}

?>