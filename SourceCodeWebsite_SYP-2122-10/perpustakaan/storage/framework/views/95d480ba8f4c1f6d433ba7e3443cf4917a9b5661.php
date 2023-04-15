<div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Data Peminjaman</h1>
        <p class="mb-4">Berikut merupakan data peminjaman buku perpustakaan Lumban Dolok</p>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Manajemen Peminjaman 1.0.1</h6>
            </div>
            <div class="card-body">
              <a href="javascript:void(0);" onclick="load_list(1);" class="btn btn-primary mb-3 btn-icon-split btn-sm" >
                <span class="icon text-white-50">
                    <i class="fas fa-arrow-left"></i>
                </span>
                <span class="text">Kembali</span>
            </a>
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Judul Buku</th>
                      <th>Kategori Buku</th>
                      <th>Tanggal Peminjaman</th>
                      <th>Dikembalikan Tanggal</th>
                      <th>Lama Peminjaman</th>
                      <th>Denda</th>
                      <th>Diterima Oleh</th>
                      <th>Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $__currentLoopData = $detail; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $borrowDetail): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                    <td><?php echo e($i+1); ?></td>
                    <td class="text-capitalize"><?php echo e($borrowDetail->books->judul); ?></td>
                      <td class="text-capitalize"><?php echo e($borrowDetail->books->category->nama_kategori); ?></td>
                      <th class="text-capitalize"><?php echo e($borrowDetail->tanggal_pinjam); ?></th>
                      <td class="text-capitalize"><?php echo e($borrowDetail->tanggal_pengembalian); ?></td>
                    
                    <?php if($borrowDetail->lama == null): ?>
                        <td class="text-center">-</td>
                    <?php else: ?>
                        <td><?php echo e($borrowDetail->lama); ?> Hari</td>
                    <?php endif; ?>
                    <td><?php echo e($borrowDetail->keadaan); ?> </td>
                    
                    <?php if($borrowDetail->updated_by == null): ?>
                        <td class="text-center">-</td>
                    <?php else: ?>
                         <td><?php echo e($borrowDetail->updated_by); ?> </td>
                    <?php endif; ?>
                      <td>
                        <?php if($borrowDetail->st == 'pending'): ?>
                          <a href="" id="tombol-hapus" type="button" class="btn btn-success btn-icon-split btn-sm">
                              <span class="icon text-white-50">
                                  <i class="fas fa-check"></i>
                              </span>
                              <span class="text">Konfirmasi</span>
                          </a>
                        <?php else: ?>

                        <?php endif; ?>
                        <a href="" id="tombol-hapus" type="button" class="btn btn-danger btn-icon-split btn-sm">
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
            </div>
        </div>
    </div><?php /**PATH C:\laragon\www\perpustakaan-l8-h\resources\views/pages/office/borrow/show.blade.php ENDPATH**/ ?>