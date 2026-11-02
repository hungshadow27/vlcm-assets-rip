package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TianMenBuZhenPanel extends FPanel
   {
      
      public static const UI_TIANMENBUZHEN_CHONGXIN_CLICK:String = "UI_TIANMENBUZHEN_CHONGXIN_CLICK";
      
      public static const UI_TIANMENBUZHEN_OK_CLICK:String = "UI_TIANMENBUZHEN_OK_CLICK";
      
      public static const UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN:String = "UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN";
      
      public static const UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP:String = "UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP";
      
      public static const UI_TIANMENBUZHEN_ZISHENSKILL_DRAG:String = "UI_TIANMENBUZHEN_ZISHENSKILL_DRAG";
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      public var buzhenSpr:Sprite;
      
      public var xunzhangSpr:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var kuang:Bitmap;
      
      private var ChongXinBtn:SmallButton;
      
      private var BaoCunBtn:SmallButton;
      
      public function TianMenBuZhenPanel()
      {
         var i:int;
         var miao:FTextArea = null;
         var n:int = 0;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 410;
         height = 366 - 26;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("布阵");
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianmenzhen/bg.swf");
         this.bg.visible = true;
         this.bg.x = 10;
         this.bg.y = 2;
         this.bgSpr.addChild(this.bg);
         this.buzhenSpr = new Sprite();
         with(this.buzhenSpr)
         {
            x = 10 + 29;
            y = 2 + 23;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,213,213);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.buzhenSpr);
         this.buzhenSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.buzhenSpr.addEventListener(MouseEvent.MOUSE_UP,this.showMenu);
         i = 0;
         while(i < 3)
         {
            n = 0;
            while(n < 4)
            {
               this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
               addChild(this.kuang);
               this.kuang.x = 280 + 40 * i;
               this.kuang.y = 105 + 40 * n;
               n++;
            }
            i++;
         }
         this.xunzhangSpr = new Sprite();
         with(this.xunzhangSpr)
         {
            x = 280 + 2;
            y = 105 + 2;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,118,157);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.xunzhangSpr);
         this.xunzhangSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown2);
         this.xunzhangSpr.addEventListener(MouseEvent.MOUSE_UP,this.showMenu2);
         miao = new FTextArea();
         addChild(miao);
         miao.multiline = true;
         miao.wordWrap = true;
         miao.width = 100 + 12;
         miao.height = 95;
         miao.x = 290 - 6;
         miao.y = 25 - 15 + 3;
         miao.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请从下面道具中拖入要入阵的勋章，阵法会根据勋章的位置，发挥出阵法最大的威力。") + "</font>";
         this.ChongXinBtn = new SmallButton();
         this.ChongXinBtn.label = LanResManager.getLanCommonTextWords("重新布阵");
         addChild(this.ChongXinBtn);
         this.ChongXinBtn.x = 100;
         this.ChongXinBtn.y = 273;
         this.ChongXinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.BaoCunBtn = new SmallButton();
         this.BaoCunBtn.label = LanResManager.getLanCommonTextWords("保存布阵");
         addChild(this.BaoCunBtn);
         this.BaoCunBtn.x = 230;
         this.BaoCunBtn.y = 273;
         this.BaoCunBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ChongXinBtn:
               dispatchEvent(new BaseEvent(UI_TIANMENBUZHEN_CHONGXIN_CLICK));
               break;
            case this.BaoCunBtn:
               dispatchEvent(new BaseEvent(UI_TIANMENBUZHEN_OK_CLICK));
         }
      }
      
      private function onClose(param1:*) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onMouseDown2(param1:MouseEvent) : void
      {
         this.xunzhangSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.xunzhangSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_TIANMENBUZHEN_ZISHENSKILL_DRAG,"",this.currItem));
            this.xunzhangSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function showMenu2(param1:MouseEvent) : void
      {
         this.xunzhangSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.buzhenSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.buzhenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN,"",this.currItem));
            this.buzhenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.buzhenSpr.mouseY > 0 && this.buzhenSpr.mouseY < 72)
         {
            if(this.buzhenSpr.mouseX > 0 && this.buzhenSpr.mouseX < 72)
            {
               _loc2_ = 1;
            }
            else if(this.buzhenSpr.mouseX > 72 && this.buzhenSpr.mouseX < 145)
            {
               _loc2_ = 2;
            }
            else if(this.buzhenSpr.mouseX > 145 && this.buzhenSpr.mouseX < 214)
            {
               _loc2_ = 3;
            }
         }
         if(this.buzhenSpr.mouseY > 72 && this.buzhenSpr.mouseY < 145)
         {
            if(this.buzhenSpr.mouseX > 0 && this.buzhenSpr.mouseX < 72)
            {
               _loc2_ = 4;
            }
            else if(this.buzhenSpr.mouseX > 72 && this.buzhenSpr.mouseX < 145)
            {
               _loc2_ = 5;
            }
            else if(this.buzhenSpr.mouseX > 145 && this.buzhenSpr.mouseX < 214)
            {
               _loc2_ = 6;
            }
         }
         if(this.buzhenSpr.mouseY > 145 && this.buzhenSpr.mouseY < 213)
         {
            if(this.buzhenSpr.mouseX > 0 && this.buzhenSpr.mouseX < 72)
            {
               _loc2_ = 7;
            }
            else if(this.buzhenSpr.mouseX > 72 && this.buzhenSpr.mouseX < 145)
            {
               _loc2_ = 8;
            }
            else if(this.buzhenSpr.mouseX > 145 && this.buzhenSpr.mouseX < 214)
            {
               _loc2_ = 9;
            }
         }
         if(_loc2_ == 0)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP,"",[param1,_loc2_]));
         this.buzhenSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setInitialize(param1:int, param2:Array, param3:Array) : void
      {
         switch(param1)
         {
            case 1:
               titleText = LanResManager.getLanCommonTextWords("天门阵布阵");
               break;
            case 2:
               titleText = LanResManager.getLanCommonTextWords("鹤翼阵布阵");
               break;
            case 3:
               titleText = LanResManager.getLanCommonTextWords("鱼丽阵布阵");
               break;
            case 4:
               titleText = LanResManager.getLanCommonTextWords("偃月阵布阵");
               break;
            case 5:
               titleText = LanResManager.getLanCommonTextWords("长蛇阵布阵");
               break;
            case 6:
               titleText = LanResManager.getLanCommonTextWords("玄襄阵布阵");
               break;
            case 7:
               titleText = LanResManager.getLanCommonTextWords("雁行阵布阵");
               break;
            case 8:
               titleText = LanResManager.getLanCommonTextWords("虎韬阵布阵");
               break;
            case 9:
               titleText = LanResManager.getLanCommonTextWords("云龙阵布阵");
               break;
            case 10:
               titleText = LanResManager.getLanCommonTextWords("螃蟹阵布阵");
               break;
            case 11:
               titleText = LanResManager.getLanCommonTextWords("天覆阵布阵");
               break;
            case 12:
               titleText = LanResManager.getLanCommonTextWords("鸟翔阵布阵");
               break;
            case 13:
               titleText = LanResManager.getLanCommonTextWords("地载阵布阵");
               break;
            case 14:
               titleText = LanResManager.getLanCommonTextWords("风扬阵布阵");
         }
         this.setBuZhen(param2);
         this.setXunZhang(param3);
      }
      
      public function setXunZhang(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.xunzhangSpr.numChildren > 0)
         {
            this.xunzhangSpr.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(new Goods(param1[_loc3_].id));
            _loc2_.showKungFuTag();
            _loc2_.setShowCount(false);
            if(_loc3_ >= 0 && _loc3_ < 3)
            {
               _loc2_.x = _loc3_ * 41;
               _loc2_.y = 0;
            }
            else if(_loc3_ >= 3 && _loc3_ < 6)
            {
               _loc2_.x = 41 * (_loc3_ - 3);
               _loc2_.y = 42;
            }
            else if(_loc3_ >= 6 && _loc3_ < 9)
            {
               _loc2_.x = 41 * (_loc3_ - 6);
               _loc2_.y = 42 * 2;
            }
            else if(_loc3_ >= 9 && _loc3_ < 12)
            {
               _loc2_.x = 41 * (_loc3_ - 9);
               _loc2_.y = 42 * 3;
            }
            if(param1[_loc3_].count == 0)
            {
               _loc2_.filters = Tools.blackWhiteFilter;
            }
            else
            {
               _loc2_.filters = [];
            }
            this.xunzhangSpr.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setBuZhen(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:BaseItem = null;
         var _loc6_:int = 0;
         while(this.buzhenSpr.numChildren > 0)
         {
            _loc2_ = this.buzhenSpr.getChildAt(0) as ItemFace;
            this.buzhenSpr.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc6_ = _loc5_.position - 1000;
            _loc2_ = new ItemFace(_loc5_,65,65);
            _loc2_.showRedMask();
            _loc2_.setShowCount(false);
            switch(_loc6_)
            {
               case 1:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case 2:
                  _loc2_.x = 74;
                  _loc2_.y = 0;
                  break;
               case 3:
                  _loc2_.x = 74 * 2;
                  _loc2_.y = 0;
                  break;
               case 4:
                  _loc2_.x = 0;
                  _loc2_.y = 73;
                  break;
               case 5:
                  _loc2_.x = 74;
                  _loc2_.y = 73;
                  break;
               case 6:
                  _loc2_.x = 74 * 2;
                  _loc2_.y = 73;
                  break;
               case 7:
                  _loc2_.x = 0;
                  _loc2_.y = 73 * 2 + 1;
                  break;
               case 8:
                  _loc2_.x = 74;
                  _loc2_.y = 73 * 2 + 1;
                  break;
               case 9:
                  _loc2_.x = 74 * 2;
                  _loc2_.y = 73 * 2 + 1;
            }
            this.buzhenSpr.addChild(_loc2_);
            _loc3_++;
         }
      }
   }
}

