<?php if($collection->count() > 0): ?>
  <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Kategori</th>
            <th>Deskripsi Kategori</th>
            <th>Dibuat Sejak</th>
            <th>Edit Data</th>
            <th>Hapus Data</th>
          </tr>
        </thead>
        <tbody>
          <?php $__currentLoopData = $collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $kategori): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
          <tr>
              <td><?php echo e($collection->firstItem() + $i); ?></td>
              <td><?php echo e($kategori->nama_kategori); ?></td>
              <td><?php echo e($kategori->deskripsi); ?></td>
              <td><?php echo e($kategori->created_at->diffForHumans()); ?></td>
              <td>
              <a href="javascript:void(0)" onclick="handle_open_modal('<?php echo e(route('office.book-category.edit',$kategori->id)); ?>','#bookModal','#contentBookModal')" class="btn btn-warning btn-icon-split btn-sm">
                      <span class="icon text-white-50">
                          <i class="fas fa-pen"></i>
                      </span>
                      <span class="text">Ubah</span>
                  </a>
            </td>
            <td>
              <a href="javascript:void(0);" onclick="handle_delete('<?php echo e(route('office.book-category.destroy',$kategori->id)); ?>')" class=" btn btn-danger btn-icon-split btn-sm">
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
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/category/list.blade.php ENDPATH**/ ?>