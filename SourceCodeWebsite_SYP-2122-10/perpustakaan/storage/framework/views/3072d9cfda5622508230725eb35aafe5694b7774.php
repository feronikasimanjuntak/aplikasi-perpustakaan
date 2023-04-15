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
          <th>Nama Peminjam</th>
          <th>Tanggal Peminjaman</th>
          <th>Tanggal Pengembalian</th>
          <th>Status Peminjaman</th>
        </tr>
      </thead>
      <?php
      $i = 1;
      ?>
      <tbody>
      <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>    
      <tr>
        <td><?php echo e($i++); ?></td>
        <td><?php echo e($item->judul); ?></td>
        <td><?php echo e($item->user->name); ?></td>
        <td><?php echo e(Carbon\Carbon::parse($item->tangal_pinjam)->format('Y-m-d')); ?></td>
        <?php if(!$item->tanggal_pengembalian): ?>
        <td>NULL</td>
        <?php else: ?>
        <td><?php echo e(Carbon\Carbon::parse($item->tanggal_pengembalian)->format('Y-m-d')); ?></td>            
        <?php endif; ?>
        <td><?php echo e($item->st); ?></td>
      </tr>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </tbody>
    </table>
  </div>
</body>
</html><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/borrow/pdf.blade.php ENDPATH**/ ?>