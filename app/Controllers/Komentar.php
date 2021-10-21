<?php

namespace App\Controllers;

use CodeIgniter\Config\BaseConfig;
use phpDocumentor\Reflection\Types\This;
use TCPDF;

class Komentar extends BaseController {
    
    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        $this->session = session();
    }

    public function create()
    {
        $id_barang = $this->request->uri->getSegment(3);
        $model = new \App\Models\KomentarModel();

        if ($this->request->getPost()) {
            $data = $this->request->getPost();
            $this->validation->run($data, 'komentar');
            $errors = $this->validation->getErrors();

            if (!$errors) {
                $komentarEntity = new \App\Entities\Komentar();
                $komentarEntity->fill($data);
                
                $komentarEntity->created_by = $this->session->get('id');
                $komentarEntity->creared_date = date("Y-m-d H:i:s");

                $model->save($komentarEntity);

                $segments = ['etalase', 'beli', $id_barang];

                return redirect()->to(site_url($segments));
            }
        }

        return view('komentar/create', [
            'id_barang' => $id_barang,
            'model'     => $model,
        ]);
    }
    
    public function delete()
    {
        $id = $this->request->uri->getSegment(3);
        $id_barang = $this->request->uri->getSegment(4);
        $komentarModel = new \App\Models\KomentarModel();
        $delete = $komentarModel->delete($id);

        return redirect()->to('etalase/beli/'.$id_barang);
    }
    
}
?>