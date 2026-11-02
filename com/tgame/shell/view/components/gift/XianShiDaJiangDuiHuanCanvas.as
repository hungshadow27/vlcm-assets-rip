package com.tgame.shell.view.components.gift
{
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.MainCharSeachPathManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanCanvas extends FCanvas
   {
      
      private var _parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var tf1:TextFormat;
      
      private var ft:FTextArea;
      
      private var ftw:FTextArea;
      
      private var ft1:FTextArea;
      
      private var tiaobg:Bitmap;
      
      private var scroll:FVScorllBar;
      
      private var scroll2:FVScorllBar;
      
      private var tubiaoBg:Bitmap;
      
      private var container:Sprite;
      
      private var ftDate:FTextArea;
      
      private var titleNum:int = 10;
      
      private var topy:int;
      
      private var titleSprArr:Array;
      
      private var titleSpr:Sprite;
      
      private var fc:FCanvas;
      
      private var neirongSpr:Sprite;
      
      private var bt2:Bitmap;
      
      public var miaoshu:String = "";
      
      public function XianShiDaJiangDuiHuanCanvas()
      {
         super();
         skin = "box_transparence";
         width = 592 + 143;
         height = 345 + 75;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 2;
         this.container.y = 4;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,585,336);
            endFill();
         }
         this.bt2 = StaticValue.getBitmapByClassName("ui.xianshiHuodong.huodongLiebiao.txt");
         addChild(this.bt2);
         this.bt2.x = 0;
         this.bt2.y = 5;
         this.titleSpr = new Sprite();
         this.titleSpr.x = 3;
         this.titleSpr.y = 35;
         this.titleSpr.graphics.beginFill(0,0);
         this.titleSpr.graphics.drawRect(0,0,131,336 + 46);
         this.titleSpr.graphics.endFill();
         addChild(this.titleSpr);
         this.scroll = new FVScorllBar(this.titleSpr,336 + 46);
         addChild(this.scroll);
         this.scroll.x = 90 + 40 - 4;
         this.scroll.y = 35;
         this.fc = new FCanvas();
         this.fc.skin = "box";
         addChild(this.fc);
         this.fc.x = 130 + 60 - 47;
         this.fc.y = 2;
         this.fc.width = 600 - 30;
         this.fc.height = 416;
         this.neirongSpr = new Sprite();
         addChild(this.neirongSpr);
         this.neirongSpr.graphics.beginFill(16711680,0);
         this.neirongSpr.graphics.drawRect(0,0,600,336 + 44 + 30);
         this.neirongSpr.graphics.endFill();
         this.neirongSpr.x = 130 + 63 - 47;
         this.neirongSpr.y = 5;
         this.neirongSpr.width = 600;
         this.scroll2 = new FVScorllBar(this.neirongSpr,336 + 44 + 30);
         addChild(this.scroll2);
         this.scroll2.x = 700 + 15;
         this.scroll2.y = 5;
         this.ftDate = new FTextArea();
         with(this.ftDate)
         {
            x = 35;
            y = 355 + 80;
            wordWrap = true;
            width = 700;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>            " + LanResManager.getLanTextWords(this,1,[Date]) + "</font>" + "</textformat>";
         }
         addChild(this.ftDate);
      }
      
      private function onLink(param1:TextEvent) : void
      {
         if(param1.text == "1")
         {
            MainCharSeachPathManager.mainCharWalk(1731);
         }
         else if(param1.text == "2")
         {
            MainCharSeachPathManager.mainCharWalk(1709);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function openHuodongs(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:XianShiDaJiangDuiHuanTitleCanvas = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(this.titleSpr.numChildren > 0)
         {
            this.titleSpr.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = new XianShiDaJiangDuiHuanTitleCanvas();
            _loc4_.Id = param1[_loc2_][0];
            _loc5_ = param1[_loc2_][3];
            _loc5_ = _loc5_.replace(/<[^>]*>/ig,"");
            _loc6_ = param1[_loc2_][3].toUpperCase();
            _loc7_ = 16777215;
            _loc8_ = _loc6_.toUpperCase().indexOf("COLOR=\"#");
            if(_loc8_ > 0)
            {
               _loc6_ = _loc6_.substring(_loc8_ + "COLOR=\"#".length);
               _loc9_ = _loc6_.indexOf("\"");
               if(_loc9_ == 6)
               {
                  _loc7_ = parseInt(_loc6_.substring(0,6),16);
               }
            }
            _loc4_.btn.label = _loc5_;
            _loc4_.btn.setColor(int(_loc7_));
            _loc4_.name = param1[_loc2_][0];
            _loc4_.y = _loc2_ * 37;
            _loc4_.$parent = this._parent;
            _loc4_.isNewSystem = param1[_loc2_][4] == 1 ? true : false;
            this.titleSpr.addChild(_loc4_);
            _loc2_++;
         }
         this.scroll.update();
         if(this.scroll.visible == true)
         {
            this.titleSpr.x = 3;
         }
         else
         {
            this.titleSpr.x = 15;
         }
      }
      
      public function setBtnXuanzhong(param1:int) : void
      {
         var _loc3_:XianShiDaJiangDuiHuanTitleCanvas = null;
         var _loc4_:XianShiDaJiangDuiHuanTitleCanvas = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.titleSpr.numChildren)
         {
            _loc4_ = this.titleSpr.getChildAt(_loc2_) as XianShiDaJiangDuiHuanTitleCanvas;
            _loc4_.btn.setSkin("xianshiHuodongButton");
            _loc2_++;
         }
         _loc3_ = this.titleSpr.getChildByName(String(param1)) as XianShiDaJiangDuiHuanTitleCanvas;
         _loc3_.btn.setSkin("xianshiHuodongXuanzhongButton");
      }
      
      public function setDes(param1:String = "", param2:int = 0) : void
      {
         if(param2 == 1)
         {
            this.miaoshu = param1;
            this.ftDate.htmlText = param1;
         }
         else if(param2 == 2)
         {
            this.ftDate.htmlText = "";
         }
         else
         {
            this.ftDate.htmlText = this.miaoshu;
         }
      }
      
      public function showHuodong(param1:int, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:XianShiDaJiangDuiHuanTypeCanvas1Goods = null;
         var _loc7_:XianShiDaJiangDuiHuanTypeCanvas92Goods = null;
         var _loc8_:XianShiDaJiangDuiHuanTypeCanvas61Goods = null;
         var _loc9_:XianShiDaJiangDuiHuanTypeCanvas1 = null;
         var _loc10_:XianShiDaJiangDuiHuanTypeCanvas2 = null;
         var _loc11_:XianShiDaJiangDuiHuanTypeCanvas4 = null;
         var _loc12_:XianShiDaJiangDuiHuanTypeCanvas9 = null;
         var _loc13_:XianShiDaJiangDuiHuanTypeCanvas10 = null;
         var _loc14_:XianShiDaJiangDuiHuanTypeCanvas51 = null;
         var _loc15_:int = 0;
         var _loc16_:XianShiDaJiangDuiHuanTypeCanvas52 = null;
         var _loc17_:XianShiDaJiangDuiHuanTypeCanvas53 = null;
         var _loc18_:XianShiDaJiangDuiHuanTypeCanvas43Mc = null;
         var _loc19_:DuoTiaoDuiHuanTypeCanvas = null;
         while(this.neirongSpr.numChildren > 0)
         {
            this.neirongSpr.removeChildAt(0);
         }
         this.neirongSpr.graphics.clear();
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            switch(param2[_loc4_][1])
            {
               case 1:
               case 3:
               case 13:
               case 14:
               case 15:
               case 16:
               case 17:
               case 18:
               case 19:
               case 20:
               case 21:
               case 22:
               case 23:
               case 24:
               case 25:
               case 26:
               case 27:
               case 28:
               case 29:
               case 30:
               case 31:
               case 32:
               case 33:
               case 34:
               case 35:
               case 36:
               case 37:
               case 38:
               case 39:
               case 40:
               case 41:
               case 42:
               case 45:
               case 46:
               case 47:
               case 48:
               case 49:
               case 50:
               case 64:
               case 65:
               case 66:
               case 67:
               case 68:
               case 69:
               case 70:
               case 71:
               case 72:
               case 73:
               case 74:
               case 76:
               case 82:
               case 83:
               case 84:
               case 85:
               case 86:
               case 87:
               case 100:
               case 101:
               case 102:
                  _loc6_ = new XianShiDaJiangDuiHuanTypeCanvas1Goods();
                  _loc6_.$parent = this._parent;
                  _loc6_.SetInitialize(param1,param2[_loc4_]);
                  _loc6_.y = _loc3_ + 3;
                  _loc3_ += _loc6_.height + 8;
                  this.neirongSpr.addChild(_loc6_);
                  break;
               case 92:
                  _loc7_ = new XianShiDaJiangDuiHuanTypeCanvas92Goods();
                  _loc7_.$parent = this._parent;
                  _loc7_.SetInitialize(param1,param2[_loc4_]);
                  _loc7_.y = _loc3_ + 3;
                  _loc3_ += _loc7_.height + 8;
                  this.neirongSpr.addChild(_loc7_);
                  break;
               case 61:
                  _loc8_ = new XianShiDaJiangDuiHuanTypeCanvas61Goods();
                  _loc8_.$parent = this._parent;
                  _loc8_.SetInitialize(param1,param2[_loc4_]);
                  _loc8_.y = _loc3_ + 3;
                  _loc3_ += _loc8_.height + 8;
                  this.neirongSpr.addChild(_loc8_);
                  break;
               case 5:
               case 6:
               case 7:
               case 8:
               case 11:
               case 12:
               case 75:
                  _loc9_ = new XianShiDaJiangDuiHuanTypeCanvas1();
                  _loc9_.$parent = this._parent;
                  _loc9_.SetInitialize(param1,param2[_loc4_]);
                  _loc9_.y = _loc3_ + 3;
                  _loc3_ += _loc9_.height + 8;
                  this.neirongSpr.addChild(_loc9_);
                  break;
               case 2:
                  _loc10_ = new XianShiDaJiangDuiHuanTypeCanvas2();
                  _loc10_.$parent = this._parent;
                  _loc10_.SetInitialize(param1,param2[_loc4_]);
                  _loc10_.y = _loc3_ + 3;
                  this.neirongSpr.addChild(_loc10_);
                  _loc3_ += _loc10_.height + 8;
                  break;
               case 4:
                  _loc11_ = new XianShiDaJiangDuiHuanTypeCanvas4();
                  _loc11_.$parent = this._parent;
                  _loc11_.SetInitialize(param1,param2[_loc4_]);
                  _loc11_.y = _loc3_ + 3;
                  _loc3_ += _loc11_.height + 8;
                  this.neirongSpr.addChild(_loc11_);
                  break;
               case 9:
                  _loc12_ = new XianShiDaJiangDuiHuanTypeCanvas9();
                  _loc12_.$parent = this._parent;
                  _loc12_.SetInitialize(param1,param2[_loc4_]);
                  _loc12_.y = _loc3_ + 3;
                  _loc3_ += _loc12_.height + 8;
                  this.neirongSpr.addChild(_loc12_);
                  break;
               case 10:
               case 75:
                  _loc13_ = new XianShiDaJiangDuiHuanTypeCanvas10();
                  _loc13_.$parent = this._parent;
                  _loc13_.SetInitialize(param1,param2[_loc4_]);
                  _loc13_.y = _loc3_ + 3;
                  _loc3_ += _loc13_.height + 8;
                  this.neirongSpr.addChild(_loc13_);
                  break;
               case 51:
                  _loc14_ = new XianShiDaJiangDuiHuanTypeCanvas51();
                  _loc15_ = _loc14_.SetInitialize(param1,param2[_loc4_]);
                  _loc14_.y = _loc3_ + 3;
                  _loc3_ += _loc15_ + 8;
                  this.neirongSpr.addChild(_loc14_);
                  break;
               case 52:
                  _loc16_ = new XianShiDaJiangDuiHuanTypeCanvas52();
                  _loc16_.SetInitialize(param1,param2[_loc4_]);
                  _loc16_.y = _loc3_ + 3;
                  _loc3_ += _loc16_.height + 8;
                  this.neirongSpr.addChild(_loc16_);
                  break;
               case 53:
                  _loc17_ = new XianShiDaJiangDuiHuanTypeCanvas53();
                  _loc17_.SetInitialize(param1,param2[_loc4_]);
                  _loc17_.y = _loc3_ + 3;
                  _loc3_ += _loc17_.height + 8;
                  this.neirongSpr.addChild(_loc17_);
                  break;
               case 43:
                  _loc18_ = new XianShiDaJiangDuiHuanTypeCanvas43Mc();
                  _loc18_.$parent = this._parent;
                  _loc18_.SetInitialize(param1,param2[_loc4_]);
                  _loc18_.y = _loc3_ + 3;
                  _loc3_ += _loc18_.height + 8;
                  this.neirongSpr.addChild(_loc18_);
                  break;
               case 44:
                  _loc6_ = new XianShiDaJiangDuiHuanTypeCanvas1Goods();
                  _loc6_.$parent = this._parent;
                  _loc6_.SetInitialize(param1,param2[_loc4_]);
                  _loc6_.setTanchuMianban(true,param2[_loc4_][1]);
                  _loc6_.y = _loc3_ + 3;
                  _loc3_ += _loc6_.height + 8;
                  this.neirongSpr.addChild(_loc6_);
                  break;
               case 62:
                  _loc19_ = new DuoTiaoDuiHuanTypeCanvas();
                  _loc19_.$parent = this._parent;
                  _loc19_.SetInitialize(param1,param2[_loc4_]);
                  _loc19_.y = _loc3_ + 3;
                  _loc3_ += _loc19_.height + 8;
                  this.neirongSpr.addChild(_loc19_);
            }
            _loc4_++;
         }
         if(_loc3_ < 336 + 44 + 30)
         {
            _loc5_ = 336 + 44 + 30;
         }
         else
         {
            _loc5_ = _loc3_;
         }
         this.neirongSpr.graphics.beginFill(16711680,0);
         this.neirongSpr.graphics.drawRect(0,0,600,_loc5_);
         this.neirongSpr.graphics.endFill();
         this.scroll2.update();
      }
   }
}

