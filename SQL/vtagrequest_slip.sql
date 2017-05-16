drop view vtagrequest_slip ;
create view vtagrequest_slip as (
select c.alamat as cabangalamat, c.fax as cabangfax, c.telp as cabangtelp,
a.id, a.nobukti, a.tglbukti, a.keterangan, c.nama as cabang, d.nama as tocabang, a.petugas,
e.sku, e.nama as barang, f.uom , b.qtyrequest, b.keterangan as keteranganitem, a.cabang as cabangid
from ttagrequest a
inner join ttagrequestitem b on a.id = b.tagrequest
inner join tcabang c on a.cabang = c.id
inner join tcabang d on a.tocabang = d.id
inner join tbarang e on b.barang = e.id
inner join tuom f on b.uom = f.id
)