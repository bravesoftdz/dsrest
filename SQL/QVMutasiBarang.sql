drop view VMUTASIBARANG;
create or replace view VMUTASIBARANG as (
select a.tglbukti, a.periode, d.nama as cabang, b.sku, b.nama, 
a.qtyin * a.konversi as PenerimaanQty, 
a.qtyin * a.harga as PenerimaanRp , 
cast( 0 as double precision) as ReturSupplierQty, 
cast( 0 as double precision) as ReturSupplierRp, 
c.uom from tmutasistock a
inner join tbarang b on a.barang = b.id
inner join tuom c on b.satuanstock = c.id
inner join tcabang d on a.cabang = d.id
and a.transaksi = 'Penerimaan Barang' 

union all

select a.tglbukti, a.periode, d.nama as cabang, b.sku, b.nama, 
0, 
0, 
a.qtyin * a.konversi, 
a.qtyin * a.harga, 
c.uom from tmutasistock a
inner join tbarang b on a.barang = b.id
inner join tuom c on b.satuanstock = c.id
inner join tcabang d on a.cabang = d.id
and a.transaksi = 'Retur Supplier' 
)