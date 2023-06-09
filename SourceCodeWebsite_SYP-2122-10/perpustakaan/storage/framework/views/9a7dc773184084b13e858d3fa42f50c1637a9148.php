<!DOCTYPE html>
<html lang="en">
<?php echo $__env->make('theme.office.head', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<body id="page-top">
<?php echo $__env->make('theme.office.aside', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->yieldContent('css'); ?>
<main class="py-4">
    <?php echo e($slot); ?>

</main>
<?php echo $__env->make('theme.office.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('theme.office.js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->yieldContent('custom_js'); ?>
</body>
</html><?php /**PATH F:\PA II\FINAL PA II\CODE\SourceCodeWebsite_SYP-2122-10\perpustakaan\resources\views/theme/office/index.blade.php ENDPATH**/ ?>