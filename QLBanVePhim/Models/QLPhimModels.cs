using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLBanVePhim.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web.Script.Serialization;

    [Table("XuatChieus")]
    public class XuatChieu
    {

        public int XuatChieuId { get; set; }
        public TimeSpan GioBatDau { get; set; }

        public virtual List<ChiTietLichChieu> ChiTietLichChieus { get; set; }
    }

    [Table("LichChieus")]
    public class LichChieu
    {
        public int LichChieuId { get; set; }
        public int PhatHanhPhimId { get; set; }
        public DateTime NgayChieu { get; set; }

        public virtual List<ChiTietLichChieu> ChiTietLichChieus { get; set; }
        public virtual PhatHanhPhim PhatHanhPhim { get; set; }
    }

    public class PhatHanhPhim
    {
        public int PhatHanhPhimId { get; set; }
        public int PhimId { get; set; }
        public int RapId { get; set; }
        public DateTime NgayBatDau { get; set; }
        public DateTime NgayKetThuc { get; set; }

        public virtual List<LichChieu> LichChieus { get; set; }
        public virtual Phim Phim { get; set; }
        public virtual Rap Rap { get; set; }
    }

    public class Phim
    {
        public int PhimId { get; set; }
        public int LoaiPhimId { get; set; }
        public int DangPhimId { get; set; }
        public string TenPhim { get; set; }
        public string AnhDaiDien { get; set; }
        public string MoTaPhim { get; set; }
        public int ThoiLuong { get; set; }
        public string LinkTrailer { get; set; }

        public virtual DangPhim DangPhim { get; set; }
        public virtual LoaiPhim LoaiPhim { get; set; }
        public virtual List<PhatHanhPhim> PhatHanhPhims { get; set; }
    }

    public class DangPhim
    {
        public int DangPhimId { get; set; }
        public string TenDang { get; set; }

        public virtual List<Phim> Phims { get; set; }
    }

    public class LoaiPhim
    {
        public int LoaiPhimId { get; set; }
        public string TenLoai { get; set; }

        public virtual List<Phim> Phims { get; set; }
    }

    public class Rap
    {

        public int RapId { get; set; }
        public string TenRap { get; set; }
        public string DiaChi { get; set; }

        public virtual List<PhatHanhPhim> PhatHanhPhims { get; set; }
    }

    public class Phong
    {
        public int PhongId { get; set; }
        public int RapId { get; set; }
        public string TenPhong { get; set; }

        public virtual List<ChiTietLichChieu> ChiTietLichChieus { get; set; }
    }

    [Table("ChiTietLichChieus")]
    public class ChiTietLichChieu
    {

        public int ChiTietLichChieuId { get; set; }
        public int LichChieuId { get; set; }
        public int PhongId { get; set; }
        public int XuatChieuId { get; set; }

        public virtual LichChieu LichChieu { get; set; }
        public virtual Phong Phong { get; set; }
        public virtual XuatChieu XuatChieu { get; set; }
        public virtual List<Ve> Ves { get; set; }
    }

    public class Ve
    {

        public int VeId { get; set; }
        public int GheId { get; set; }
        public int ChiTietLichChieuId { get; set; }
        public bool TinhTrangGhe { get; set; }

        public virtual ChiTietLichChieu ChiTietLichChieu { get; set; }
        public virtual List<ChiTietVe> ChiTietVes { get; set; }
        public virtual Ghe Ghe { get; set; }
    }

    public class ChiTietVe
    {
        public int ChiTietVeId { get; set; }
        public int VeId { get; set; }
        public int DatVeId { get; set; }

        public virtual DatVe DatVe { get; set; }
        public virtual Ve Ve { get; set; }
    }

    public class DatVe
    {

        public int DatveId { get; set; }
        public int UserId { get; set; }
        public DateTime NgayDat { get; set; }
        public int SoLuong { get; set; }
        public decimal ThanhTien { get; set; }

        public virtual List<ChiTietDichVu> ChiTietDichVus { get; set; }
        public virtual List<ChiTietVe> ChiTietVes { get; set; }
        public virtual UserProfile UserProfile { get; set; }
    }

    public class ChiTietDichVu
    {
        public int ChiTietDichVuId { get; set; }
        public int DichVuId { get; set; }
        public int DatVeId { get; set; }

        public virtual DatVe DatVe { get; set; }
        public virtual DichVu DichVu { get; set; }
    }

    public class DichVu
    {

        public int DichVuId { get; set; }
        public string TenDichVu { get; set; }
        public decimal GiaTien { get; set; }

        public virtual List<ChiTietDichVu> ChiTietDichVus { get; set; }
    }

    public class Ghe
    {

        public int GheId { get; set; }
        public bool LoaiGhe { get; set; }
        public string DayGhe { get; set; }
        public int SoGhe { get; set; }
        public decimal GiaTien { get; set; }

        public virtual List<Ve> Ves { get; set; }
    }

    [Table("webpages_Membership")]
    public class webpages_Membership
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }
        public DateTime? CreateDate { get; set; }
        [StringLength(128)]
        public string ConfirmationToken { get; set; }
        public bool? IsConfirmed { get; set; }
        public DateTime? LastPasswordFailureDate { get; set; }
        public int PasswordFailuresSinceLastSuccess { get; set; }
        [Required, StringLength(128)]
        public string Password { get; set; }
        public DateTime? PasswordChangedDate { get; set; }
        [Required, StringLength(128)]
        public string PasswordSalt { get; set; }
        [StringLength(128)]
        public string PasswordVerificationToken { get; set; }
        public DateTime? PasswordVerificationTokenExpirationDate { get; set; }
    }
}