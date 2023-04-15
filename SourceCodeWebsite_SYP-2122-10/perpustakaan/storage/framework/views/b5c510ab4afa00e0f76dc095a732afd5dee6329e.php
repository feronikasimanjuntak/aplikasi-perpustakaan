<?php if($collection->count() > 0): ?>
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
            <tr>
            <th>No</th>
            <th>Nama Karyawan</th>
            <th>Email</th>
            <th>No Telp</th>
            <th>Bergabung Pada</th>
            <?php if(Auth::user()->role == "superadmin"): ?>
            <th>Edit Data</th>
            <th>Hapus Data</th>
            <?php endif; ?>
            </tr>
        </thead>
        <tbody>
            <?php
                $i = 1;
            ?>
            <?php $__currentLoopData = $collection; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if($user->name == Auth::user()->name): ?>
                <td><b><?php echo e($collection->firstItem() + $i); ?></b></td>
                <td class="text-capitalize"> <b><?php echo e($user->name); ?></b></td>
                <td><b><?php echo e($user->email); ?></b></td>
                <td><b><?php echo e($user->no_hp); ?></b></td>
                <td><b><?php echo e($user->created_at->isoFormat('dddd, D MMMM Y')); ?></b></td>
            <?php else: ?>
            <tr>
                <td><?php echo e($collection->firstItem() + $i); ?></td>
                <td class="text-capitalize"><?php echo e($user->name); ?></td>
                <td><?php echo e($user->email); ?></td>
                <td><?php echo e($user->no_hp); ?></td>
                <td><?php echo e($user->created_at->isoFormat('dddd, D MMMM Y')); ?></td>
                <?php if(Auth::user()->role == "superadmin"): ?>
                    <td>
                        <a href="javascript:void(0)" onclick="handle_open_modal('<?php echo e(route('office.employee.edit',$user->id)); ?>','#employeeModal','#contentEmployeeModal')"class="btn btn-warning btn-icon-split btn-sm">
                            <span class="icon text-white-50">
                                <i class="fas fa-pen"></i>
                            </span>
                            <span class="text">Ubah</span>
                        </a>
                    </td>
                    <td>
                        <a href="javascript:void(0);" onclick="handle_delete('<?php echo e(route('office.employee.destroy',$user->id)); ?>')" class="btn btn-danger btn-icon-split btn-sm">
                            <span class="icon text-white-50">
                                <i class="fas fa-trash"></i>
                            </span>
                            <span class="text">Hapus</span>
                        </a>
                    </td>
                <?php endif; ?>
            </tr>
            <?php endif; ?>
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
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/employee/list.blade.php ENDPATH**/ ?>