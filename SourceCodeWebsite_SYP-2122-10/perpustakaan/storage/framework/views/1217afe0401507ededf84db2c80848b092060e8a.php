<div class="modal-header">
    <h5 class="modal-title" id="bookModal">Masukan Data Buku</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<div class="modal-body">
  <form class="user" id="form_input">
      <input type="hidden" name="id" value="<?php echo e($id ?? $book->kategori_id); ?>">
          <div class="form-group">
              <input id="name" type="text" class="form-control form-control-user " name="judul" value="<?php echo e($book->judul); ?>" placeholder="Judul Buku...">
          </div>
          <div class="form-group">
            <input id="pengarang" type="text" class="form-control form-control-user"  name="pengarang" value="<?php echo e($book->pengarang); ?>" placeholder="Nama Pengarang...">
          </div>
            <div class="form-group">
            <input id="penerbit" type="text" class="form-control form-control-user"  name="penerbit" value="<?php echo e($book->penerbit); ?>" placeholder="Nama Penerbit...">
          </div>
            <div class="form-group">
            <input type="text" class="form-control form-control-user"  name="jumlah_halaman" id="jumlah_halaman" value="<?php echo e($book->jumlah_halaman); ?>" placeholder="Jumlah Halaman...">
          </div>
          <div class="form-group">
              <input type="file" name="foto" id="foto" class="form-control br10 br10">
          </div>
          <div class="form-group">
                <input id="tahun_terbit" type="text" value="<?php echo e($book->tahun_terbit); ?>"class="form-control form-control-user" onblur="(this.type='text')" name="tahun_terbit" placeholder="Tahun Terbit...">
          </div>
          <div class="form-group br10">
            <select name="edisi_buku" id="edisi_buku" class="form-control br10">
                <option value="">Pilih Edisi</option>
                <option value="baru" <?php echo e($book->edisi_buku == 'baru' ? 'selected' : ''); ?>>Baru</option>
                <option value="bekas"<?php echo e($book->edisi_buku == 'bekas' ? 'selected' : ''); ?>>Bekas</option>
            </select>
          </div>
            <div class="form-group">
            <input id="jumlah_buku" type="text" class="form-control form-control-user"  name="jumlah_buku" value="<?php echo e($book->jumlah_buku); ?>" placeholder="Jumlah Buku...">
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
              <?php if($book->id): ?>
                  <button type="submit" class="btn btn-primary" id="tombol_simpan" onclick="upload_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.books.update',$book->id)); ?>','#bookModal')">Simpan Perubahan</button>
              <?php else: ?>
                  <button type="submit" class="btn btn-primary" id="tombol_simpan" onclick="upload_form_modal('#tombol_simpan','#form_input','<?php echo e(route('office.books.store')); ?>','#bookModal')">Simpan</button>
              <?php endif; ?>
          </div>
    </form>
</div>

<script>
  number_only('jumlah_halaman');
  number_only('jumlah_buku');
</script><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/book/modal.blade.php ENDPATH**/ ?>