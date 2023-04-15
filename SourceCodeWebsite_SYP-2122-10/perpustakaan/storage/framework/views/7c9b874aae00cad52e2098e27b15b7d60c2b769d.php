<?php if($collection->count() > 0): ?>
    <div class="table-responsive">
        <table class="table table-bordered" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>No</th>
              <th>Sampul Buku</th>
              <th>Judul Buku</th>
              <th>Nama Pengarang</th>
              <th>Nama Penerbit</th>
              <th>Jumlah Halaman</th>
              <th>Tahun Terbit</th>
              <th>Edisi Buku</th>
              <th>Jumlah Buku</th>
              <th>Diinput Pada</th>
              <th>Diinput Oleh</th>
              <th>Ubah</th>
              <th>Hapus</th>
            </tr>
          </thead>
          <tbody>
            <?php $__currentLoopData = $collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $book): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <tr>
                <td><?php echo e($collection->firstItem() + $i); ?></td>
                <td><img src="<?php echo e($book->image); ?>" style="max-width:200px;max-height:200px;"></td>
                <td><?php echo e($book->judul); ?></td>
                <td><?php echo e($book->pengarang); ?></td>
                <th><?php echo e($book->penerbit); ?></th>
                <td><?php echo e($book->jumlah_halaman); ?></td>
                <td><?php echo e($book->tahun_terbit); ?></td>
                <td><?php echo e($book->edisi_buku); ?></td>
                <td><?php echo e($book->jumlah_buku); ?></td>
                
                <td><?php echo e(date("Y-m-d", strtotime($book->created_at))); ?></td>
                <td><?php echo e($book->user->name); ?></td>
                <td>
                  <a href="javascript:void(0);" onclick="handle_open_modal('<?php echo e(route('office.books.edit',$book->id)); ?>','#bookModal','#contentBookModal');" class="btn btn-warning btn-icon-split btn-sm">
                    <span class="icon text-white-50">
                            <i class="fas fa-pen"></i>
                    </span>
                    <span class="text">Ubah</span>
                  </a>
                </td>
                <td>
                  <a href="javascript:void(0);" onclick="handle_delete('<?php echo e(route('office.books.destroy',$book->id)); ?>')" type="submit" class="btn btn-danger btn-icon-split btn-sm">
                    <span class="icon text-white-50">
                        <i class="fas fa-trash"></i>
                    </span>
                    <span class="text">Hapus</span>
                  </a>
                </td>
              </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
          </tbody>
        </table>
  </div>
  <?php echo e($collection->links('vendor.pagination.bootstrap-4')); ?>

<?php else: ?>
<div class="text-center px-4 mb-3">
  <h1>
      Data kosong
      <br>
  </h1>
  <img class="mw-100" src="<?php echo e(asset('offices/img/terms-1.png')); ?>" style="max-height:300px;">
</div>
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/book/list.blade.php ENDPATH**/ ?>