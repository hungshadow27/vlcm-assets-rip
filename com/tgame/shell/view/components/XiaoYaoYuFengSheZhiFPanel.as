package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.BaseItem;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class XiaoYaoYuFengSheZhiFPanel extends FPanel
   {
      
      public static const UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK:String = "UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK";
      
      public static const UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK:String = "UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK";
      
      public static const UI_XIAOYAOYUFENGSHEZHI_OK_CLICK:String = "UI_XIAOYAOYUFENGSHEZHI_OK_CLICK";
      
      public static const UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN:String = "UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN";
      
      public static const UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP:String = "UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP";
      
      public static const UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG:String = "UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG";
      
      public static const UI_BACKPACK_DRAG_STRAT:String = "UI_BACKPACK_DRAG_STRAT";
      
      private var kuang:Bitmap;
      
      private var bit:Bitmap;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var tf:TextFormat;
      
      public var zishenSpr:Sprite;
      
      private var lookingId:int;
      
      public var shiyongSpr:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      public function XiaoYaoYuFengSheZhiFPanel()
      {
         var miao:FTextArea;
         var zishen:FTextArea = null;
         var shiyong:FTextArea = null;
         var i:int = 0;
         var n:int = 0;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 550 - 15 - 68 - 2;
         height = 430 - 21 - 31;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("逍遥御风设置");
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiaoyaoyufeng/jinengban.swf");
         this.bg.visible = true;
         this.bg.x = 10;
         this.bg.y = 1 + 4 - 2;
         this.bgSpr.addChild(this.bg);
         zishen = new FTextArea();
         addChild(zishen);
         zishen.multiline = true;
         zishen.autoSize = TextFieldAutoSize.CENTER;
         zishen.wordWrap = true;
         zishen.width = 150;
         zishen.height = 30;
         zishen.x = 100 + 13 - 18 + 1;
         zishen.y = 20 - 8 - 1;
         zishen.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("自身技能") + "</font>";
         shiyong = new FTextArea();
         addChild(shiyong);
         shiyong.multiline = true;
         shiyong.autoSize = TextFieldAutoSize.CENTER;
         shiyong.wordWrap = true;
         shiyong.width = 150;
         shiyong.height = 30;
         shiyong.x = 350 + 13 - 45;
         shiyong.y = 20 - 8 - 1;
         shiyong.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用技能") + "</font>";
         i = 0;
         while(i < 5)
         {
            n = 0;
            while(n < 4)
            {
               this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.kuang.x = 33 + 45 * i;
               this.kuang.y = 57 + 45 * n;
               n++;
            }
            i++;
         }
         this.zishenSpr = new Sprite();
         with(this.zishenSpr)
         {
            x = 33 + 2 - 9 - 2 - 1;
            y = 57 + 2 - 22;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,205,168);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.zishenSpr);
         this.zishenSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown2);
         this.zishenSpr.addEventListener(MouseEvent.MOUSE_UP,this.showMenu2);
         i = 0;
         while(i < 5)
         {
            n = 0;
            while(n < 4)
            {
               this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.kuang.x = 33 + 45 * i + 250;
               this.kuang.y = 57 + 45 * n;
               n++;
            }
            i++;
         }
         this.shiyongSpr = new Sprite();
         with(this.shiyongSpr)
         {
            x = 33 + 250 + 2 - 42;
            y = 57 + 2 - 22;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,205,168);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.shiyongSpr);
         this.shiyongSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.shiyongSpr.addEventListener(MouseEvent.MOUSE_UP,this.showMenu);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 80 + 3 + 18 - 16 - 1;
         this.shangyiyeButton.y = 250 - 10 - 4 - 29;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.filters = StaticValue.filter;
         this.cengshu.background = true;
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.multiline = true;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 35;
         this.cengshu.height = 15;
         this.cengshu.x = 100 + 13 + 18 - 16 - 1 - 8;
         this.cengshu.y = 250 - 10 - 4 - 29;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + "2/2" + "</font>";
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 120 + 23 + 18 - 16 - 1;
         this.xiayiyeButton.y = 250 - 10 - 4 - 29;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         miao = new FTextArea();
         addChild(miao);
         miao.multiline = true;
         miao.autoSize = TextFieldAutoSize.CENTER;
         miao.wordWrap = true;
         miao.width = 500 + 30 - 15 - 65 - 15;
         miao.height = 95;
         miao.x = 20 + 20 - 17 - 5 + 2;
         miao.y = 20 + 275 + 5 - 34 - 1 - 31;
         miao.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "" + LanResManager.getLanCommonTextWords("1:将左侧技能拖动至右侧技能栏，则使用逍遥御风时，会自动按顺序使用右侧技能栏中的技能。") + "<br>" + LanResManager.getLanCommonTextWords("2:如果想删除右侧技能栏中的技能，直接将右侧技能栏中的技能图标拖动至技能栏外即可。") + "</font>";
         this.okBtn = new SecondButton();
         addChild(this.okBtn);
         this.okBtn.x = 240 + 50 + 130 - 188 - 34;
         this.okBtn.y = 205 + 17 + 6 - 4 + 88 + 53 - 21 - 31;
         this.okBtn.label = LanResManager.getLanCommonTextWords("确认设置");
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:*) : void
      {
         dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_OK_CLICK,"",0));
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_OK_CLICK,"",1));
         }
      }
      
      private function onMouseDown2(param1:MouseEvent) : void
      {
         this.zishenSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.zishenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_ZISHENSKILL_DRAG,"",this.currItem));
            this.zishenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function showMenu2(param1:MouseEvent) : void
      {
         this.zishenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.shiyongSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.shiyongSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGDOWN,"",this.currItem));
            this.shiyongSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.shiyongSpr.mouseY > 0 && this.shiyongSpr.mouseY < 42)
         {
            if(this.shiyongSpr.mouseX > 0 && this.shiyongSpr.mouseX < 41)
            {
               _loc2_ = 1;
            }
            else if(this.shiyongSpr.mouseX > 41 && this.shiyongSpr.mouseX < 82)
            {
               _loc2_ = 2;
            }
            else if(this.shiyongSpr.mouseX > 82 && this.shiyongSpr.mouseX < 123)
            {
               _loc2_ = 3;
            }
            else if(this.shiyongSpr.mouseX > 123 && this.shiyongSpr.mouseX < 164)
            {
               _loc2_ = 4;
            }
            else if(this.shiyongSpr.mouseX > 164 && this.shiyongSpr.mouseX < 205)
            {
               _loc2_ = 5;
            }
         }
         if(this.shiyongSpr.mouseY > 42 && this.shiyongSpr.mouseY < 84)
         {
            if(this.shiyongSpr.mouseX > 0 && this.shiyongSpr.mouseX < 41)
            {
               _loc2_ = 6;
            }
            else if(this.shiyongSpr.mouseX > 41 && this.shiyongSpr.mouseX < 82)
            {
               _loc2_ = 7;
            }
            else if(this.shiyongSpr.mouseX > 82 && this.shiyongSpr.mouseX < 123)
            {
               _loc2_ = 8;
            }
            else if(this.shiyongSpr.mouseX > 123 && this.shiyongSpr.mouseX < 164)
            {
               _loc2_ = 9;
            }
            else if(this.shiyongSpr.mouseX > 164 && this.shiyongSpr.mouseX < 205)
            {
               _loc2_ = 10;
            }
         }
         if(this.shiyongSpr.mouseY > 84 && this.shiyongSpr.mouseY < 126)
         {
            if(this.shiyongSpr.mouseX > 0 && this.shiyongSpr.mouseX < 41)
            {
               _loc2_ = 11;
            }
            else if(this.shiyongSpr.mouseX > 41 && this.shiyongSpr.mouseX < 82)
            {
               _loc2_ = 12;
            }
            else if(this.shiyongSpr.mouseX > 82 && this.shiyongSpr.mouseX < 123)
            {
               _loc2_ = 13;
            }
            else if(this.shiyongSpr.mouseX > 123 && this.shiyongSpr.mouseX < 164)
            {
               _loc2_ = 14;
            }
            else if(this.shiyongSpr.mouseX > 164 && this.shiyongSpr.mouseX < 205)
            {
               _loc2_ = 15;
            }
         }
         if(this.shiyongSpr.mouseY > 126 && this.shiyongSpr.mouseY < 168)
         {
            if(this.shiyongSpr.mouseX > 0 && this.shiyongSpr.mouseX < 41)
            {
               _loc2_ = 16;
            }
            else if(this.shiyongSpr.mouseX > 41 && this.shiyongSpr.mouseX < 82)
            {
               _loc2_ = 17;
            }
            else if(this.shiyongSpr.mouseX > 82 && this.shiyongSpr.mouseX < 123)
            {
               _loc2_ = 18;
            }
            else if(this.shiyongSpr.mouseX > 123 && this.shiyongSpr.mouseX < 164)
            {
               _loc2_ = 19;
            }
            else if(this.shiyongSpr.mouseX > 164 && this.shiyongSpr.mouseX < 205)
            {
               _loc2_ = 20;
            }
         }
         if(_loc2_ == 0)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_XIAOYAOYUFENGSHEZHI_SHIYONGSKILL_DRAGUP,"",[param1,_loc2_]));
         this.shiyongSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setInitialize(param1:Array, param2:int, param3:int) : void
      {
         this.setZiShenSkill(param1);
         this.seeee(param2,param3);
      }
      
      private function seeee(param1:int, param2:int) : void
      {
         this.lookingId = param1;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         if(param1 == 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(param1 == param2)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
      }
      
      public function setZiShenSkill(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.zishenSpr.numChildren > 0)
         {
            this.zishenSpr.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            _loc2_.showKungFuTag();
            _loc2_.setShowCount(false);
            if(_loc3_ >= 0 && _loc3_ < 5)
            {
               _loc2_.x = _loc3_ * 41;
               _loc2_.y = 0;
            }
            else if(_loc3_ >= 5 && _loc3_ < 10)
            {
               _loc2_.x = 41 * (_loc3_ - 5);
               _loc2_.y = 42;
            }
            else if(_loc3_ >= 10 && _loc3_ < 15)
            {
               _loc2_.x = 41 * (_loc3_ - 10);
               _loc2_.y = 42 * 2;
            }
            else if(_loc3_ >= 15 && _loc3_ < 20)
            {
               _loc2_.x = 41 * (_loc3_ - 15);
               _loc2_.y = 42 * 3;
            }
            this.zishenSpr.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setShiYongSkill(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:BaseItem = null;
         var _loc7_:int = 0;
         while(this.shiyongSpr.numChildren > 0)
         {
            _loc2_ = this.shiyongSpr.getChildAt(0) as ItemFace;
            this.shiyongSpr.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc7_ = _loc5_.position;
            _loc2_ = new ItemFace(_loc5_);
            _loc2_.showRedMask();
            _loc2_.setShowCount(false);
            switch(_loc7_)
            {
               case 1:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case 2:
                  _loc2_.x = 41;
                  _loc2_.y = 0;
                  break;
               case 3:
                  _loc2_.x = 41 * 2;
                  _loc2_.y = 0;
                  break;
               case 4:
                  _loc2_.x = 41 * 3;
                  _loc2_.y = 0;
                  break;
               case 5:
                  _loc2_.x = 41 * 4;
                  _loc2_.y = 0;
                  break;
               case 6:
                  _loc2_.x = 0;
                  _loc2_.y = 42;
                  break;
               case 7:
                  _loc2_.x = 41;
                  _loc2_.y = 42;
                  break;
               case 8:
                  _loc2_.x = 41 * 2;
                  _loc2_.y = 42;
                  break;
               case 9:
                  _loc2_.x = 41 * 3;
                  _loc2_.y = 42;
                  break;
               case 10:
                  _loc2_.x = 41 * 4;
                  _loc2_.y = 42;
                  break;
               case 11:
                  _loc2_.x = 0;
                  _loc2_.y = 42 * 2;
                  break;
               case 12:
                  _loc2_.x = 41;
                  _loc2_.y = 42 * 2;
                  break;
               case 13:
                  _loc2_.x = 41 * 2;
                  _loc2_.y = 42 * 2;
                  break;
               case 14:
                  _loc2_.x = 41 * 3;
                  _loc2_.y = 42 * 2;
                  break;
               case 15:
                  _loc2_.x = 41 * 4;
                  _loc2_.y = 42 * 2;
                  break;
               case 16:
                  _loc2_.x = 0;
                  _loc2_.y = 42 * 3;
                  break;
               case 17:
                  _loc2_.x = 41;
                  _loc2_.y = 42 * 3;
                  break;
               case 18:
                  _loc2_.x = 41 * 2;
                  _loc2_.y = 42 * 3;
                  break;
               case 19:
                  _loc2_.x = 41 * 3;
                  _loc2_.y = 42 * 3;
                  break;
               case 20:
                  _loc2_.x = 41 * 4;
                  _loc2_.y = 42 * 3;
            }
            this.shiyongSpr.addChild(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_++;
         }
      }
   }
}

