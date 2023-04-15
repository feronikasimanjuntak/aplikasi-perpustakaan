<?php $__env->startSection('css'); ?>
<style>
    #team {
    padding: 60px 0;
    text-align: center;
    color: #145889;
}
#team h2 {
    position: relative;
    padding: 0px 0px 15px;
}
#team p {
    font-size: 15px;
    font-style: italic;
    padding: 0px;
    margin: 25px 0px 40px;
}
#team h2::after {
    content: '';
    border-bottom: 2px solid #fff;
    position: absolute;
    bottom: 0px;
    right: 0px;
    left: 0px;
    width: 90px;
    margin: 0 auto;
    display: block;
}
#team .member {
    margin-bottom: 20px;
    position: relative;
    overflow: hidden;
    background-color: #ffffff;
    padding: 10px;
    border-radius: 15px 0px 15px 0px;
    box-shadow: 0px 1px 6px 0px rgba(0, 0, 0, 0.4);
}
#team .member .member-info {
    display: block;
    position: absolute;
    bottom: 0px;
    left: -200px;
    transition: 0.4s;
    padding: 15px 0;
    background: rgba(0, 0, 0, 0.4);
}
#team .member:hover .member-info {
    left: 0px;
    right: 0px;
}
#team .member h4 {
    font-weight: 700;
    margin-bottom: 2px;
    font-size: 18px;
    color: #fff;
}
#team .member span {
    font-style: italic;
    display: block;
    font-size: 13px;
}
#team .member .social-links {
    margin-top: 15px;
}
#team .member .social-links a {
    transition: none;
    color: #fff;
}
#team .member .social-links a:hover {
    color: #ffc107;
}
#team .member .social-links i {
    font-size: 18px;
    margin: 0 2px;
}
</style>
<?php $__env->stopSection(); ?>
<?php if (isset($component)) { $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274 = $component; } ?>
<?php $component = $__env->getContainer()->make(App\View\Components\OfficeLayout::class, ['title' => 'Tentang']); ?>
<?php $component->withName('OfficeLayout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
    <div class="container-fluid">
        <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Pengembang</h6>
                </div>
                <div class="card-body">
                    Website ini dikelola dan dikembangkan untuk membantu para pengunjung perpustakaan Lumban Dolok
                    <section id="team">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="member">
                                      <div class="member-img">
                                          <img src="<?php echo e(asset('offices/img/havel.jpeg')); ?>" class="img-fluid" alt="" style="width: 70%;height:400px;">
                                      </div>
                                        <div class="member-info">
                                            <h4>Pakhomios Havel</h4>
                                            <span>Project Manager</span>
                                            <div class="social-links">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                
                                <div class="col-lg-6 col-md-6">
                                    <div class="member">
                                      <div class="member-img">
                                          <img src="<?php echo e(asset('offices/img/Ricky.png')); ?>" class="img-fluid" alt="" style="width: 70%;height:400px;">
                                      </div>
                                        <div class="member-info">
                                            <h4>Ricky Ananda P. Sitorus</h4>
                                            <span>Programmer</span>
                                            <div class="social-links">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                
                                <div class="col-lg-6 col-md-6">
                                    <div class="member">
                                      <div class="member-img">
                                          <img src="<?php echo e(asset('offices/img/fero.jpeg')); ?>" class="img-fluid" alt="" style="width: 70%;height:400px;">
                                      </div>
                                        <div class="member-info">
                                            <h4>Feronika Simanjuntak</h4>
                                            <span>UI/UX Designer & System Analyst</span>
                                            <div class="social-links">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                
                                <div class="col-lg-6 col-md-6">
                                    <div class="member">
                                      <div class="member-img">
                                          <img src="<?php echo e(asset('offices/img/scintya.jpeg')); ?>" class="img-fluid" alt="" style="width: 70%;height:400px;">
                                      </div>
                                        <div class="member-info">
                                            <h4>Scintya Tobing</h4>
                                            <span>Software Tester</span>
                                            <div class="social-links">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
                        <!-- Collapsable Card Example -->
                <div class="card shadow mb-4">
                    <!-- Card Header - Accordion -->
                    <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                    <h6 class="m-0 font-weight-bold text-primary">Versi Website</h6>
                    </a>
                    <!-- Card Content - Collapse -->
                    <div class="collapse " id="collapseCardExample">
                    <div class="card-body">
                        Sistem Manajemen Perpustakaan Lumban Dolok Versi 1.0
                    </div>
                    </div>
                </div>
    </div>
 <?php if (isset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274)): ?>
<?php $component = $__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274; ?>
<?php unset($__componentOriginal4b9fd5df344ded1279b89d3c3f61127b178f3274); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?><?php /**PATH /home/u7749512/public_html/rickaru.com/perpustakaan/resources/views/pages/office/info.blade.php ENDPATH**/ ?>