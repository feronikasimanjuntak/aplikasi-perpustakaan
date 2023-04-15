<div class="table-responsive">
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Data Admin</h1>
        <p class="mb-4">Berikut merupakan data admin perpustakaan Lumban Dolok</p>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Data Admin 2.0</h6>
            </div>
            <div class="card-body">  
                <div class="text-center px-4 mb-3">
                    <form class="form-group" id="form_input">
                        <div class="form-group">
                            <label for="name" class="labeled-form">Nama</label>
                            <input id="name" type="text" class="form-control form-control-user " name="name" 
                            value="<?php echo e($admin->name); ?>" 
                            autocomplete="name" autofocus placeholder="Nama Admin...">
                        </div>
                        <div class="form-group">
                            <label for="name" class="labeled-form">Alamat</label>
                            <textarea name="alamat" id="alamat"  class="form-control form-control-user" cols="20" rows="3" ><?php echo e($admin->alamat); ?></textarea>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="name" class="labeled-form">Email</label>
                                <input id="email" type="email" class="form-control form-control-user"  name="email" 
                                value="<?php echo e($admin->email); ?>" 
                                autocomplete="email" placeholder="Email...">
                            </div>
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="name" class="labeled-form">No Telpon</label>
                                <input id="no_telp" type="text" class="form-control form-control-user " name="no_hp" value="<?php echo e($admin->no_hp); ?>" autocomplete="no_hp" placeholder="No Telepon...">
                            </div>
                        </div>
                        <div class="form-group row">
                            <?php if(!$admin->id): ?>
                                <div class="col-sm-6">
                                <label for="name" class="labeled-form">Password</label>
                                
                                <input type="password" name="password" id="password" class="form-control form-control-user" placeholder="Password ...">
                            <?php endif; ?>
                            </div>
                            <div class="col-sm-6">
                                <label for="name" class="labeled-form">Hak Akses</label>
                                <select class="form-control form-control-user" name="role" id="role">
                                    <option value="">Pilih</option>
                                    <option value="admin" <?php echo e($admin->role == 'admin' ? 'selected' : ''); ?>>Admin</option>
                                    <option value="superadmin" <?php echo e($admin->role == 'superadmin' ? 'selected' : ''); ?>>Superadmin</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="load_list(1)">Batal</button>
                            <?php if($admin->id): ?>
                            <button type="button" id="tombol_simpan" onclick="handle_save('#tombol_simpan','#form_input','<?php echo e(route('office.admin.update',$admin->id)); ?>','PATCH')" class="btn btn-primary">Simpan</button>
                            <?php else: ?>
                            <button type="button" id="tombol_simpan" onclick="handle_save('#tombol_simpan','#form_input','<?php echo e(route('office.admin.store')); ?>','POST')" class="btn btn-primary">Simpan Perubahan</button>
                            <?php endif; ?> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/admin/input.blade.php ENDPATH**/ ?>