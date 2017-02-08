
create view VMUTASIBARANG as (
select a.periode, d.nama as cabang, b.sku, b.nama, a.qtyin * a.konversi as PenerimaanQty, a.qtyin * a.harga as PenerimaanRp , c.uom from tmutasistock a
inner join tbarang b on a.barang = b.id
inner join tuom c on b.satuanstock = c.id
inner join tcabang d on a.cabang = d.id
where a.periode = 201702 
and a.transaksi = 'Penerimaan Barang' 
)