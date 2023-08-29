using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBanVePhim.Models
{
    public class ChiTietDatVe
    {
        public int VeID { get; set; }
        public float Gia { get; set; }
    }

    public class ListDatVe
    {
        QLPhimDBContext db = new QLPhimDBContext();
        public List<ChiTietDatVe> _Items { get; set; }

        public static ListDatVe Cart
        {
            get
            {
                var cart = HttpContext.Current.Session["Cart"];
                if (cart == null)//neu gio hang rong thi tao moi
                {
                    cart = new ListDatVe
                    {
                        _Items = new List<ChiTietDatVe>()
                    };
                    //luu vao session
                    HttpContext.Current.Session["Cart"] = cart;
                }
                return (ListDatVe)cart;
            }
        }

        public void ThemXoaGio(int id)
        {
            //có rồi thì xóa. chưa có thì thêm. vé chỉ 1 lần 1 ghế
            try
            {
                ChiTietDatVe ct = _Items.Single(p => p.VeID == id);
                _Items.Remove(ct);
            }
            catch
            {
                Ve s = db.Ves.Where(c => c.VeId == id).SingleOrDefault();
                ChiTietDatVe ct = new ChiTietDatVe { 
                    VeID = s.VeId,
                    Gia = (float)s.Ghe.GiaTien
                };
                _Items.Add(ct);
            }
        }

        public void Clear()
        {
            _Items.Clear();
        }

        public int Count
        {
            get
            {
                if (_Items == null)
                {
                    return 0;
                }
                return _Items.Count;
            }
        }

        public double Amount
        {
            get
            {
                if (_Items == null)
                {
                    return 0;
                }
                return _Items.Sum(p => p.Gia);
            }
        }
    }
}