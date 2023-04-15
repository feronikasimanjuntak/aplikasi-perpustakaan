<!DOCTYPE html>
<html>
<head>
  <title>Barcode</title>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-lg-12" style="margin-top: 15px ">
        <div class="pull-left">
          <h2>Data Peminjaman Buku Perpustakaan Lumban Dolok</h2>
        </div>

      </div>
    </div><br>

    <table class="table table-bordered" border="1">
      <thead>
        <tr>
          <th>No</th>
          <th>Nama Buku</th>
          <th>Nama Kategori</th>
          <th>Nama Pengarang</th>
          <th>Nama Penerbit</th>
          <th>Jumlah Halaman</th>
          <th>Tahun Terbit</th>
          <th>Foto</th>
          <th>Edisi Buku</th>
          <th>Jumlah buku</th>
        </tr>
      </thead>
      <tbody>
      <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>    
      <tr>
        <td><?php echo e($i+1); ?></td>
        <td><?php echo e($item->judul); ?></td>
        <td><?php echo e($item->category->nama_kategori); ?></td>
        <td><?php echo e($item->pengarang); ?></td>
        <td><?php echo e($item->penerbit); ?></td>
        <td><?php echo e($item->jumlah_halaman); ?></td>
        <td><?php echo e($item->tahun_terbit); ?></td>
        <td><img src="<?php echo e(public_path('storage/'.$item->foto)); ?>" style="max-width:200px;max-height:200px;"></td>
        <td><?php echo e($item->edisi_buku); ?></td>
        <td><?php echo e($item->jumlah_buku); ?></td>
      </tr>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </tbody>
    </table>
  </div>
</body>
</html><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/book/pdf.blade.php ENDPATH**/ ?>