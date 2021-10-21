<?php 
  $session = session();
?>
<nav class="navbar navbar-expand-md navbar-dark bg-success fixed-top">
  <a class="navbar-brand" href="#">REY SHOP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <?php if($session->get('isLoggedIn')) : ?>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<?= site_url('home/index'); ?>">Home <span class="sr-only">(current)</span></a>
      </li>
      <?php if (session()->get('role') == 0) : ?>
      <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Barang</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a href="<?= site_url('barang/index'); ?>" class="dropdown-item">List Barang</a>
          <a href="<?= site_url('barang/create'); ?>" class="dropdown-item">Tambah Barang</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?= site_url('transaksi/index'); ?>">Transaksi </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?= site_url('user/index'); ?>">User </a>
      </li>
      <?php else: ?>
      <li class="nav-item">
        <a class="nav-link" href="<?= site_url('etalase/index'); ?>">Etalase </a>
      </li>
      <?php endif; ?>
    </ul>
    <?php endif; ?>
    <div class="form-inline my-2 my-lg-0">
      <ul class="navbar-nav mr-auto">
        <?php if($session->get('isLoggedIn')) : ?>
          <li class="nav-item">
            <a href="<?= site_url('auth/logout'); ?>" class="btn btn-success">Logout</a>
        </li>
        <?php else : ?>
        <li class="nav-item">
            <a href="<?= site_url('auth/login'); ?>" class="btn btn-success">Login</a>
        </li>
        <li class="nav-item">
            <a href="<?= site_url('auth/register'); ?>" class="btn btn-success">Register</a>
        </li>
        <?php endif; ?>
      </ul>
    </div>
  </div>
</nav>