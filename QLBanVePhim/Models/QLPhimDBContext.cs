using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace QLBanVePhim.Models
{
    public class QLPhimDBContext :DbContext
    {
        public QLPhimDBContext() : base("QLPhim") { }
        public DbSet<XuatChieu> XuatChieus { get; set; }
        public DbSet<LichChieu> LichChieus { get; set; }
        public DbSet<PhatHanhPhim> PhatHanhPhims { get; set; }
        public DbSet<Phim> Phims { get; set; }
        public DbSet<DangPhim> DangPhims { get; set; }
        public DbSet<LoaiPhim> LoaiPhims { get; set; }
        public DbSet<Rap> Raps { get; set; }
        public DbSet<Phong> Phongs { get; set; }
        public DbSet<ChiTietLichChieu> ChiTietLichChieus { get; set; }
        public DbSet<Ve> Ves { get; set; }
        public DbSet<ChiTietVe> ChiTietVes { get; set; }
        public DbSet<DatVe> DatVes { get; set; }
        public DbSet<ChiTietDichVu> ChiTietDichVus { get; set; }
        public DbSet<DichVu> DichVus { get; set; }
        public DbSet<Ghe> Ghes { get; set; }
        public DbSet<webpages_Membership> webpages_Membership { get; set; }
    }
}