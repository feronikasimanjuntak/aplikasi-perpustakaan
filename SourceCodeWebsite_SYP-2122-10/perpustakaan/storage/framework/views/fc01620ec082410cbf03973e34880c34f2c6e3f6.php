<?php if($collection->count() > 0): ?>
<div class="row">
    <?php $__currentLoopData = $collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $kategori): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Kategori <?php echo e($kategori->nama_kategori); ?></div>
                <?php
                    $i = 1;
                ?>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo e($buku = \App\Models\Book::where('kategori_id', '=', $kategori->id)->count()); ?> Buku</div>
                <?php
                $i++
                ?>
                <a href="<?php echo e(route('office.books.index',$kategori->id)); ?>" class="mt-3 btn btn-secondary btn-sm btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-arrow-right"></i>
                    </span>
                <span class="text">Lihat Detail</span>
                </a>
                </div>
                <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                </div>
                </div>
            </div>
            </div>
        </div> 
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
<?php endif; ?>
<?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/group-category/list.blade.php ENDPATH**/ ?>