package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.CharAttributeOccultIco;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.rankAttack.RankAttackVO;
   import com.tgame.manager.PipeManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ZhandouliPanel extends FPanel
   {
      
      private var bgleft:DisplayObject;
      
      private var bgright:DisplayObject;
      
      private var btnLeft:NewButton;
      
      private var sprRight:Sprite;
      
      private var spr:Sprite;
      
      private var ftZH:FTextArea;
      
      private var ftZL:FTextArea;
      
      private var ft1:FTextArea;
      
      private var _avatar:Bitmap;
      
      public var ico:CharAttributeOccultIco;
      
      private var ft:FTextArea;
      
      private var imgs:Bitmap;
      
      private var ftName:FTextArea;
      
      private var ftLV:FTextArea;
      
      private var ftBP:FTextArea;
      
      private var ftPO:FTextArea;
      
      private var ar:Array;
      
      private var check1:FCheckBox;
      
      private var fts1:FTextArea;
      
      private var check2:FCheckBox;
      
      private var fts2:FTextArea;
      
      private var check3:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var check4:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var check5:FCheckBox;
      
      private var fts5:FTextArea;
      
      private var check6:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var check7:FCheckBox;
      
      private var fts7:FTextArea;
      
      private var check8:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var check9:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var check10:FCheckBox;
      
      private var fts10:FTextArea;
      
      private var check11:FCheckBox;
      
      private var fts11:FTextArea;
      
      private var check12:FCheckBox;
      
      private var fts12:FTextArea;
      
      private var check13:FCheckBox;
      
      private var fts13:FTextArea;
      
      private var check14:FCheckBox;
      
      private var fts14:FTextArea;
      
      public function ZhandouliPanel()
      {
         this.ar = [LanResManager.getLanCommonTextWords("综合战斗力"),LanResManager.getLanCommonTextWords("人物战斗力"),LanResManager.getLanCommonTextWords("基础战斗力"),LanResManager.getLanCommonTextWords("装备战斗力"),LanResManager.getLanCommonTextWords("坐骑战斗力"),LanResManager.getLanCommonTextWords("武学战斗力"),LanResManager.getLanCommonTextWords("勋章战斗力"),LanResManager.getLanCommonTextWords("神兵战斗力")];
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 717;
         height = 500;
         titleText = LanResManager.getLanCommonTextWords("战斗力评定");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 320;
         this.check1.y = 400;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts1 = new FTextArea();
         this.fts1.x = 350;
         this.fts1.y = 400;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.filters = StaticValue.filter;
         this.fts1.width = 100;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("200级套装效应");
         addChild(this.fts1);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 320;
         this.check2.y = 382;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 350;
         this.fts2.y = 382;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.filters = StaticValue.filter;
         this.fts2.width = 100;
         this.fts2.height = 20;
         this.fts2.htmlText = "Hề Tinh Thú";
         addChild(this.fts2);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 320;
         this.check3.y = 364;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 350;
         this.fts3.y = 364;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.filters = StaticValue.filter;
         this.fts3.width = 155;
         this.fts3.height = 20;
         this.fts3.htmlText = "Ảo Hóa Bảo Bảo-30 ngày";
         addChild(this.fts3);
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = 320;
         this.check4.y = 346;
         this.check4.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 350;
         this.fts4.y = 346;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.filters = StaticValue.filter;
         this.fts4.width = 155;
         this.fts4.height = 20;
         this.fts4.htmlText = "Ảo Hóa Bảo Bảo-7 ngày";
         addChild(this.fts4);
         this.check5 = new FCheckBox();
         addChild(this.check5);
         this.check5.x = 320;
         this.check5.y = 328;
         this.check5.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts5 = new FTextArea();
         this.fts5.x = 350;
         this.fts5.y = 328;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.filters = StaticValue.filter;
         this.fts5.width = 155;
         this.fts5.height = 20;
         this.fts5.htmlText = "Thập Nhị Niên Thú (Hồn)";
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Thập Nhị Niên Thú – Kích hoạt Thú Cưỡi đặc biệt kỉ niệm 12 năm phát hành sản phẩm." + "<br>" + "Thập Nhị Niên Thú : Bản thân 100% bỏ qua các hiệu quả Miến Dịch Sát Thương sau:" + "<br>" + "Huyền Đồ-Phá Quân" + "<br>" + "Ngũ Hành Mộc Châu (Miễn Thương)" + "<br>" + "Phi Độc Nhập Cốt (Miễn Thương)" + "<br>" + "Thiên Thân Đảo Huyền (Miễn Thương)" + "<br>" + "Bằng Phong Tá Lực (Miễn Thương)" + "<br>" + "Tân Thủ Chương V602 (Miễn Thương)" + "<br>" + "Chiến Thần Tam Hoa (Miễn Thương)" + "<br>" + "Hè Cuồng Nhiệt (Miễn Thương)" + "<br>" + "Kim Bài Tinh Anh (Miễn Thương)" + "<br>" + "Tinh Anh Định Thế-Diệt Võ (Miễn Thương)" + "<br>" + "Tinh Anh Định Thế-Vô Toàn (Miễn Thương)" + "<br>" + "Anh Hùng Xuất Trận (Miễn Thương)" + "<br>" + "Hiệu quả không có thời gian chờ." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check6 = new FCheckBox();
         addChild(this.check6);
         this.check6.x = 320;
         this.check6.y = 310;
         this.check6.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 350;
         this.fts6.y = 310;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.filters = StaticValue.filter;
         this.fts6.width = 155;
         this.fts6.height = 20;
         this.fts6.htmlText = "Nguyên Đán Thần Thú (2024)";
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Kích hoạt hiệu quả : Nguyên Đán Thần Thú (2024)" + "<br>" + "Khi nhảy liên tục nhiều lần sẽ có xác suất 5% kích hoạt hiệu quả kỹ năng Nguyên Đán Thần Thú (2024) trong 10 giây. Trong thời gian hiệu quả, " + "<br>" + "bản thân bỏ qua tất cả trạng thái Miễn Dịch Sát Thương của đối thủ. Thời gian chờ là 180 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check7 = new FCheckBox();
         addChild(this.check7);
         this.check7.x = 320;
         this.check7.y = 292;
         this.check7.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts7 = new FTextArea();
         this.fts7.x = 350;
         this.fts7.y = 292;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.filters = StaticValue.filter;
         this.fts7.width = 155;
         this.fts7.height = 20;
         this.fts7.htmlText = "Thủy Thần Xuất Thế (Hồn)";
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Thủy Thần Xuất Thế – Kích hoạt Thú Cưỡi đặc biệt Mùa Hè 2024." + "<br>" + "Thủy Thần Xuất Thế : Bản thân 100% bỏ qua các hiệu quả Miến Dịch Sát Thương sau:" + "<br>" + "Huyền Đồ-Phá Quân" + "<br>" + "Ngũ Hành Mộc Châu (Miễn Thương)" + "<br>" + "Phi Độc Nhập Cốt (Miễn Thương)" + "<br>" + "Thiên Thân Đảo Huyền (Miễn Thương)" + "<br>" + "Bằng Phong Tá Lực (Miễn Thương)" + "<br>" + "Tân Thủ Chương V602 (Miễn Thương)" + "<br>" + "Chiến Thần Tam Hoa (Miễn Thương)" + "<br>" + "Hè Cuồng Nhiệt (Miễn Thương)" + "<br>" + "Kim Bài Tinh Anh (Miễn Thương)" + "<br>" + "Tinh Anh Định Thế-Diệt Võ (Miễn Thương)" + "<br>" + "Tinh Anh Định Thế-Vô Toàn (Miễn Thương)" + "<br>" + "Anh Hùng Xuất Trận (Miễn Thương)" + "<br>" + "Hiệu quả không có thời gian chờ." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check8 = new FCheckBox();
         addChild(this.check8);
         this.check8.x = 320 + 160 + 50;
         this.check8.y = 400;
         this.check8.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 350 + 160 + 50;
         this.fts8.y = 400;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.filters = StaticValue.filter;
         this.fts8.width = 150;
         this.fts8.height = 20;
         this.fts8.htmlText = "Bạch Hổ Linh Sơn (Hồn)";
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Bạch Hổ Linh Sơn-Kích hoạt Thú Cưỡi đặc biệt Mùa Hè 2024." + "<br>" + "Bạch Hổ Linh Sơn: Khi sử dụng kỹ năng Kim Cang Phục Long, bản thân nhận được hiệu quả Bạch Hổ Linh Sơn, miễn dịch và không " + "<br>" + "thể nhận hiệu quả bất lợi trong vòng 5 giây." + "<br>" + "HThời gian hồi kỹ năng 300 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check9 = new FCheckBox();
         addChild(this.check9);
         this.check9.x = 320 + 160 + 50;
         this.check9.y = 382;
         this.check9.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 350 + 160 + 50;
         this.fts9.y = 382;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.filters = StaticValue.filter;
         this.fts9.width = 150;
         this.fts9.height = 20;
         this.fts9.htmlText = "Nguyệt Quang Bạch Sư";
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Nguyệt Quang Bạch Sư -Kích hoạt Thú Cưỡi đặc biệt Trung Thu 2024." + "<br>" + "Bạch Hổ Linh Sơn: Khi tấn công có xác suất 20% kích hoạt Hiệu quả Nguyệt Quang Bạch Sư trong 10 giây, bản thân vô địch 10 giây, " + "<br>" + "đánh vào đối thủ nào thì đối thủ đó bị vô hiệu hoá huân chương trên người trong vòng 5 giây" + "<br>" + "Thời gian hồi kỹ năng 300 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check10 = new FCheckBox();
         addChild(this.check10);
         this.check10.x = 320 + 160 + 50;
         this.check10.y = 364;
         this.check10.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts10 = new FTextArea();
         this.fts10.x = 350 + 160 + 50;
         this.fts10.y = 364;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.filters = StaticValue.filter;
         this.fts10.width = 150;
         this.fts10.height = 20;
         this.fts10.htmlText = "Thập Tam Niên Thú";
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Thập Tam Niên Thú – Kích hoạt Thú Cưỡi đặc biệt kỉ niệm 13 năm phát hành sản phẩm." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check11 = new FCheckBox();
         addChild(this.check11);
         this.check11.x = 320 + 160 + 50;
         this.check11.y = 346;
         this.check11.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts11 = new FTextArea();
         this.fts11.x = 350 + 160 + 50;
         this.fts11.y = 346;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.filters = StaticValue.filter;
         this.fts11.width = 150;
         this.fts11.height = 20;
         this.fts11.htmlText = "GM Táo Quân 2025-Mã";
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sinh Lực: + 5.000.000.000" + "<br>" + "Nội Lực: + 500.000.000" + "<br>" + "Thể Lực: + 500.000.000" + "<br>" + "Võ Công: + 200.000.000" + "<br>" + "Võ Phòng: +200.000.000" + "<br>" + "Nhận được tại hoạt động: Ông Táo của phiên bản V689 – Bạch Y Thần Kiếm" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check12 = new FCheckBox();
         addChild(this.check12);
         this.check12.x = 320 + 160 + 50;
         this.check12.y = 328;
         this.check12.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts12 = new FTextArea();
         this.fts12.x = 350 + 160 + 50;
         this.fts12.y = 328;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.filters = StaticValue.filter;
         this.fts12.width = 150;
         this.fts12.height = 20;
         this.fts12.htmlText = "Vạn Hoa Thần Ngư";
         addChild(this.fts12);
         ToolTips.createToolTips(this.fts12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Kỹ năng: Vạn Hoa Thần Ngư" + "<br>" + "Hiệu quả: Khi lên ngựa sẽ kích hoạt kỹ năng Vạn Hoa Thần Ngư, trong thời gian 10 giây không thể nhận hiệu ứng bị rơi ngựa và cấm nhảy. " + "<br>" + " Đồng thời, trong thời gian lên ngựa sẽ miễn dịch hoàn toàn sát thương" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check13 = new FCheckBox();
         addChild(this.check13);
         this.check13.x = 320 + 160 + 50;
         this.check13.y = 310;
         this.check13.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts13 = new FTextArea();
         this.fts13.x = 350 + 160 + 50;
         this.fts13.y = 310;
         this.fts13.textColor = StaticValue.GREEN;
         this.fts13.filters = StaticValue.filter;
         this.fts13.width = 150;
         this.fts13.height = 20;
         this.fts13.htmlText = "Thái Cổ Thần Thú";
         addChild(this.fts13);
         this.check14 = new FCheckBox();
         addChild(this.check14);
         this.check14.x = 320 + 160 + 50;
         this.check14.y = 292;
         this.check14.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts14 = new FTextArea();
         this.fts14.x = 350 + 160 + 50;
         this.fts14.y = 292;
         this.fts14.textColor = StaticValue.GREEN;
         this.fts14.filters = StaticValue.filter;
         this.fts14.width = 150;
         this.fts14.height = 20;
         this.fts14.htmlText = "Bạch Diệm Cửu Vĩ";
         addChild(this.fts14);
         ToolTips.createToolTips(this.fts14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Kỹ năng: Bạch Diệm Cửu Vĩ" + "<br>" + "Kỹ năng: Bản thân bỏ qua trạng thái miễn dịch sát thương của các kỹ năng sau:" + "<br>" + "Bạch Mã Tây Phong (Siêu Thần)" + "<br>" + "Phi Long Hỏa Bội (Siêu Thần)" + "<br>" + "Hung Dũng Hồng Đào (Siêu Thần)" + "<br>" + "Thần Cơ-Hoán Linh (Siêu Thần)" + "<br>" + "Tứ Tượng-Đê Thổ Lạc (Siêu Thần)" + "<br>" + "Tứ Tượng-Đẩu Mộc Giải (Siêu Thần)" + "<br>" + "Tứ Tượng-Nữ Thổ Bức (Siêu Thần)" + "<br>" + "Tứ Tượng-Vị Thổ Tri (Siêu Thần)" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check1:
               PipeManager.sendMsg(PipeConstants.ZHANLI_200ZHUANGBEI,[4,SpecialGoodsID.ZHANDOULI_NEITIDAN,this.check1.selectState]);
               break;
            case this.check2:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check2.selectState,735893]);
               break;
            case this.check3:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check3.selectState,735950]);
               break;
            case this.check4:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check4.selectState,735951]);
               break;
            case this.check5:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check5.selectState,736951]);
               break;
            case this.check6:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check6.selectState,737533]);
               break;
            case this.check7:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check7.selectState,738184]);
               break;
            case this.check8:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check8.selectState,738397]);
               break;
            case this.check9:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check9.selectState,738968]);
               break;
            case this.check10:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check10.selectState,739540]);
               break;
            case this.check11:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check11.selectState,739826]);
               break;
            case this.check12:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check12.selectState,741401]);
               break;
            case this.check13:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check13.selectState,741949]);
               break;
            case this.check14:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check14.selectState,742224]);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var bg:FCanvas = new FCanvas();
         bg.skin = "box_transparence";
         bg.width = 563;
         bg.height = 424;
         bg.x = 145;
         bg.y = 2;
         this.bgleft = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhandouli/bgleft.swf");
         this.bgleft.x = 9;
         this.bgleft.y = 2;
         addChild(this.bgleft);
         this.bgright = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhandouli/bgright.swf");
         this.bgright.x = 148;
         this.bgright.y = 2;
         addChild(this.bgright);
         addChild(bg);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.ft = new FTextArea();
         this.ft.x = 25 + 135;
         this.ft.y = 90;
         this.ft.width = 40;
         this.ft.height = 25;
         this.ft.htmlText = "<font color=\'#6CEBA5\'>" + LanResManager.getLanCommonTextWords("姓名：") + "</font>";
         addChild(this.ft);
         this.ftName = new FTextArea();
         this.ftName.x = 65 + 135;
         this.ftName.y = 90;
         this.ftName.width = 150;
         this.ftName.height = 25;
         addChild(this.ftName);
         this.ft = new FTextArea();
         this.ft.x = 25 + 135;
         this.ft.y = 105;
         this.ft.width = 40;
         this.ft.height = 25;
         this.ft.htmlText = "<font color=\'#6CEBA5\'>" + LanResManager.getLanCommonTextWords("等级：") + "</font>";
         addChild(this.ft);
         this.ftLV = new FTextArea();
         this.ftLV.x = 65 + 135;
         this.ftLV.y = 105;
         this.ftLV.width = 100;
         this.ftLV.height = 25;
         addChild(this.ftLV);
         this.ft = new FTextArea();
         this.ft.x = 25 + 135;
         this.ft.y = 120;
         this.ft.width = 40;
         this.ft.height = 25;
         this.ft.htmlText = "<font color=\'#6CEBA5\'>" + LanResManager.getLanCommonTextWords("帮派：") + "</font>";
         addChild(this.ft);
         this.ftBP = new FTextArea();
         this.ftBP.x = 65 + 135;
         this.ftBP.y = 120;
         this.ftBP.width = 150;
         this.ftBP.height = 25;
         addChild(this.ftBP);
         this.ft = new FTextArea();
         this.ft.x = 25 + 135;
         this.ft.y = 135;
         this.ft.width = 40;
         this.ft.height = 25;
         this.ft.htmlText = "<font color=\'#6CEBA5\'>" + LanResManager.getLanCommonTextWords("配偶：") + "</font>";
         addChild(this.ft);
         this.ftPO = new FTextArea();
         this.ftPO.x = 65 + 135;
         this.ftPO.y = 135;
         this.ftPO.width = 150;
         this.ftPO.height = 25;
         addChild(this.ftPO);
         this.ft = new FTextArea();
         this.ft.x = 220 + 135;
         this.ft.y = 20;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.htmlText = "<font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("综合战力评定：") + "</font>";
         addChild(this.ft);
         this.ftZH = new FTextArea();
         this.ftZH.x = 335 + 135;
         this.ftZH.y = 20;
         this.ftZH.width = 160;
         this.ftZH.height = 40;
         this.ftZH.textColor = StaticValue.WHITE;
         addChild(this.ftZH);
         this.ft1 = new FTextArea();
         this.ft1.x = 400 + 135;
         this.ft1.y = 20;
         this.ft1.width = 125;
         this.ft1.height = 25;
         this.ft1.htmlText = "<font size=\'16\' color=\'#6CEBA5\'>" + LanResManager.getLanCommonTextWords("战力排名：") + "</font>";
         addChild(this.ft1);
         this.ftZL = new FTextArea();
         this.ftZL.x = 500 + 135;
         this.ftZL.y = 20;
         this.ftZL.width = 60;
         this.ftZL.height = 25;
         addChild(this.ftZL);
         this.spr = new Sprite();
         addChild(this.spr);
         this.spr.x = 0;
         this.spr.y = 0;
         with(this.spr.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,700,430);
            endFill();
         }
         this.initBtnSpr();
         this.ico = new CharAttributeOccultIco();
         addChild(this.ico);
         this.ico.x = 100 + 20 + 135;
         this.ico.y = 175 + 40;
      }
      
      private function initBtnSpr() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.btnLeft = new NewButton();
            this.btnLeft.skin = "zhandouliYNBtn";
            this.btnLeft.name = "btn" + (_loc1_ + 1);
            addChild(this.btnLeft);
            this.btnLeft.color = StaticValue.WHITE;
            this.btnLeft.x = 12;
            this.btnLeft.y = 40 + 35 * _loc1_;
            this.btnLeft.label = this.ar[_loc1_];
            this.btnLeft.align = "center";
            this.btnLeft.addEventListener(MouseEvent.CLICK,this.onClick);
            _loc1_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc3_:Sprite = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc3_ = this.spr.getChildByName("spr" + (_loc2_ + 1)) as Sprite;
            if(param1.target.name == "btn" + (_loc2_ + 1))
            {
               _loc3_.visible = true;
               this.check1.visible = this.ft1.visible = _loc2_ == 0 ? true : false;
            }
            else
            {
               _loc3_.visible = false;
            }
            _loc2_++;
         }
      }
      
      private function getValues(param1:RankAttackVO) : Array
      {
         var _loc7_:int = 0;
         var _loc9_:Goods = null;
         var _loc2_:Array = new Array();
         var _loc3_:Object = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("人物战斗力") + "：";
         _loc3_.top1 = param1.playerActNum;
         _loc3_.left = LanResManager.getLanCommonTextWords("等级加成：") + param1.pact_LvNum + "<br />" + LanResManager.getLanCommonTextWords("配偶加成：") + param1.pact_SpouseNum + "<br />" + LanResManager.getLanCommonTextWords("血魂丹加成：") + param1.pact_XueHunDanNum + "<br/>" + LanResManager.getLanCommonTextWords("长生丹加成：") + param1.pact_ChangShengDanNum + "<br />" + LanResManager.getLanCommonTextWords("运程加成：") + param1.pact_YunChengNum + "<br />" + LanResManager.getLanCommonTextWords("降龙晶") + LanResManager.getLanCommonTextWords("已使用") + GameState.dictMainStatus[725245] + "<br />" + LanResManager.getLanCommonTextWords("飞龙晶") + LanResManager.getLanCommonTextWords("已使用") + GameState.dictMainStatus[725246] + "<br />" + LanResManager.getLanCommonTextWords("潜龙晶") + LanResManager.getLanCommonTextWords("已使用") + GameState.dictMainStatus[725247] + "<br />" + LanResManager.getLanCommonTextWords("舞龙晶") + LanResManager.getLanCommonTextWords("已使用") + GameState.dictMainStatus[725248] + "<br />" + LanResManager.getLanCommonTextWords("云龙晶") + LanResManager
         .getLanCommonTextWords("已使用") + GameState.dictMainStatus[725249] + "<br />" + LanResManager.getLanCommonTextWords("天龙晶") + LanResManager.getLanCommonTextWords("已使用") + GameState.dictMainStatus[725250];
         _loc3_.right = LanResManager.getLanCommonTextWords("潜能点加成：") + param1.pact_PointNum + "<br />" + LanResManager.getLanCommonTextWords("血灵丹加成：") + param1.pact_XueLingDanNum + "<br />" + LanResManager.getLanCommonTextWords("武魂丹加成：") + param1.pact_WuHunDanNum + "<br />" + LanResManager.getLanCommonTextWords("龙须丹加成：") + param1.pact_LongXuDanNum + "<br />" + LanResManager.getLanCommonTextWords("武学层数：") + param1.skillActNum + "<br />" + LanResManager.getLanCommonTextWords("将魂战斗力：") + param1.wuxue_jianghunNum + "<br />" + "Bách Thú Ấn" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState.dictMainStatus[42583] + "<br />" + "Thiên Thạch" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState.dictMainStatus[42218] + "<br />" + "Địa Thạch" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState.dictMainStatus[42219] + "<br />" + "Nhân Thạch" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState.dictMainStatus[42220] + "<br />" + "Thần Thạch" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState
         .dictMainStatus[42221] + "<br />" + "Ma Thạch" + LanResManager.getLanCommonTextWords("已使用") + ":" + GameState.dictMainStatus[42222];
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("基础战斗力") + "：";
         _loc3_.top1 = param1.basicsActNum;
         _loc3_.left = LanResManager.getLanCommonTextWords("肉身加成：") + param1.nact_RouShen + "<br />" + LanResManager.getLanCommonTextWords("丹田加成：") + param1.nact_DanTian + "<br />" + LanResManager.getLanCommonTextWords("经脉加成：") + param1.nact_JingMai + "<br />" + LanResManager.getLanCommonTextWords("四灵阵加成：") + param1.nact_SiLingZhen + "<br />" + LanResManager.getLanCommonTextWords("五行之刃加成：") + param1.nact_WuXingZhiRen + "<br />" + LanResManager.getLanCommonTextWords("奇门阵加成：") + param1.nact_QiMenZhen;
         _loc3_.right = LanResManager.getLanCommonTextWords("洞箫加成：") + param1.nact_DongXiao + "<br />" + LanResManager.getLanCommonTextWords("暗器加成：") + param1.nact_AnQi + "<br />" + LanResManager.getLanCommonTextWords("弓箭加成：") + param1.nact_GongJian + "<br />" + LanResManager.getLanCommonTextWords("藏经阁加成：") + param1.nact_CangJingGe + "<br />" + LanResManager.getLanCommonTextWords("修行加成") + "：" + param1.nact_XiuWei + "<br />" + LanResManager.getLanCommonTextWords("十八铜人加成：") + param1.wuxue_ShiBaTongRenNum;
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("装备战斗力") + "：";
         _loc3_.top1 = param1.equipActNum;
         _loc3_.left = LanResManager.getLanCommonTextWords("装备等级：") + param1.equip_LvNum + "<br />" + LanResManager.getLanCommonTextWords("装备星级：") + param1.equip_StarNum + "<br />" + LanResManager.getLanCommonTextWords("附加属性：") + param1.equip_ShuXingNum + "<br />" + LanResManager.getLanCommonTextWords("特殊武器：") + param1.equip_TeShuWuQiNum + "<br />" + LanResManager.getLanCommonTextWords("护身符加成：") + param1.equip_HuShenFuNum + "<br />" + LanResManager.getLanCommonTextWords("勋章加成：") + param1.equip_XunZhang;
         _loc3_.right = LanResManager.getLanCommonTextWords("装备颜色：") + param1.equip_EquipColorNum + "<br />" + LanResManager.getLanCommonTextWords("宝石加成：") + param1.equip_StongNum + "<br />" + LanResManager.getLanCommonTextWords("战纹加成：") + param1.equip_ZhanWenNum + "<br />" + LanResManager.getLanCommonTextWords("玉佩加成：") + param1.equip_YuPei + "<br />" + LanResManager.getLanCommonTextWords("徽章加成：") + param1.equip_HuiZhang + "<br />" + LanResManager.getLanCommonTextWords("战旗加成：") + param1.equip_ZhanQi;
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("坐骑战斗力") + "：";
         _loc3_.top1 = param1.mountActNum;
         _loc3_.left = LanResManager.getLanCommonTextWords("坐骑等级：") + param1.mount_LvNum + "<br />" + LanResManager.getLanCommonTextWords("坐骑品级：") + param1.mount_PinJiNum + "<br />" + LanResManager.getLanCommonTextWords("坐骑悟性：") + param1.mount_WuXingNum + "<br />" + LanResManager.getLanCommonTextWords("潜能丹：") + param1.mount_QianNengDanNum + "<br />" + LanResManager.getLanCommonTextWords("坐骑神丹：") + param1.mount_ShenDanNum;
         _loc3_.right = LanResManager.getLanCommonTextWords("坐骑阶段：") + param1.mount_JieDuanNum + "<br />" + LanResManager.getLanCommonTextWords("坐骑技能：") + param1.mount_SkillNum + "<br />" + LanResManager.getLanCommonTextWords("梦幻度：") + param1.mount_MengHuanDuNum + "<br />" + LanResManager.getLanCommonTextWords("潜能点：") + param1.mount_PointNum;
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("武学战斗力") + "：";
         _loc3_.top1 = param1.WuxueActNum;
         _loc3_.left = LanResManager.getLanCommonTextWords("八卦掌加成：") + param1.nact_BaGuaZhang + "<br />" + LanResManager.getLanCommonTextWords("降龙十八掌加成：") + param1.nact_XiangLongShiBaZhang + "<br />" + LanResManager.getLanCommonTextWords("飞龙探云手：") + param1.nact_FeiLongTanYunShou + "<br />" + LanResManager.getLanCommonTextWords("独孤九剑加成：") + param1.nact_DuGuJiuJian + "<br />" + LanResManager.getLanCommonTextWords("五形拳加成：") + param1.wuxue_WuXingQuanNum + "<br />" + LanResManager.getLanCommonTextWords("六脉神剑加成：") + param1.wuxue_LiuMaiShenJianNum + "<br />" + LanResManager.getLanCommonTextWords("北冥神功加成：") + param1.wuxue_BeiMingShenGongNum + "<br />" + LanResManager.getLanCommonTextWords("神照经加成：") + param1.wuxue_ShenZhaoJingNum + "<br />" + LanResManager.getLanCommonTextWords("金蝉脱壳加成：") + param1.wuxue_jinchangongfaNum + "<br />" + LanResManager.getLanCommonTextWords("北斗七星阵加成：") + param1.wuxue_qixingzhenfaNum + "<br />" + LanResManager.getLanCommonTextWords("赤血魔阵加成：") + param1.wuxue_chixuemozhenNum + "<br />" + LanResManager
         .getLanCommonTextWords("天使之翼加成：") + param1.wuxue_tianshizhiyiNum + "<br />" + LanResManager.getLanCommonTextWords("碧海潮生曲加成：") + param1.wuxue_bihaichaoshengNum + "<br />" + LanResManager.getLanCommonTextWords("天门阵加成：") + param1.wuxue_tianmenzhenNum;
         _loc3_.right = LanResManager.getLanCommonTextWords("九阳神功加成：") + param1.nact_JiuYang + "<br />" + LanResManager.getLanCommonTextWords("易筋经：") + param1.nact_YiJinJing + "<br />" + LanResManager.getLanCommonTextWords("洗髓经：") + param1.nact_XiSuiJing + "<br />" + LanResManager.getLanCommonTextWords("九阴真经：") + param1.nact_JiuYinZhenJing + "<br />" + LanResManager.getLanCommonTextWords("金钟罩加成") + "：" + param1.wuxue_JinZhongZhaoNum + "<br />" + LanResManager.getLanCommonTextWords("太玄神功：") + param1.wuxue_TaiXuanShenGongNum + "<br />" + LanResManager.getLanCommonTextWords("紫霞神功加成：") + param1.wuxue_ZiXiaShenGongNum + "<br />" + LanResManager.getLanCommonTextWords("七伤拳加成：") + param1.wuxue_QiShangQuanNum + "<br />" + LanResManager.getLanCommonTextWords("九曲黄河阵加成：") + param1.wuxue_jiuquhuangheNum + "<br />" + LanResManager.getLanCommonTextWords("真武七截阵加成：") + param1.wuxue_zhenwuqijieNum + "<br />" + LanResManager.getLanCommonTextWords("金刚伏魔圈加成：") + param1.wuxue_jingangfumoquanNum + "<br />" + LanResManager
         .getLanCommonTextWords("逍遥御风加成：") + param1.wuxue_xiaoyaoyufengNum + "<br />" + LanResManager.getLanCommonTextWords("擒龙功加成：") + param1.wuxue_qinlonggongNum;
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("勋章战斗力") + "：";
         _loc3_.top1 = param1.xunzhangNum;
         var _loc4_:int = int(param1.xunzhangArr.length);
         var _loc5_:String = "";
         var _loc6_:int = _loc4_;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            if(int(param1.xunzhangArr[_loc7_].id) != 0)
            {
               _loc9_ = new Goods(int(param1.xunzhangArr[_loc7_].id));
               _loc5_ += _loc9_.res.name + "：     " + param1.xunzhangArr[_loc7_].value + "<br />";
            }
            _loc7_++;
         }
         _loc5_ = _loc5_.substr(0,_loc5_.length - 6);
         _loc3_.left = _loc5_;
         var _loc8_:String = "";
         _loc8_ = "";
         _loc3_.right = _loc8_;
         _loc2_.push(_loc3_);
         _loc3_ = new Object();
         _loc3_.top = LanResManager.getLanCommonTextWords("神兵战斗力") + "：";
         _loc3_.top1 = param1.shenbingNum;
         _loc4_ = int(param1.shenbingArr.length);
         _loc5_ = "";
         _loc6_ = _loc4_;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            if(int(param1.shenbingArr[_loc7_].id) != 0)
            {
               _loc9_ = new Goods(int(param1.shenbingArr[_loc7_].id));
               _loc5_ += _loc9_.res.name + "：     " + param1.shenbingArr[_loc7_].value + "<br />";
            }
            _loc7_++;
         }
         _loc5_ = _loc5_.substr(0,_loc5_.length - 6);
         _loc3_.left = _loc5_;
         _loc3_.right = "";
         _loc2_.push(_loc3_);
         return _loc2_;
      }
      
      private function setData(param1:RankAttackVO, param2:Array) : void
      {
         var i:int;
         var bitLine:Bitmap = null;
         var vo:RankAttackVO = param1;
         var arr:Array = param2;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         i = 0;
         while(i < 8)
         {
            this.sprRight = new Sprite();
            this.sprRight.name = "spr" + (i + 1);
            this.spr.addChild(this.sprRight);
            this.sprRight.x = 310;
            this.sprRight.y = 45;
            with(this.sprRight.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,390,375);
               endFill();
            }
            if(i == 0)
            {
               this.sprRight.visible = true;
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34 + 34;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34 + 34 + 34;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34 + 34 + 34 + 34;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34 + 34 + 34 + 34 + 34;
               this.sprRight.addChild(bitLine);
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1 + 34 + 34 + 34 + 34 + 34 + 34;
               this.sprRight.addChild(bitLine);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.width = 220;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[0].top + "  " + arr[0].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.width = 220;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[1].top + "  " + arr[1].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34 + 34;
               this.ft.width = 220;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[2].top + "  " + arr[2].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34 + 34 + 34;
               this.ft.width = 220;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[3].top + "  " + arr[3].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34 + 34 + 34 + 34;
               this.ft.width = 220;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[4].top + "  " + arr[4].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34 + 34 + 34 + 34 + 34;
               this.ft.width = 220;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[5].top + "  " + arr[5].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 95;
               this.ft.y = 5 + 34 + 34 + 34 + 34 + 34 + 34;
               this.ft.width = 220;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.height = 25;
               this.ft.htmlText = "<font size=\'15\'>" + arr[6].top + "  " + arr[6].top1 + "</font>";
               this.sprRight.addChild(this.ft);
            }
            else
            {
               this.sprRight.visible = false;
               bitLine = StaticValue.getBitmapByClassName("ui.zhandouli.line");
               bitLine.x = 0;
               bitLine.y = 1;
               this.sprRight.addChild(bitLine);
               this.ft = new FTextArea();
               this.ft.x = 130;
               this.ft.y = 5;
               this.ft.width = 225;
               this.ft.height = 25;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.htmlText = "<font size=\'15\'>" + arr[i - 1].top + "  " + arr[i - 1].top1 + "</font>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 15;
               this.ft.y = 40;
               this.ft.width = 300;
               this.ft.height = 330;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.htmlText = "<textformat leading=\'2\'><font size=\'13\'>" + arr[i - 1].left + "</font></textformat>";
               this.sprRight.addChild(this.ft);
               this.ft = new FTextArea();
               this.ft.x = 200;
               this.ft.y = 40;
               this.ft.width = 180;
               this.ft.height = 330;
               this.ft.textColor = StaticValue.WHITE;
               this.ft.htmlText = "<textformat leading=\'2\'><font size=\'13\'>" + arr[i - 1].right + "</font></textformat>";
               this.sprRight.addChild(this.ft);
            }
            i++;
         }
      }
      
      private function initUI(param1:RankAttackVO) : void
      {
         this.ftName.htmlText = "<font color=\'#6CEBA5\'>" + param1.playerName + "</font>";
         this.ftLV.htmlText = "<font color=\'#6CEBA5\'>" + String(param1.lv) + "</font>";
         this.ftBP.htmlText = "<font color=\'#6CEBA5\'>" + param1.party + "</font>";
         this.ftPO.htmlText = "<font color=\'#6CEBA5\'>" + param1.spousePlayerName + "</font>";
         this.ftZH.htmlText = "<font size=\'16\'>" + param1.allActNum + "</font>";
         this.ftZL.htmlText = "<font size=\'16\' color=\'#6CEBA5\'>" + param1.rank + "</font>";
         var _loc2_:String = param1.headStr;
         this.imgs = StaticValue.getBitmapByClassName(param1.headStr);
         this.imgs.x = 30 + 5 + 5 + 20 + 135 + 6;
         this.imgs.y = 12 + 5 + 5 - 2 - 1;
         addChild(this.imgs);
      }
      
      public function avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         this._avatar.x = 96 - this._avatar.width / 2 + 135;
         this._avatar.y = 342 - this._avatar.height + 35 + 25;
      }
      
      public function setICOXiantian(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         this.ico.setXiantian(param1,param2,param3,param4);
      }
      
      public function setICORouti(param1:Boolean) : void
      {
         this.ico.setRouti(param1);
      }
      
      public function setICOHuXinYao(param1:Boolean) : void
      {
         this.ico.setHuXinYao(param1);
      }
      
      public function setICONiXi(param1:Boolean) : void
      {
         this.ico.setNiXi(param1);
      }
      
      public function setICOFengHuang(param1:Boolean) : void
      {
         this.ico.setFengHuang(param1);
      }
      
      public function setICOWuhun(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:Boolean, param9:int) : void
      {
         this.ico.setWuhun(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setStarState(param1:Boolean, param2:int, param3:Boolean, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:int, param13:Boolean, param14:int, param15:Boolean, param16:int) : void
      {
         this.ico.setState(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function setSiShengShouState(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.ico.setSiShengShouState(param1,param2,param3,param4);
      }
      
      public function setAvaterXY(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         if(param1)
         {
            this._avatar.x = 96 - this._avatar.width / 2 + 135;
            this._avatar.y = 342 - this._avatar.height + 35 + 25;
         }
         else
         {
            this._avatar.x = param2;
            this._avatar.y = param3;
         }
      }
      
      public function setValue(param1:RankAttackVO, param2:int) : void
      {
         if(param2 == 1)
         {
            this.ft1.visible = false;
            this.ftZL.visible = false;
            this.check2.visible = this.fts2.visible = GameState.dictMainStatus[735893];
            this.check3.visible = this.fts3.visible = GameState.dictMainStatus[735950];
            this.check4.visible = this.fts4.visible = GameState.dictMainStatus[735951];
            this.check5.visible = this.fts5.visible = GameState.dictMainStatus[736951];
            this.check6.visible = this.fts6.visible = GameState.dictMainStatus[737533];
            this.check7.visible = this.fts7.visible = GameState.dictMainStatus[738184];
            this.check8.visible = this.fts8.visible = GameState.dictMainStatus[738397];
            this.check9.visible = this.fts9.visible = GameState.dictMainStatus[738968];
            this.check10.visible = this.fts10.visible = GameState.dictMainStatus[739540];
            this.check11.visible = this.fts11.visible = GameState.dictMainStatus[739826];
            this.check12.visible = this.fts12.visible = GameState.dictMainStatus[741401];
            this.check13.visible = this.fts13.visible = GameState.dictMainStatus[741949];
            this.check14.visible = this.fts14.visible = GameState.dictMainStatus[742224];
         }
         else
         {
            this.ft1.visible = true;
            this.ftZL.visible = true;
            this.check2.visible = this.fts2.visible = false;
         }
         this.initUI(param1);
         var _loc3_:Array = new Array();
         _loc3_ = this.getValues(param1);
         this.setData(param1,_loc3_);
         this.check1.selectState = param1.check1;
      }
   }
}

