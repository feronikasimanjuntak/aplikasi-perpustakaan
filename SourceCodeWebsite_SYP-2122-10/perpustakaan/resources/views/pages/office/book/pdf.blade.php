<!DOCTYPE html>
<html>
<head>
  <title>Barcode</title>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-lg-12" style="margin-top: 15px ">
        <div class="pull-left">
          <h2>Data Peminjaman Buku Perpustakaan Lumban Dolok</h2>
        </div>

      </div>
    </div><br>

    <table class="table table-bordered" border="1">
      <thead>
        <tr>
          <th>No</th>
          <th>Nama Buku</th>
          <th>Nama Kategori</th>
          <th>Nama Pengarang</th>
          <th>Nama Penerbit</th>
          <th>Jumlah Halaman</th>
          <th>Tahun Terbit</th>
          <th>Foto</th>
          <th>Edisi Buku</th>
          <th>Jumlah buku</th>
        </tr>
      </thead>
      <tbody>
      @foreach ($data as $i => $item)    
      <tr>
        <td>{{ $i+1 }}</td>
        <td>{{ $item->judul}}</td>
        <td>{{ $item->category->nama_kategori}}</td>
        <td>{{ $item->pengarang}}</td>
        <td>{{ $item->penerbit}}</td>
        <td>{{ $item->jumlah_halaman}}</td>
        <td>{{ $item->tahun_terbit}}</td>
        <td><img src="{{public_path('storage/'.$item->foto)}}" style="max-width:200px;max-height:200px;"></td>
        <td>{{ $item->edisi_buku}}</td>
        <td>{{ $item->jumlah_buku}}</td>
      </tr>
      @endforeach
    </tbody>
    </table>
  </div>
</body>
</html>