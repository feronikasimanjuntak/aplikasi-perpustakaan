<div class="modal-header">
    <h5 class="modal-title" id="memberModal">Masukan Data Anggota</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
    <form class="user" id="form_input">
            <div class="form-group">
               <input id="name" type="text" class="form-control form-control-user " name="name" value="<?php echo e($member->name); ?>" autocomplete="name" autofocus placeholder="Nama Anggota...">
            </div>
            <div class="form-group">
              <input id="alamat" type="text" class="form-control form-control-user"  name="alamat" value="<?php echo e($member->alamat); ?>" autocomplete="alamat" placeholder="Alamat Tinggal...">
            </div>
            <div class="form-group">
              <input id="email" type="email" class="form-control form-control-user"  name="email" value="<?php echo e($member->email); ?>" autocomplete="email" placeholder="Email...">
            </div>
            <div class="form-group row">
              <div class="col-sm-6 mb-3 mb-sm-0">
                 <input id="no_telp" type="text" class="form-control form-control-user " name="no_hp" value="<?php echo e($member->no_hp); ?>" autocomplete="no_hp" placeholder="No Telepon...">
              </div>
              <?php if(!$member->id): ?>
              <div class="col-sm-6">
                <input type="password" name="password" id="password" class="form-control form-control-user" placeholder="Password ...">
              </div>
              <?php endif; ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                <?php if($member->id): ?>
                  <button type="submit" id="tombol_simpan" onclick="save_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.member.update',$member->id)); ?>','#memberModal','PATCH')" class="btn btn-primary">Simpan Perubahan</button>
                <?php else: ?>
                  <button type="submit" id="tombol_simpan" onclick="save_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.member.store')); ?>','#memberModal','POST')" class="btn btn-primary">Simpan</button>
                <?php endif; ?>
            </div>
      </form>
  </div><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/member/modal.blade.php ENDPATH**/ ?>