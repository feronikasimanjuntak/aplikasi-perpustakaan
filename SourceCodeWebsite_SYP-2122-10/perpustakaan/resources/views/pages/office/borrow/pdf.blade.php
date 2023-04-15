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
          <th>Nama Peminjam</th>
          <th>Tanggal Peminjaman</th>
          <th>Tanggal Pengembalian</th>
          <th>Status Peminjaman</th>
        </tr>
      </thead>
      @php
      $i = 1;
      @endphp
      <tbody>
      @foreach ($data as $item)    
      <tr>
        <td>{{ $i++ }}</td>
        <td>{{ $item->judul}}</td>
        <td>{{ $item->user->name}}</td>
        <td>{{  Carbon\Carbon::parse($item->tangal_pinjam)->format('Y-m-d')}}</td>
        @if(!$item->tanggal_pengembalian)
        <td>NULL</td>
        @else
        <td>{{ Carbon\Carbon::parse($item->tanggal_pengembalian)->format('Y-m-d')}}</td>            
        @endif
        <td>{{ $item->st}}</td>
      </tr>
      @endforeach
    </tbody>
    </table>
  </div>
</body>
</html>