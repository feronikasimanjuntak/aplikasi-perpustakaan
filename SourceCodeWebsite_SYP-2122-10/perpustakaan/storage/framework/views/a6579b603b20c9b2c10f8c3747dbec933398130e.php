<?php if (isset($component)) { $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274 = $component; } ?>
<?php $component = $__env->getContainer()->make(App\View\Components\OfficeLayout::class, ['title' => 'Data Kategori Buku']); ?>
<?php $component->withName('OfficeLayout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<div class="container-fluid">
    <!-- Page Heading -->    
<div id="content_list">
    <h1 class="h3 mb-2 text-gray-800">Data Buku</h1>
    <p class="mb-4">Berikut merupakan data buku berdasarkan kategori buku di perpustakaan Lumban Dolok</p>
    <div class="card-body">
        <a href="<?php echo e(route('office.books.request_download_pdf')); ?>"class="btn btn-outline-danger mb-3 btn-icon-split btn-sm" >
            <span class="icon text-white-50">
                <i class="fas fa-check"></i>
            </span>
            <span class="text">Cetak Data Semua Buku (PDF)</span>
        </a>
        <a href="<?php echo e(route('office.books.request_download_excel')); ?>"class="btn btn-outline-warning mb-3 btn-icon-split btn-sm" >
            <span class="icon text-white-50">
                <i class="fas fa-check"></i>
            </span>
            <span class="text">Cetak Data Semua Buku (Excel)</span>
        </a>
        <div id="list_result"></div>
    </div>
    <div id="list_result"></div>
</div>
<?php $__env->startSection('custom_js'); ?>
<script>
load_list(1);
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
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/group-category/main.blade.php ENDPATH**/ ?>