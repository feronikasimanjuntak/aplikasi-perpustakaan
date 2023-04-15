<?php if (isset($component)) { $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274 = $component; } ?>
<?php $component = $__env->getContainer()->make(App\View\Components\OfficeLayout::class, ['title' => 'Data Anggota']); ?>
<?php $component->withName('OfficeLayout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
    <!-- Begin Page Content -->
    <div id="content_list">
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Data Anggota</h1>
            <p class="mb-4">Berikut merupakan data Anggota perpustakaan Lumban Dolok</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Data Anggota perpustakaan</h6>
              </div>
              <div class="card-body">
                   <a href="javascript:void(0);" onclick="handle_open_modal('<?php echo e(route('office.member.create')); ?>','#memberModal','#contentMemberModal')" class="btn mb-3 btn-primary btn-icon-split btn-sm">
                      <span class="icon text-white-50">
                          <i class="fas fa-plus"></i>
                      </span>
                      <span class="text">Tambah Data Pengguna</span>
                  </a>
                  <div id="list_result"></div>
              </div>
            </div>
          </div>
          <!-- /.container-fluid -->
          <!-- Modal -->
    </div>
<?php $__env->startSection('custom_js'); ?>
<script type="text/javascript">
    $(function() {
        load_list(1);
    });
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
 <?php if (isset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274)): ?>
<?php $component = $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274; ?>
<?php unset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/member/main.blade.php ENDPATH**/ ?>