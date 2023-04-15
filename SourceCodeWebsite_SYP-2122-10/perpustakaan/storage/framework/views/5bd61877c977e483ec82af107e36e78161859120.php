<?php if (isset($component)) { $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274 = $component; } ?>
<?php $component = $__env->getContainer()->make(App\View\Components\OfficeLayout::class, ['title' => 'Data Admin']); ?>
<?php $component->withName('OfficeLayout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
    <div class="table-responsive">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Data Profil</h1>
            <p class="mb-4">Berikut merupakan data profil anda</p>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Data Profil 2.0</h6>
                </div>
                <div class="card-body">  
                    <div class="text-center px-4 mb-3">
                        <form class="form-group" id="form_input">
                            <div class="form-group">
                                <label for="name" class="labeled-form">Nama</label>
                                <input id="name" type="text" class="form-control form-control-user " name="name" 
                                value="<?php echo e($profile->name); ?>" 
                                autocomplete="name" autofocus placeholder="Nama Anda...">
                            </div>
                            <div class="form-group">
                                <label for="name" class="labeled-form">Alamat</label>
                                <textarea name="alamat" id="alamat"  class="form-control form-control-user" cols="20" rows="3" ><?php echo e($profile->alamat); ?></textarea>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="name" class="labeled-form">Email</label>
                                    <input id="email" type="email" class="form-control form-control-user"  name="email" 
                                    value="<?php echo e($profile->email); ?>" 
                                    autocomplete="email" placeholder="Email...">
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="name" class="labeled-form">No Telpon</label>
                                    <input id="no_telp" type="text" class="form-control form-control-user " name="no_hp" value="<?php echo e($profile->no_hp); ?>" autocomplete="no_hp" placeholder="No Telepon...">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label for="name" class="labeled-form">Password</label>
                                    <input type="password" name="password" id="password" class="form-control form-control-user" placeholder="Password ...">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="tombol_simpan" onclick="handle_save('#tombol_simpan','#form_input','<?php echo e(route('office.admin.store')); ?>','POST')" class="btn btn-primary">Simpan Perubahan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $__env->startSection('custom_js'); ?>
        <script type="text/javascript">
            $(document).ready(function(){
                $(document).on('click', '.page-link', function(event){
                    event.preventDefault(); 
                    var page = $(this).attr('href').split('page=')[1];
                    fetch_data(page);
                });

                function fetch_data(page)
                {
                    $.ajax({
                    url:"?page="+page,
                    success:function(data){
                        $('#list_result').html(data);
                    }
                    });
                }
            });
        </script>
    <?php $__env->stopSection(); ?>
    <?php $__env->startSection('custom_css'); ?>
    <style>
        .labeled-form{
            float: left;
            display: inline;
            color:black;
            border: 5px black
        }
    </style>    
<?php $__env->stopSection(); ?>
 <?php if (isset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274)): ?>
<?php $component = $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274; ?>
<?php unset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/profile/main.blade.php ENDPATH**/ ?>