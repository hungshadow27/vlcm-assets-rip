package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNXunzhang extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var spContainer:Sprite;
      
      private var ft:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft6:FTextArea;
      
      private var ft9:FTextArea;
      
      private var ft12:FTextArea;
      
      private var isLockOn:Boolean = false;
      
      private var ft13:FTextArea;
      
      private var ft14:FTextArea;
      
      private var ft15:FTextArea;
      
      private var ft16:FTextArea;
      
      private var ft17:FTextArea;
      
      private var ft18:FTextArea;
      
      private var ft19:FTextArea;
      
      private var ft20:FTextArea;
      
      private var ft21:FTextArea;
      
      private var ft22:FTextArea;
      
      private var ft23:FTextArea;
      
      private var ft24:FTextArea;
      
      private var check24:FCheckBox;
      
      private var ft25:FTextArea;
      
      public function YNXunzhang()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/bg.xunzhangyangcheng.swf");
         _loc1_.x = 1;
         _loc1_.y = 1;
         addChild(_loc1_);
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 280;
         this.ft.width = 390;
         this.ft.height = 22;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性") + "：</font></textformat>";
         addChild(this.ft);
         this.ft3 = new FTextArea();
         this.ft3.x = 12;
         this.ft3.y = 315;
         this.ft3.width = 390;
         this.ft3.height = 22;
         addChild(this.ft3);
         this.ft6 = new FTextArea();
         this.ft6.x = 210;
         this.ft6.y = 315;
         this.ft6.width = 390;
         this.ft6.height = 22;
         this.ft6.wordWrap = true;
         addChild(this.ft6);
         this.ft9 = new FTextArea();
         this.ft9.x = 12;
         this.ft9.y = 340;
         this.ft9.width = 390;
         this.ft9.height = 22;
         addChild(this.ft9);
         this.ft12 = new FTextArea();
         this.ft12.x = 210;
         this.ft12.y = 340;
         this.ft12.width = 390;
         this.ft12.height = 22;
         addChild(this.ft12);
         this.ft13 = new FTextArea();
         this.ft13.textColor = StaticValue.GREEN;
         this.ft13.filters = StaticValue.filter;
         this.ft13.x = 10;
         this.ft13.y = 305;
         this.ft13.width = 125;
         this.ft13.height = 22;
         this.ft13.text = new Goods(729147).res.name;
         this.ft13.visible = false;
         addChild(this.ft13);
         ToolTips.createToolTips(this.ft13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("王者-帝王1") + "<br>" + LanResManager.getLanCommonTextWords("王者-帝王2") + "<br>" + LanResManager.getLanCommonTextWords("王者-帝王3") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft14 = new FTextArea();
         this.ft14.textColor = StaticValue.GREEN;
         this.ft14.filters = StaticValue.filter;
         this.ft14.x = 10;
         this.ft14.y = 323;
         this.ft14.width = 125;
         this.ft14.height = 22;
         this.ft14.text = new Goods(729765).res.name;
         this.ft14.visible = false;
         addChild(this.ft14);
         ToolTips.createToolTips(this.ft14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("王者秘术1") + "<br>" + LanResManager.getLanCommonTextWords("王者秘术2") + "<br>" + LanResManager.getLanCommonTextWords("王者秘术3") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft15 = new FTextArea();
         this.ft15.textColor = StaticValue.GREEN;
         this.ft15.filters = StaticValue.filter;
         this.ft15.x = 10;
         this.ft15.y = 305;
         this.ft15.width = 150;
         this.ft15.height = 22;
         this.ft15.text = new Goods(730261).res.name;
         this.ft15.visible = false;
         addChild(this.ft15);
         ToolTips.createToolTips(this.ft15,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(730261).res.desc + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft16 = new FTextArea();
         this.ft16.textColor = StaticValue.GREEN;
         this.ft16.filters = StaticValue.filter;
         this.ft16.x = 10;
         this.ft16.y = 323;
         this.ft16.width = 150;
         this.ft16.height = 22;
         this.ft16.text = new Goods(730439).res.name;
         this.ft16.visible = false;
         addChild(this.ft16);
         ToolTips.createToolTips(this.ft16,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(730439).res.desc + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft17 = new FTextArea();
         this.ft17.textColor = StaticValue.GREEN;
         this.ft17.filters = StaticValue.filter;
         this.ft17.x = 10;
         this.ft17.y = 341;
         this.ft17.width = 150;
         this.ft17.height = 22;
         this.ft17.text = new Goods(730450).res.name;
         this.ft17.visible = false;
         addChild(this.ft17);
         ToolTips.createToolTips(this.ft17,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(730450).res.desc + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft18 = new FTextArea();
         this.ft18.textColor = StaticValue.GREEN;
         this.ft18.filters = StaticValue.filter;
         this.ft18.x = 160;
         this.ft18.y = 305;
         this.ft18.width = 150;
         this.ft18.height = 22;
         this.ft18.text = new Goods(730534).res.name;
         this.ft18.visible = false;
         addChild(this.ft18);
         ToolTips.createToolTips(this.ft18,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Bích Hoa Quyết: Khi chiến đấu và phải chịu 20 hiệu quả bất lợi từ phía" + "<br>" + "đối phương thì Bích Hoa Quyết sẽ kích hoạt. Giúp bản thân ngay lập tức" + "<br>" + "giải trừ tất cả hiệu quả bật lợi ngay lập tức. Thời gian chờ là 180 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft19 = new FTextArea();
         this.ft19.textColor = StaticValue.GREEN;
         this.ft19.filters = StaticValue.filter;
         this.ft19.x = 160;
         this.ft19.y = 323;
         this.ft19.width = 150;
         this.ft19.height = 22;
         this.ft19.text = "Táo Quân";
         this.ft19.visible = false;
         addChild(this.ft19);
         ToolTips.createToolTips(this.ft19,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Táo Quân Thần Lực : Khi tấn công liên tục 30 lần sẽ kích" + "<br>" + "hoạt hiệu quả giúp bản nhận nhận được hiệu quả miễn " + "<br>" + "dịch 100% Sát Thương trong 15 giây. Đồng thời trong" + "<br>" + "thời gian hiệu quả, Nếu bản thân tấn công nhân vật nào" + "<br>" + "thì nhân vật đó sẽ bị giảm 10.000.000 Tầng Võ trong 5" + "<br>" + "giây. Không tính cộng dồn. Thời gian chờ là 180 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft20 = new FTextArea();
         this.ft20.textColor = StaticValue.GREEN;
         this.ft20.filters = StaticValue.filter;
         this.ft20.x = 160;
         this.ft20.y = 341;
         this.ft20.width = 150;
         this.ft20.height = 22;
         this.ft20.text = "Phi Thăng Chiến Thủ";
         this.ft20.visible = false;
         addChild(this.ft20);
         ToolTips.createToolTips(this.ft20,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hiệu quả : Phi Thăng Chiến Thủ" + "<br>" + "- Kháng 100% các hiệu quả kỹ năng giảm 10% Sinh Lực mỗi giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft21 = new FTextArea();
         this.ft21.textColor = StaticValue.GREEN;
         this.ft21.filters = StaticValue.filter;
         this.ft21.x = 305;
         this.ft21.y = 305;
         this.ft21.width = 150;
         this.ft21.height = 22;
         this.ft21.text = "Hỗn Độn Sinh Giáp";
         this.ft21.visible = false;
         addChild(this.ft21);
         ToolTips.createToolTips(this.ft21,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Hỗn Độn Sinh Giáp: " + "<br>" + "Khi bị tấn công liên tục bằng hệ chiêu thức của Lục Long sẽ lập tức kích hoạt giúp bản thân kháng cự " + "<br>" + "tuyệt đối với đối thủ trong 15 giây. Thời gian chờ là 120 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft22 = new FTextArea();
         this.ft22.textColor = StaticValue.GREEN;
         this.ft22.filters = StaticValue.filter;
         this.ft22.x = 10;
         this.ft22.y = 341;
         this.ft22.width = 150;
         this.ft22.height = 22;
         this.ft22.text = "Lực Áp Quần Ma";
         this.ft22.visible = false;
         addChild(this.ft22);
         ToolTips.createToolTips(this.ft22,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Kháng 100% hiệu quả kỹ năng : Canh Tý Kiếm" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft23 = new FTextArea();
         this.ft23.textColor = StaticValue.GREEN;
         this.ft23.filters = StaticValue.filter;
         this.ft23.x = 305;
         this.ft23.y = 323;
         this.ft23.width = 150;
         this.ft23.height = 22;
         this.ft23.text = "Linh Lộ Hoàng Phù";
         this.ft23.visible = false;
         addChild(this.ft23);
         ToolTips.createToolTips(this.ft23,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Linh Lộ Hoàng Phù: " + "<br>" + "Khi nhân vật có sinh lực dưới 30% nhảy liên tục 15 lần sẽ lập tức kích hoạt hiệu quả Linh Lộ Hoàng" + "<br>" + "Phù trong 15 giây." + "<br>" + "Xóa bỏ toàn bộ các hiệu quả xấu. Kèm theo đó, bản thân lập tức hồi phục 100% Sinh Lực + Nội Lực" + "<br>" + "+ Thể Lưc. Bản thân miễn dịch sát thương kéo dài 15 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ft24 = new FTextArea();
         this.ft24.textColor = StaticValue.GREEN;
         this.ft24.filters = StaticValue.filter;
         this.ft24.x = 275;
         this.ft24.y = 341;
         this.ft24.width = 150;
         this.ft24.height = 22;
         this.ft24.text = "Sát Lang Hỏa Thánh";
         this.ft24.visible = false;
         addChild(this.ft24);
         ToolTips.createToolTips(this.ft24,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Sát Lang Hỏa Thánh: Mở hiển thị đặc biệt giúp ảo hóa thú cưỡi " + "<br>" + "Hiệu quả: Khi tấn công 100% kích hoạt kỹ năng giúp bản thân nhận được hiệu quả Sát Lang Hỏa " + "<br>" + "Thánh kéo dài suốt 90 giây." + "<br>" + "Trong thời gian hiệu quả, bản thân đánh vào đối thủ nào thì đối thủ đó lập tức phải chịu các hiệu quả: " + "<br>" + "Tốc Độ Đánh: Giảm 90%, Tốc Độ Chạy: Giảm 9 điểm, Tầng Võ Công: Giảm 90.000.000, Thể Lực và " + "<br>" + "Nội Lực: Không thể hồi phục" + "<br>" + "Thời gian hiệu quả kéo dài 9 giây. " + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check24 = new FCheckBox();
         this.check24.visible = false;
         addChild(this.check24);
         this.check24.x = 385;
         this.check24.y = 341;
         this.check24.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft25 = new FTextArea();
         this.ft25.textColor = StaticValue.GREEN;
         this.ft25.filters = StaticValue.filter;
         this.ft25.x = 160;
         this.ft25.y = 305;
         this.ft25.width = 150;
         this.ft25.height = 22;
         this.ft25.text = "Vũ Khúc Loạn Thế";
         this.ft25.visible = false;
         addChild(this.ft25);
         ToolTips.createToolTips(this.ft25,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Vũ Khúc Loạn Thế: Khi bản thân đánh vào đối thủ liên tục nhiều lần sẽ" + "<br>" + "có tỷ lệ kích hoạt kỹ năng Vũ Khúc Loạn Thế kéo dài liên tục 60 giây." + "<br>" + "Trong thời gian hiệu quả, mỗi 2 giây bản thân sẽ hồi phục 50% Sinh-Nội-Thể Lực." + "<br>" + "Bản thân đánh vào đối thủ nào thì đối thủ đó sẽ bị làm chậm 90%. " + "<br>" + "Sát thương phải chịu từ đối thủ sẽ giảm 80%. Thời gian chờ là 180 giây." + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.spContainer = new Sprite();
         this.spContainer.x = 3;
         this.spContainer.y = 1;
         with(this.spContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,395,275);
            endFill();
         }
         addChild(this.spContainer);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check24:
               PipeManager.sendMsg(PipeConstants.UI_MeiRenPanel_GOUXUAN_CLICK,[this.check24.selectState,731886]);
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isLockOn)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function setXunZhang(param1:Array, param2:int, param3:int, param4:int, param5:Boolean) : void
      {
         var len:int;
         var j:int;
         var k:int;
         var bg_len:int;
         var container:Sprite = null;
         var go:Goods = null;
         var item:ItemFace = null;
         var imgSpr:Sprite = null;
         var hdPic:DisplayObject = null;
         var i:* = undefined;
         var dhAry:Array = param1;
         var have:int = param2;
         var playerID:int = param3;
         var ty:int = param4;
         var isMainChar:Boolean = param5;
         if(playerID == -1)
         {
            this.isLockOn = true;
         }
         while(this.spContainer.numChildren > 0)
         {
            this.spContainer.removeChildAt(0);
         }
         len = int(dhAry.length);
         j = 0;
         k = 0;
         bg_len = 0;
         if(len < 12)
         {
            bg_len = 12;
         }
         else
         {
            bg_len = len;
         }
         if(ty != 4)
         {
            if(ty != 3)
            {
               this.ft13.visible = false;
               this.ft14.visible = false;
               if(ty == 2)
               {
                  this.ft3.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("3个勋章：攻击+20000   所有武功+2") + "</font></textformat>";
                  this.ft6.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("6个勋章：攻击+40000   所有武功+4") + "</font></textformat>";
                  this.ft9.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("9个勋章：攻击+80000   所有武功+8") + "</font></textformat>";
                  this.ft12.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("12个勋章：攻击+120000   所有武功+12") + "</font></textformat>";
               }
               else
               {
                  this.ft3.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("3个勋章：防守+20000   所有武功+2") + "</font></textformat>";
                  this.ft6.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("6个勋章：防守+40000   所有武功+4") + "</font></textformat>";
                  this.ft9.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("9个勋章：防守+80000   所有武功+8") + "</font></textformat>";
                  this.ft12.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("12个勋章：防守+120000   所有武功+12") + "</font></textformat>";
               }
            }
            else
            {
               this.ft13.visible = true;
               this.ft14.visible = true;
            }
         }
         if(have < 6 && have > 2)
         {
            this.ft3.textColor = StaticValue.GREEN;
            this.ft6.textColor = StaticValue.BlUE20;
            this.ft9.textColor = StaticValue.BlUE20;
            this.ft12.textColor = StaticValue.BlUE20;
         }
         else if(have > 5 && have < 9)
         {
            this.ft3.textColor = StaticValue.GREEN;
            this.ft6.textColor = StaticValue.GREEN;
            this.ft9.textColor = StaticValue.BlUE20;
            this.ft12.textColor = StaticValue.BlUE20;
         }
         else if(have > 8 && have < 12)
         {
            this.ft3.textColor = StaticValue.GREEN;
            this.ft6.textColor = StaticValue.GREEN;
            this.ft9.textColor = StaticValue.GREEN;
            this.ft12.textColor = StaticValue.BlUE20;
         }
         else if(have == 12)
         {
            this.ft3.textColor = StaticValue.GREEN;
            this.ft6.textColor = StaticValue.GREEN;
            this.ft9.textColor = StaticValue.GREEN;
            this.ft12.textColor = StaticValue.GREEN;
         }
         else
         {
            this.ft3.textColor = StaticValue.BlUE20;
            this.ft6.textColor = StaticValue.BlUE20;
            this.ft9.textColor = StaticValue.BlUE20;
            this.ft12.textColor = StaticValue.BlUE20;
         }
         i = 0;
         while(i < bg_len)
         {
            container = new Sprite();
            this.spContainer.addChild(container);
            with(container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,65,68);
               endFill();
            }
            container.name = i;
            container.x = k * 94;
            container.y = j * 91;
            hdPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/bg.xunzhang.kuang.swf");
            hdPic.y = 2;
            hdPic.x = 2;
            container.addChild(hdPic);
            if(i < len)
            {
               go = new Goods(dhAry[i].id);
               go.position = dhAry[i].position;
               item = new ItemFace(go,65,65);
               item.x = 16;
               item.y = 14;
               container.addChild(item);
               item.name = i;
               item.filters = [];
               imgSpr = new Sprite();
               imgSpr.mouseChildren = false;
               imgSpr.mouseEnabled = false;
               container.addChild(imgSpr);
               if(dhAry[i].state == 1)
               {
                  hdPic = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xunzhangduihuan/huode.swf");
                  hdPic.x = 8;
                  hdPic.y = 13;
                  imgSpr.addChild(hdPic);
                  container.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
               }
            }
            k++;
            if((i + 1) % 4 == 0)
            {
               k = 0;
               j++;
            }
            i++;
         }
         this.setIsMainChar(isMainChar,ty);
      }
      
      private function setIsMainChar(param1:Boolean, param2:int) : void
      {
         if(param2 == 3)
         {
            if(param1)
            {
               this.ft13.visible = GameState.dictMainStatus[729147];
               this.ft14.visible = GameState.dictMainStatus[729765];
               this.ft22.visible = GameState.dictMainStatus[731319];
               this.ft25.visible = GameState.dictMainStatus[733726];
            }
            else
            {
               this.ft13.visible = GameState.dictTargetStatus[729147];
               this.ft14.visible = GameState.dictTargetStatus[729765];
               this.ft22.visible = GameState.dictTargetStatus[731319];
               this.ft25.visible = GameState.dictTargetStatus[733726];
            }
         }
         else if(param2 == 4)
         {
            if(param1)
            {
               this.ft15.visible = GameState.dictMainStatus[730261];
               this.ft16.visible = GameState.dictMainStatus[730439];
               this.ft17.visible = GameState.dictMainStatus[730450];
               this.ft18.visible = GameState.dictMainStatus[730534];
               this.ft19.visible = GameState.dictMainStatus[730693];
               this.ft20.visible = GameState.dictMainStatus[731101];
               this.ft21.visible = GameState.dictMainStatus[731198];
               this.ft23.visible = GameState.dictMainStatus[731575];
               this.ft24.visible = GameState.dictMainStatus[731886];
               this.check24.visible = this.ft24.visible;
            }
            else
            {
               this.ft15.visible = GameState.dictTargetStatus[730261];
               this.ft16.visible = GameState.dictTargetStatus[730439];
               this.ft17.visible = GameState.dictTargetStatus[730450];
               this.ft18.visible = GameState.dictTargetStatus[730534];
               this.ft19.visible = GameState.dictTargetStatus[730693];
               this.ft20.visible = GameState.dictTargetStatus[731101];
               this.ft21.visible = GameState.dictTargetStatus[731198];
               this.ft23.visible = GameState.dictTargetStatus[731575];
               this.ft24.visible = GameState.dictTargetStatus[731886];
               this.check24.visible = this.ft24.visible;
            }
         }
      }
   }
}

