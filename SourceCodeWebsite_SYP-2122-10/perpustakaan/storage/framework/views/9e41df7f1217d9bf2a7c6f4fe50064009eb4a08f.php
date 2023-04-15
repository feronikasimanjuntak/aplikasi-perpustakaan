<?php if (isset($component)) { $__componentOriginal7b6721487b7b8dd63e67398e09f7d70f121b9aa3 = $component; } ?>
<?php $component = $__env->getContainer()->make(App\View\Components\AuthLayout::class, ['title' => 'Lupa Password']); ?>
<?php $component->withName('AuthLayout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
    <div class="d-flex flex-column flex-root" style="background-image: url(<?php echo e(asset('offices/img/lib.png')); ?>)">
      <div class="d-flex flex-column flex-column-fluid" >
        <div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">
          <div id="forgot_page">
            <div class="w-lg-500px bg-white rounded shadow-sm p-10 p-lg-15 mx-auto">
                <form class="form w-100" novalidate="novalidate" id="form_forgot">
                    <div class="text-center mb-10">
                      <h1 class="text-dark mb-3">Lupa password ?</h1>
                        <div class="text-gray-400 fw-bold fs-4">Masukkan email yang ingin di reset</div>
                    </div>
                    <div class="fv-row mb-10">
                        <label class="form-label fw-bolder text-gray-900 fs-6">Email</label>
                        <input class="form-control form-control-solid br10" type="email" placeholder="" id="email_forgot" placeholder="Masukan Alamat Email Anda" name="email" autocomplete="off" />
                    </div>
                    <div class="d-flex flex-wrap justify-content-center pb-lg-0">
                        <button type="button" id="button_forgot" class="btn btn-lg br10 btn-primary fw-bolder me-4" onclick="handle_save('#button_forgot','#form_forgot','<?php echo e(route('office.auth.forgot')); ?>','POST');">
                            <span class="indicator-label">Kirim</span>
                          <span class="indicator-progress">Please wait...
                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                          </span>
                        </button>
                    </div>
                </form>
            </div>
          </div>
  
        </div>
      </div>
    </div>
   <?php if (isset($__componentOriginal7b6721487b7b8dd63e67398e09f7d70f121b9aa3)): ?>
<?php $component = $__componentOriginal7b6721487b7b8dd63e67398e09f7d70f121b9aa3; ?>
<?php unset($__componentOriginal7b6721487b7b8dd63e67398e09f7d70f121b9aa3); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/auth/forgot.blade.php ENDPATH**/ ?>