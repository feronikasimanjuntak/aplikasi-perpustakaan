<x-OfficeLayout title="Data Buku">
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <div id="content_list">
            <h1 class="h3 mb-2 text-gray-800">Data Buku Kategori {{$category->nama_kategori}}</h1>
            </h1>
            <p class="mb-4">Berikut merupakan data buku yang tersedia di perpustakaan Lumban Dolok</p>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="{{route('office.book-category.all')}}" class="btn mb-3 btn-info btn-icon-split btn-sm" >
                                <span class="icon text-white-50">
                                    <i class="fas fa-arrow-left"></i>
                                </span>
                                <span class="text">Kembali</span>
                            </a>
                        </div>
                        <h6 class="m-0 font-weight-bold text-primary">Data Buku</h6>
                    </div>
                    <div class="card-body">
                        <a href="javascript:void(0);" onclick="handle_open_modal('{{route('office.books.create',$category->id)}}','#bookModal','#contentBookModal');" class="btn mb-3 btn-primary btn-icon-split btn-sm" >
                            <span class="icon text-white-50">
                                <i class="fas fa-plus"></i>
                            </span>
                            <span class="text">Tambah Data Buku</span>
                        </a>
                        <div id="list_result"></div>
                    </div>
                </div>
            </div>
@section('custom_js')
<script>
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
@endsection
</x-OfficeLayout>