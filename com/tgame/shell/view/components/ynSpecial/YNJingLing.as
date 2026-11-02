package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameState;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.jinglingqixuanSkin;
   import game.utils.SkinTools;
   
   public class YNJingLing extends BasePanel
   {
      
      private static var _instance:YNJingLing;
      
      public var $parent:DisplayObject;
      
      private var container:Sprite;
      
      private var goodArr:Array;
      
      private var ft1:FTextArea;
      
      private var check1:FCheckBox;
      
      private var ft2:FTextArea;
      
      private var check2:FCheckBox;
      
      private var ft3:FTextArea;
      
      private var check3:FCheckBox;
      
      private var ft4:FTextArea;
      
      private var check4:FCheckBox;
      
      private var ft5:FTextArea;
      
      private var check5:FCheckBox;
      
      private var ft6:FTextArea;
      
      private var check6:FCheckBox;
      
      private var ft7:FTextArea;
      
      private var check7:FCheckBox;
      
      private var ft8:FTextArea;
      
      private var check8:FCheckBox;
      
      private var ft9:FTextArea;
      
      private var check9:FCheckBox;
      
      private var ft10:FTextArea;
      
      private var check10:FCheckBox;
      
      private var currentSelected:FCheckBox;
      
      public function YNJingLing()
      {
         this.goodArr = [734354,734503,734504,734590,734748,734967,735018,734981];
         super();
         this.skin = SkinTools.getChildSkinByName(jinglingqixuanSkin.skin,"jinglingqixuan");
         this.container = new Sprite();
         addChild(this.container);
         this.setGoods();
         this.ft1 = new FTextArea();
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = StaticValue.filter;
         this.ft1.x = 36;
         this.ft1.y = 12;
         this.ft1.width = 150;
         this.ft1.height = 22;
         this.ft1.text = "Sát Lang Hỏa Thánh";
         this.ft1.visible = false;
         addChild(this.ft1);
         ToolTips.createToolTips(this.ft1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hỏa Phượng Tinh : Đã Kích Hoạt" + "<br>" + "Khi tấn công có xác suất kích hoạt kỹ năng giúp bản thân nhận được hiệu quả Hỏa Phượng Tinh kéo dài liên tục trong 15 giây. " + "<br>" + "Thời gian chờ là 180 giây." + "<br>" + "Trong thời gian hiệu quả, bản thân đánh vào đối thủ nào thì đối thủ đó sẽ lập tức phải gánh chịu hiệu quả Hỏa Phượng Tinh (Thiêu " + "<br>" + "Đốt) kéo dài 8 giây. " + "<br>" + "Hỏa Phượng Tinh (Thiêu Đốt) : Mỗi giây giảm 10% Sinh-Nội-Thể Lực." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         this.check1.visible = false;
         addChild(this.check1);
         this.check1.x = 11;
         this.check1.y = 12;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft2 = new FTextArea();
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = StaticValue.filter;
         this.ft2.x = 36;
         this.ft2.y = 30;
         this.ft2.width = 150;
         this.ft2.height = 22;
         this.ft2.text = "Bạch Hổ Kim Tinh";
         this.ft2.visible = false;
         addChild(this.ft2);
         ToolTips.createToolTips(this.ft2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả kỹ năng: Bạch Hổ Kim Tinh" + "Khi bị tấn công sẽ có xác suất 10% kích hoạt kỹ năng giúp bản thân nhận được hiệu quả Hổ Kim Tinh kéo dài liên tục trong 12 giây. " + "<br>" + "Thời gian chờ là 150 giây." + "Trong thời gian hiệu quả, tất cả đối thủ đánh vào bản thân sẽ lập tức phải gánh chịu hiệu quả Hổ Kim Tinh kéo dài 12 giây." + "<br>" + "Hổ Kim Tinh: Tất cả đối thủ đánh vào bản thân đều bị giảm 200.000.000 tầng Võ Công và 100.000.000 tầng Võ Phòng trong 12 giây " + "<br>" + "(không tính cộng dồn)." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         this.check2.visible = false;
         addChild(this.check2);
         this.check2.x = 11;
         this.check2.y = 30;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft3 = new FTextArea();
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = StaticValue.filter;
         this.ft3.x = 36;
         this.ft3.y = 48;
         this.ft3.width = 150;
         this.ft3.height = 22;
         this.ft3.text = "Bạch Lộ Ngưng Sương";
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả kỹ năng: Bạch Lộ Ngưng Sương" + "<br>" + "Khi tấn công sẽ có xác suất 20% kích hoạt kỹ năng giúp bản thân nhận được hiệu quả Bạch Lộ Ngưng Sương kéo dài liên tục trong " + "<br>" + "10 giây. Thời gian chờ là 90 giây." + "<br>" + "Bạch Lộ Ngưng Sương: Bản thân lập tức hồi phục 100% Sinh – Nội – Thể, phản đòn sát thương tăng 20%. Sát thương bạo kích của " + "<br>" + "bản thân được X4." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check3 = new FCheckBox();
         this.check3.visible = false;
         addChild(this.check3);
         this.check3.x = 11;
         this.check3.y = 48;
         this.check3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft4 = new FTextArea();
         this.ft4.textColor = StaticValue.GREEN;
         this.ft4.filters = StaticValue.filter;
         this.ft4.x = 36;
         this.ft4.y = 64;
         this.ft4.width = 150;
         this.ft4.height = 22;
         this.ft4.text = "Nhược Thủy Tam Thiên";
         this.ft4.visible = false;
         addChild(this.ft4);
         ToolTips.createToolTips(this.ft4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả kỹ năng: Nhược Thủy Tam Thiên" + "<br>" + "Khi bị tấn công sẽ có xác suất 20% kích hoạt kỹ năng giúp bản thân nhận được hiệu quả Nhược Thủy Tam Thiên kéo dài liên tục " + "<br>" + "trong 30 giây. Thời gian chờ là 120 giây." + "<br>" + "Trong thời gian hiệu quả, tất cả đối thủ đánh vào bản thân sẽ lập tức phải gánh chịu hiệu quả Nhược Thủy Tam Thiên kéo dài 10 giây." + "<br>" + "Nhược Thủy Tam Thiên : Giảm 500.000.000 Tầng Võ Công và 200.000.000 Tầng Võ Phòng. Điểm Tốc Độ Đánh giảm 200.000." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check4 = new FCheckBox();
         this.check4.visible = false;
         addChild(this.check4);
         this.check4.x = 11;
         this.check4.y = 64;
         this.check4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft5 = new FTextArea();
         this.ft5.textColor = StaticValue.GREEN;
         this.ft5.filters = StaticValue.filter;
         this.ft5.x = 36;
         this.ft5.y = 82;
         this.ft5.width = 150;
         this.ft5.height = 22;
         this.ft5.text = "Băng Phong Thú ";
         this.ft5.visible = false;
         addChild(this.ft5);
         ToolTips.createToolTips(this.ft5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sử dụng Băng Phong Tinh Linh để nhận được đặc quyền." + "<br>" + "Hiệu quả đặc biệt: Kháng 100% hiệu quả : Tứ Linh - Bạch Hổ và Hỏa Tinh-Sát." + "<br>" + "Hiệu quả hiển thị ảo hóa: Băng Phong Thú." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check5 = new FCheckBox();
         this.check5.visible = false;
         addChild(this.check5);
         this.check5.x = 11;
         this.check5.y = 82;
         this.check5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft6 = new FTextArea();
         this.ft6.textColor = StaticValue.GREEN;
         this.ft6.filters = StaticValue.filter;
         this.ft6.x = 36;
         this.ft6.y = 100;
         this.ft6.width = 150;
         this.ft6.height = 22;
         this.ft6.text = "Thần Hưu Thú";
         this.ft6.visible = false;
         addChild(this.ft6);
         ToolTips.createToolTips(this.ft6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sử dụng Thần Hưu Tinh Linh để nhận được đặc quyền." + "<br>" + "Hiệu quả đặc biệt: Kháng 100% hiệu quả : TOP Thương Hội và U Minh - Tà" + "<br>" + "Hiệu quả hiển thị ảo hóa: Thần Hưu Thú" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check6 = new FCheckBox();
         this.check6.visible = false;
         addChild(this.check6);
         this.check6.x = 11;
         this.check6.y = 100;
         this.check6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft7 = new FTextArea();
         this.ft7.textColor = StaticValue.GREEN;
         this.ft7.filters = StaticValue.filter;
         this.ft7.x = 36;
         this.ft7.y = 136;
         this.ft7.width = 150;
         this.ft7.height = 22;
         this.ft7.text = "Thượng Cổ Thú";
         this.ft7.visible = false;
         addChild(this.ft7);
         ToolTips.createToolTips(this.ft7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sử dụng Cá Chép Tinh Linh để nhận được đặc quyền." + "<br>" + "Hiệu quả đặc biệt: Kháng 100% hiệu quả : Hùng Vương Kim Ấn - Quang (Bất Lợi) và Giỗ Tổ Hùng Vương 2023" + "<br>" + "Hiệu quả hiển thị ảo hóa: Thượng Cổ Thú" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check7 = new FCheckBox();
         this.check7.visible = false;
         addChild(this.check7);
         this.check7.x = 11;
         this.check7.y = 136;
         this.check7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft8 = new FTextArea();
         this.ft8.textColor = StaticValue.GREEN;
         this.ft8.filters = StaticValue.filter;
         this.ft8.x = 36;
         this.ft8.y = 154;
         this.ft8.width = 150;
         this.ft8.height = 22;
         this.ft8.text = "Cá Chép Tinh Linh";
         this.ft8.visible = false;
         addChild(this.ft8);
         ToolTips.createToolTips(this.ft8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sử dụng Cá Chép Tinh Linh để nhận được đặc quyền." + "<br>" + "Hiệu quả đặc biệt: Kháng 100% hiệu quả : Ngọc Thố Hộ Úy, Hỗn Nguyên Hộ Thể (Bất lợi) và bỏ qua hiệu quả Khoáng Thạch Hộ Thể" + "<br>" + "Hiệu quả hiển thị ảo hóa: Cá Chép Hóa Rồng" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check8 = new FCheckBox();
         this.check8.visible = false;
         addChild(this.check8);
         this.check8.x = 11;
         this.check8.y = 154;
         this.check8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft9 = new FTextArea();
         this.ft9.textColor = StaticValue.GREEN;
         this.ft9.filters = StaticValue.filter;
         this.ft9.x = 36;
         this.ft9.y = 172;
         this.ft9.width = 150;
         this.ft9.height = 22;
         this.ft9.text = " Bính Ngọ Niên Thú";
         this.ft9.visible = false;
         addChild(this.ft9);
         this.check9 = new FCheckBox();
         this.check9.visible = false;
         addChild(this.check9);
         this.check9.x = 11;
         this.check9.y = 172;
         this.check9.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft10 = new FTextArea();
         this.ft10.textColor = StaticValue.GREEN;
         this.ft10.filters = StaticValue.filter;
         this.ft10.x = 36;
         this.ft10.y = 192;
         this.ft10.width = 150;
         this.ft10.height = 22;
         this.ft10.text = " La Hải Lam Ngư";
         this.ft10.visible = false;
         addChild(this.ft10);
         ToolTips.createToolTips(this.ft10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "La Hải Lam Ngư" + "<br>" + "Kích hoạt Thú Cưỡi đặc biệt La Hải Lam Ngư" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check10 = new FCheckBox();
         this.check10.visible = false;
         addChild(this.check10);
         this.check10.x = 11;
         this.check10.y = 192;
         this.check10.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public static function get instance() : YNJingLing
      {
         if(!_instance)
         {
            _instance = new YNJingLing();
         }
         return _instance;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if((param1.currentTarget as FCheckBox).selectState && param1.currentTarget as FCheckBox != this.currentSelected)
         {
            if(this.currentSelected)
            {
               this.currentSelected.selectState = false;
               this.currentSelected = null;
            }
            this.currentSelected = param1.currentTarget as FCheckBox;
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check1.selectState,734354]);
               break;
            case this.check2:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check2.selectState,734503]);
               break;
            case this.check3:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check3.selectState,734504]);
               break;
            case this.check4:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check4.selectState,734590]);
               break;
            case this.check5:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check5.selectState,734748]);
               break;
            case this.check6:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check6.selectState,734967]);
               break;
            case this.check7:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check7.selectState,735018]);
               break;
            case this.check8:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check8.selectState,734981]);
               break;
            case this.check9:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check9.selectState,742413]);
               break;
            case this.check10:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check10.selectState,743624]);
         }
      }
      
      private function setGoods() : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.goodArr.length)
         {
            _loc2_ = new Goods(this.goodArr[_loc1_]);
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 36 + _loc1_ % 6 * 59;
            _loc3_.y = 242 + int(_loc1_ / 6) * 70;
            _loc3_.filters = Tools.blackWhiteFilter;
            this.container.addChild(_loc3_);
            _loc1_++;
         }
      }
      
      public function setData(param1:Object) : void
      {
         if(this.currentSelected)
         {
            this.currentSelected.selectState = false;
            this.currentSelected = null;
         }
         var _loc2_:Boolean = param1.playerID == -1 ? true : false;
         if(_loc2_)
         {
            this.ft1.visible = GameState.dictMainStatus[734354];
            this.check1.visible = this.ft1.visible;
            this.currentSelected = param1.goodsID == 734354 ? this.check1 : this.currentSelected;
            (this.container.getChildAt(0) as ItemFace).filters = this.ft1.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft2.visible = GameState.dictMainStatus[734503];
            this.check2.visible = this.ft2.visible;
            this.currentSelected = param1.goodsID == 734503 ? this.check2 : this.currentSelected;
            (this.container.getChildAt(1) as ItemFace).filters = this.ft2.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft3.visible = GameState.dictMainStatus[734504];
            this.check3.visible = this.ft3.visible;
            this.currentSelected = param1.goodsID == 734504 ? this.check3 : this.currentSelected;
            (this.container.getChildAt(2) as ItemFace).filters = this.ft3.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft4.visible = GameState.dictMainStatus[734590];
            this.check4.visible = this.ft4.visible;
            this.currentSelected = param1.goodsID == 734590 ? this.check4 : this.currentSelected;
            (this.container.getChildAt(3) as ItemFace).filters = this.ft4.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft5.visible = GameState.dictMainStatus[734748];
            this.check5.visible = this.ft5.visible;
            this.currentSelected = param1.goodsID == 734748 ? this.check5 : this.currentSelected;
            (this.container.getChildAt(4) as ItemFace).filters = this.ft5.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft6.visible = GameState.dictMainStatus[734967];
            this.check6.visible = this.ft6.visible;
            this.currentSelected = param1.goodsID == 734967 ? this.check6 : this.currentSelected;
            (this.container.getChildAt(5) as ItemFace).filters = this.ft6.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft7.visible = GameState.dictMainStatus[735018];
            this.check7.visible = this.ft7.visible;
            this.currentSelected = param1.goodsID == 735018 ? this.check7 : this.currentSelected;
            (this.container.getChildAt(6) as ItemFace).filters = this.ft7.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft8.visible = GameState.dictMainStatus[734981];
            this.check8.visible = this.ft8.visible;
            this.currentSelected = param1.goodsID == 734981 ? this.check8 : this.currentSelected;
            (this.container.getChildAt(7) as ItemFace).filters = this.ft8.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft9.visible = GameState.dictMainStatus[742413];
            this.check9.visible = this.ft9.visible;
            this.ft10.visible = GameState.dictMainStatus[743624];
            this.check10.visible = this.ft10.visible;
            if(this.currentSelected)
            {
               this.currentSelected.selectState = true;
            }
         }
         else
         {
            this.ft1.visible = GameState.dictTargetStatus[734354];
            this.check1.visible = false;
            (this.container.getChildAt(0) as ItemFace).filters = this.ft1.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft2.visible = GameState.dictTargetStatus[734503];
            this.check2.visible = false;
            (this.container.getChildAt(1) as ItemFace).filters = this.ft2.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft3.visible = GameState.dictTargetStatus[734504];
            this.check3.visible = false;
            (this.container.getChildAt(2) as ItemFace).filters = this.ft3.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft4.visible = GameState.dictTargetStatus[734590];
            this.check4.visible = false;
            (this.container.getChildAt(3) as ItemFace).filters = this.ft4.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft5.visible = GameState.dictTargetStatus[734748];
            this.check5.visible = false;
            (this.container.getChildAt(4) as ItemFace).filters = this.ft5.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft6.visible = GameState.dictTargetStatus[734967];
            this.check6.visible = false;
            (this.container.getChildAt(5) as ItemFace).filters = this.ft6.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft7.visible = GameState.dictTargetStatus[735018];
            this.check7.visible = false;
            (this.container.getChildAt(6) as ItemFace).filters = this.ft7.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft8.visible = GameState.dictTargetStatus[734981];
            this.check8.visible = false;
            (this.container.getChildAt(7) as ItemFace).filters = this.ft8.visible == true ? [] : Tools.blackWhiteFilter;
            this.ft9.visible = GameState.dictTargetStatus[742413];
            this.check9.visible = false;
            this.ft10.visible = GameState.dictTargetStatus[743624];
            this.check10.visible = false;
         }
      }
   }
}

