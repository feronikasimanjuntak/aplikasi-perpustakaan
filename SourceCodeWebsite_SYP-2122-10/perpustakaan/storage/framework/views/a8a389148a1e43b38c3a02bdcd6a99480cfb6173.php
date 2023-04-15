<div class="modal-header">
    <h5 class="modal-title" id="bookModal">Masukan Data Kategori</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <form class="user" id="form_input">
        <div class="form-group">
            <input id="name" type="text" class="form-control form-control-user " name="nama" value="<?php echo e($bookCategory->nama_kategori); ?>" required autocomplete="name" autofocus placeholder="Nama Kategori...">
        </div>
        <div class="form-group">
        <input id="deskripsi" type="text" class="form-control form-control-user"  name="deskripsi" value="<?php echo e($bookCategory->deskripsi); ?>" required autocomplete="deskripsi" placeholder="Deskripsi Kategori...">
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
            <?php if($bookCategory->id): ?>
                <button type="button" id="tombol_simpan" onclick="save_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.book-category.update',$bookCategory->id)); ?>','#bookModal','PATCH')" class="btn btn-primary">Simpan Perubahan</button>
            <?php else: ?>
                <button type="button" id="tombol_simpan" onclick="save_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.book-category.store')); ?>','#memberModal','POST')" class="btn btn-primary">Simpan</button>
            <?php endif; ?>
        </div>
    </form>
</div><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/category/modal.blade.php ENDPATH**/ ?>