<?php

namespace Config;

use CodeIgniter\Validation\CreditCardRules;
use CodeIgniter\Validation\FileRules;
use CodeIgniter\Validation\FormatRules;
use CodeIgniter\Validation\Rules;

class Validation
{
	//--------------------------------------------------------------------
	// Setup
	//--------------------------------------------------------------------

	/**
	 * Stores the classes that contain the
	 * rules that are available.
	 *
	 * @var string[]
	 */
	public $ruleSets = [
		Rules::class,
		FormatRules::class,
		FileRules::class,
		CreditCardRules::class,
	];

	/**
	 * Specifies the views that are used to display the
	 * errors.
	 *
	 * @var array<string, string>
	 */
	public $templates = [
		'list'   => 'CodeIgniter\Validation\Views\list',
		'single' => 'CodeIgniter\Validation\Views\single',
	];

	//--------------------------------------------------------------------
	// Rules
	//--------------------------------------------------------------------
	public $register = [
		'username'	=> [
			'rules'	=> 'required|min_length[5]',
		],
		'password'	=> [
			'rules'	=> 'required',
		],
		'repeatPassword' => [
			'rules'	=> 'required|matches[password]',
		],
	];

	public $register_errors = [
		'username'	=> [
			'required'	=> '{field} harus diisi!',
			'min_length'=> '{field} minimal 5 karakter',
		],
		'password'	=> [
			'required'	=> '{field} harus diisi',
		],
		'repeatPassword' => [
			'required'	=> '{field} harus diisi',
			'matches'	=> '{field} narus sama dengan password',
		]
	];

	public $login = [
		'username'	=> [
			'required'	=> '{field} harus diisi!',
			'min_length'=> '{field} minimal 5 karakter',
		],
		'password'	=> [
			'required'	=> '{field} harus diisi',
		]
	];

	public $login_errors = [
		'username'	=> [
			'required'	=> '{field} harus diisi!',
			'min_length'=> '{field} minimal 5 karakter',
		],
		'password'	=> [
			'required'	=> '{field} harus diisi',
		],
	];

	public $barang = [
		'nama'		=> [
			'rules'	=> 'required|min_length[2]',
		],
		'harga'		=> [
			'rules'	=> 'required|is_natural',
		],
		'stok'		=> [
			'rules'	=> 'required|is_natural',
		],
		'gambar'	=> [
			'rules'	=> 'uploaded[gambar]',
		],
	];

	public $barang_errors = [
		'nama' => [
			'required'	=> '{field} harus diisi',
			'min_length'=> '{field} minimum 2 karakter',
		],
		'harga'=> [
			'required'	=> '{field} harus diisi',
			'is_natural'=> '{field} tidak boleh negatif',
		],
		'stok'	=> [
			'required'	=> '{field} harus diisi',
			'is_natural'=> '{field} tidak boleh negatif',
		],
		'gambar'	=> [
			'uploaded' => '{field} haurs diisi',
		]
	];
}
