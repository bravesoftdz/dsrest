select 1 as Urutan, cast('1/1/2017' as date) as TglBukti, 'Saldo Awal' as NoBukti, b.Nama as Cabang, c.Nama as Gudang, d.nama as Barang,  0 as Qtyout, qty as qtyin, e.uom, 1 as konversi, a.rp as harga, e.uom as satuanstock, 'Saldo Awal' as Transaksi 
from tclosinginventory a
inner join tcabang b on a.cabang =b.id
inner join tgudang c on a.gudang = c.id
inner join tbarang d on a.barang = d.id
inner join tuom e on a.uom = e.id

union all

select a.*
from tmutasistock a
inner join tcabang b on a.cabang =b.id
inner join tgudang c on a.gudang = c.id
inner join tbarang d on a.barang = d.id
inner join tuom e on a.uom = e.id
left join tuom f on d.satuanstock = f.id
order by 1 ,2,3


