<?php if($collection->count() > 0): ?>
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Peminjam</th>
            <th>Tanggal Peminjaman</th>
            <th>Status</th>
            <th>Lihat Data</th>
            <th>Konfirmasi Data</th>
            <th>Hapus Data</th>
          </tr>
        </thead>
        <tbody>
          <?php
            $j = 0;
          ?>
          <tr>
          <?php $__currentLoopData = $collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $peminjaman): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
          <td><?php echo e($collection->firstItem() + $i); ?></td>
          <td class="text-capitalize"><?php echo e($peminjaman->user->name); ?></td>
          <td class="text-capitalize"><?php echo e($peminjaman->tanggal); ?></td>
          <th class="text-capitalize"><?php echo e($peminjaman->st); ?></th>
          <td>
          <a href="javascript:;" id="tombol-hapus" type="button" onclick="load_input('<?php echo e(route('office.borrow.show',$peminjaman->id)); ?>');" class="btn btn-info btn-icon-split btn-sm">
              <span class="icon text-white-50">
                  <i class="fas fa-eye"></i>
              </span>
              <span class="text">Lihat</span>
          </a>
        </td>
        <td>
          <?php if($peminjaman->st == 'menunggu'): ?>
            <a href="javascript:;" id="tombol-confirm" type="button" onclick="handle_confirm('<?php echo e(route('office.user-borrow.confirm',$peminjaman->id)); ?>');" class="btn btn-success btn-icon-split btn-sm">
              <span class="icon text-white-50">
                  <i class="fas fa-check"></i>
              </span>
              <span class="text">Konfirmasi Peminjaman</span>
          <?php elseif($peminjaman->st == 'dikonfirmasi peminjaman'): ?>
          <a href="javascript:;" id="tombol-confirm" type="button" onclick="handle_confirm('<?php echo e(route('office.user-borrow.borrowed',$peminjaman->id)); ?>');" class="btn btn-primary btn-icon-split btn-sm">
            <span class="icon text-white-50">
                <i class="fas fa-check"></i>
            </span>
            <span class="text">Dipinjam</span>
          </a>
          <?php elseif($peminjaman->st == 'menunggu perpanjangan'): ?>
          <a href="javascript:;" id="tombol-confirm" type="button" onclick="handle_confirm('<?php echo e(route('office.user-borrow.acc',$peminjaman->id)); ?>');" class="btn btn-primary btn-icon-split btn-sm">
            <span class="icon text-white-50">
                <i class="fas fa-check"></i>
            </span>
            <span class="text">Setujui Perpanjangan</span>
          </a>
          <?php elseif($peminjaman->st == 'dikonfirmasi pengembalian'): ?>
          <a href="javascript:;" id="tombol-confirm" type="button" onclick="handle_confirm('<?php echo e(route('office.user-borrow.return',$peminjaman->id)); ?>');" class="btn btn-primary btn-icon-split btn-sm">
            <span class="icon text-white-50">
                <i class="fas fa-check"></i>
            </span>
            <span class="text">Konfirmasi Pengembalian</span>
          </a>
          <?php else: ?>
            <span class="text">Tidak ada konfirmasi</span>
          <?php endif; ?>
          </td>
          <td>
            <a href="javascript:;" id="tombol-hapus" type="button"  onclick="handle_delete('<?php echo e(route('office.borrow.destroy',$peminjaman->id)); ?>');" class="btn btn-danger btn-icon-split btn-sm">
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
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/userBorrow/list.blade.php ENDPATH**/ ?>