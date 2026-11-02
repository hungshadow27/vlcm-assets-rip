package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class BiwuDuijue_Panel extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var closeBtn:FSimpleButton;
      
      private var ftTime:FTextArea;
      
      private var ftTime1:FTextArea;
      
      private var bt1:Bitmap;
      
      private var bt2:Bitmap;
      
      private var bt3:Bitmap;
      
      private var bt4:Bitmap;
      
      private var bt:Bitmap;
      
      private var bt5:Bitmap;
      
      private var btTime:Bitmap;
      
      private var fta:FTextArea;
      
      private var ft_G:FTextArea;
      
      private var ft_Y:FTextArea;
      
      private var ft_J:FTextArea;
      
      private var ft_yuanbao1:FTextArea;
      
      private var ft_yuanbao2:FTextArea;
      
      private var bit1:Bitmap;
      
      private var bit2:Bitmap;
      
      private var ft_1:FTextArea;
      
      private var ft_3:FTextArea;
      
      private var DataContainers32:Sprite;
      
      private var DataContainersTxt32:Sprite;
      
      private var DataContainers16:Sprite;
      
      private var DataContainers8:Sprite;
      
      private var DataContainers4:Sprite;
      
      private var DataContainers2:Sprite;
      
      private var DataContainers3_4:Sprite;
      
      private var DataContainers1_2:Sprite;
      
      private var DataContainersTime:Sprite;
      
      private var guanjun:String = "";
      
      private var tf:TextFormat;
      
      private var bg_sprite:Sprite;
      
      private var ssp:Sprite;
      
      private var tz:Sprite;
      
      public var titleImg:Bitmap;
      
      public var kuangImg:Bitmap;
      
      private var gongMc:MovieClip;
      
      public function BiwuDuijue_Panel()
      {
         super();
         this.titleImg = StaticValue.getBitmapByClassName("ui.32qiang.bg");
         addChild(this.titleImg);
         this.ssp = new Sprite();
         this.ssp.x = 40;
         this.ssp.y = 23;
         addChild(this.ssp);
         this.kuangImg = StaticValue.getBitmapByClassName("ui.32qiang.guanjun.kuang");
         this.kuangImg.x = 415;
         this.kuangImg.y = 285;
         addChild(this.kuangImg);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         this.ssp.addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2 - 90;
         this.closeBtn.y = 2 - 10;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.init();
         this.DataContainers32 = new Sprite();
         this.DataContainers32.x = 0;
         this.DataContainers32.y = 0;
         this.ssp.addChild(this.DataContainers32);
         this.DataContainersTxt32 = new Sprite();
         this.DataContainersTxt32.x = 0;
         this.DataContainersTxt32.y = 0;
         this.ssp.addChild(this.DataContainersTxt32);
         this.DataContainers16 = new Sprite();
         this.DataContainers16.x = 360;
         this.DataContainers16.y = 50;
         this.ssp.addChild(this.DataContainers16);
         this.DataContainers8 = new Sprite();
         this.DataContainers8.x = 0;
         this.DataContainers8.y = 0;
         this.ssp.addChild(this.DataContainers8);
         this.DataContainers4 = new Sprite();
         this.DataContainers4.x = 0;
         this.DataContainers4.y = 0;
         this.ssp.addChild(this.DataContainers4);
         this.DataContainers2 = new Sprite();
         this.DataContainers2.x = 0;
         this.DataContainers2.y = 0;
         this.ssp.addChild(this.DataContainers2);
         this.DataContainersTime = new Sprite();
         this.DataContainersTime.x = 0;
         this.DataContainersTime.y = 0;
         this.ssp.addChild(this.DataContainersTime);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,955,60);
         this.tz.graphics.endFill();
         this.tz.width = 955;
         this.tz.height = 60;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      private function init() : void
      {
         this.ft_G = new FTextArea();
         this.ft_G.width = 200;
         this.ft_G.x = 395 - 55;
         this.ft_G.y = 140 + 180;
         this.ft_G.filters = StaticValue.filter;
         this.ft_G.htmlText = "<font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("冠军") + "：</font>";
         this.ssp.addChild(this.ft_G);
         this.ft_yuanbao1 = new FTextArea();
         this.ft_yuanbao1.width = 160;
         this.ft_yuanbao1.x = this.ft_G.x + 195;
         this.ft_yuanbao1.y = this.ft_G.y;
         this.ft_yuanbao1.filters = StaticValue.filter;
         this.ft_yuanbao1.htmlText = "";
         this.ft_Y = new FTextArea();
         this.ft_Y.width = 200;
         this.ft_Y.x = 395 - 55;
         this.ft_Y.y = 165 + 180;
         this.ft_Y.filters = StaticValue.filter;
         this.ft_Y.htmlText = "<font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("亚军") + "：</font>";
         this.ssp.addChild(this.ft_Y);
         this.ft_yuanbao2 = new FTextArea();
         this.ft_yuanbao2.width = 160;
         this.ft_yuanbao2.x = this.ft_Y.x + 195;
         this.ft_yuanbao2.y = this.ft_Y.y;
         this.ft_yuanbao2.filters = StaticValue.filter;
         this.ft_yuanbao2.htmlText = "";
         this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.biwudahui.txt");
         this.bt1.x = 308;
         this.bt1.y = 33 + 20;
         this.ssp.addChild(this.bt1);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft_1 = new FTextArea();
         this.ft_1.x = 412 + 2 + 2 - 17 + 40;
         this.ft_1.y = 284 - 5 - 4 - 2 + 23;
         this.ft_1.width = 150;
         this.ft_1.htmlText = "";
         this.ft_1.filters = StaticValue.filter;
         this.ft_1.defaultTextFormat = this.tf;
         addChild(this.ft_1);
         var _loc1_:int = 0;
         while(_loc1_ < 16)
         {
            this.bt3 = StaticValue.getBitmapByClassName("ui.32qiang.kuang1");
            this.bt3.x = 43;
            this.bt3.y = 45 + 31 * _loc1_;
            this.ssp.addChild(this.bt3);
            this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.kuang1");
            this.bt1.x = 782;
            this.bt1.y = 45 + 31 * _loc1_;
            this.ssp.addChild(this.bt1);
            _loc1_++;
         }
         this.ft = new FTextArea();
         this.ft.x = 295 + 80 * 0;
         this.ft.y = 485;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("十六强");
         this.ft.width = 65;
         this.ssp.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 295 + 80 * 1;
         this.ft.y = 485;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("八强");
         this.ft.width = 65;
         this.ssp.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 295 + 80 * 2;
         this.ft.y = 485;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("四强");
         this.ft.width = 65;
         this.ssp.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 295 + 80 * 3;
         this.ft.y = 485;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("半决赛");
         this.ft.width = 65;
         this.ssp.addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 295 + 80 * 4;
         this.ft.y = 485;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("决赛");
         this.ft.width = 65;
         this.ssp.addChild(this.ft);
      }
      
      private function init32(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         this.DataContainers16.x = 360;
         var _loc2_:int = 164;
         var _loc3_:int = 53;
         var _loc4_:int = 38;
         var _loc5_:int = 62;
         var _loc6_:int = 1;
         if(param1.length == 32)
         {
            _loc9_ = 0;
            while(_loc9_ < param1.length)
            {
               this.fta = new FTextArea();
               this.fta.width = 120;
               this.fta.x = 43 + 2;
               this.fta.y = 45 + 31 * _loc9_ + 2;
               this.fta.filters = StaticValue.filter;
               this.fta.htmlText = "<font align=\'center\' color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[_loc9_].name + "</font>";
               this.DataContainersTxt32.addChild(this.fta);
               this.bt1 = new Bitmap();
               if(param1[_loc9_].zhuwei > 0)
               {
                  this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.zhuwei.txt");
                  this.bt1.x = 8;
                  this.bt1.y = 45 + 31 * _loc9_ + 4;
                  this.DataContainersTxt32.addChild(this.bt1);
               }
               if(_loc9_ >= param1.length / 2)
               {
                  this.fta.x = 782;
                  this.fta.y = 45 + 31 * (_loc9_ - param1.length / 2) + 2;
                  this.bt1.x = 782 + 122;
                  this.bt1.y = 45 + 31 * (_loc9_ - param1.length / 2) + 4;
                  this.DataContainersTxt32.addChild(this.bt1);
               }
               _loc9_++;
            }
         }
         else if(param1.length == 16)
         {
            _loc2_ = 163 + 44;
            _loc6_ = 3;
            _loc3_ = 57 + 12;
            _loc4_ = 104 - 75 + 11 - 2;
            _loc5_ = 124;
         }
         if(param1.length == 8)
         {
            _loc2_ = 163 + 45 + 41;
            _loc6_ = 5;
            _loc3_ = 57 + 16 + 27;
            _loc4_ = 104 - 75 + 13 - 5 + 1;
            _loc5_ = 248;
         }
         if(param1.length == 4)
         {
            _loc2_ = 163 + 45 + 40 + 43;
            _loc6_ = 7;
            _loc3_ = 57 + 16 + 20 + 65 + 6 - 5 + 3;
            _loc4_ = 104 - 75 + 15 + 60 - 5 + 7;
            _loc5_ = 360;
         }
         if(param1.length == 2)
         {
            _loc2_ = 163 + 45 + 40 + 45 + 41;
            _loc6_ = 9;
            _loc3_ = 57 + 16 + 20 + 65 + 130 - 7 - 4 + 9;
            _loc4_ = 104 - 75 + 15 + 60 + 180 - 6 + 9;
            _loc5_ = 360;
            this.DataContainers16.scaleX = -1;
            this.DataContainers16.x += 586;
         }
         var _loc8_:Boolean = true;
         _loc9_ = 0;
         while(_loc9_ < param1.length)
         {
            if(param1[_loc9_].shengfu == 1)
            {
               _loc8_ = true;
               _loc7_ = _loc9_ % 2 + _loc6_;
               if(param1.length == 2)
               {
                  _loc7_ = 9;
               }
               if(this.guanjun == param1[_loc9_].name)
               {
                  this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.xian" + _loc7_ + ".1");
               }
               else
               {
                  this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.xian" + _loc7_ + ".0");
               }
               if(_loc7_ == 9)
               {
                  this.bt1.width = 55;
               }
            }
            else
            {
               _loc8_ = false;
               _loc7_ = _loc9_ % 2 + _loc6_;
               if(param1.length == 2)
               {
                  _loc7_ = 9;
               }
               this.bt1 = StaticValue.getBitmapByClassName("ui.32qiang.xian" + _loc7_ + ".2");
               if(_loc7_ == 9)
               {
                  this.bt1.width = 55;
               }
            }
            if(_loc9_ < param1.length / 2)
            {
               if(_loc9_ % 2 == 0)
               {
                  this.bt1.x = _loc2_;
                  this.bt1.y = _loc3_ + _loc5_ * (_loc9_ / 2);
                  if(_loc7_ != 9)
                  {
                     if(_loc8_)
                     {
                        this.DataContainers32.addChild(this.bt1);
                     }
                     else
                     {
                        this.DataContainers32.addChildAt(this.bt1,0);
                     }
                  }
               }
               else
               {
                  this.bt1.x = _loc2_;
                  this.bt1.y = _loc4_ + _loc5_ * (_loc9_ / 2);
                  if(_loc7_ != 9)
                  {
                     if(_loc8_)
                     {
                        this.DataContainers32.addChild(this.bt1);
                     }
                     else
                     {
                        this.DataContainers32.addChildAt(this.bt1,0);
                     }
                  }
               }
            }
            else if(_loc9_ % 2 == 0)
            {
               this.bt1.x = _loc2_;
               this.bt1.y = _loc3_ + _loc5_ * ((_loc9_ - param1.length / 2) / 2) - 50;
               if(_loc7_ != 9)
               {
                  if(_loc8_)
                  {
                     this.DataContainers16.addChild(this.bt1);
                  }
                  else
                  {
                     this.DataContainers16.addChildAt(this.bt1,0);
                  }
               }
            }
            else
            {
               this.bt1.x = _loc2_;
               this.bt1.y = _loc4_ + _loc5_ * ((_loc9_ - param1.length / 2) / 2) - 50;
               if(_loc7_ != 9)
               {
                  if(_loc8_)
                  {
                     this.DataContainers16.addChild(this.bt1);
                  }
                  else
                  {
                     this.DataContainers16.addChildAt(this.bt1,0);
                  }
               }
            }
            _loc9_++;
         }
      }
      
      private function setEnd(param1:Array, param2:int, param3:int) : void
      {
         if(param1[0].name != "")
         {
            this.ft_G.htmlText = "<b><font color=\'" + StaticValue.ORANGE_RED_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("冠军") + "：</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'14\'>" + param1[0].name + "</font></b>";
            if(this.bit1 != null && this.bit1.parent != null)
            {
               this.bit1.parent.removeChild(this.bit1);
            }
            this.bit1 = StaticValue.getBitmapByClassName("ui.ico.money.silver");
            this.bit1.x = this.ft_yuanbao1.x + 50;
            this.bit1.y = this.ft_yuanbao1.y;
         }
         if(param1[1].name != "")
         {
            this.ft_Y.htmlText = "<b><font color=\'" + StaticValue.ORANGE_RED_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("亚军") + "：</font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'14\'>" + param1[1].name + "</font></b>";
            if(this.bit2 != null && this.bit2.parent != null)
            {
               this.bit2.parent.removeChild(this.bit2);
            }
            this.bit2 = StaticValue.getBitmapByClassName("ui.ico.money.silver");
            this.bit2.x = this.ft_yuanbao2.x + 50;
            this.bit2.y = this.ft_yuanbao2.y;
         }
         this.ft_1.htmlText = "<b><font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'14\'>" + param1[0].name + "</font></b>";
      }
      
      private function setTime(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            this.ftTime = new FTextArea();
            this.ftTime.y = 500;
            this.ftTime.x = 282 + 80 * _loc2_;
            this.ftTime.filters = StaticValue.filter;
            this.ftTime.textColor = StaticValue.YELLOW;
            this.ftTime.width = 85;
            this.ftTime.htmlText = param1[_loc2_];
            this.DataContainersTime.addChild(this.ftTime);
            _loc2_++;
         }
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Object) : void
      {
         var arrTime:Array;
         var arr32:Array;
         var arr16:Array;
         var arr8:Array;
         var arr4:Array;
         var arr2:Array;
         var arr3:Array;
         var o1:Object;
         var i:int = 0;
         var o:Object = null;
         var data:Object = param1;
         if(this.gongMc == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
               }
               gongMc = _loc2_.content as MovieClip;
               if(gongMc)
               {
                  gongMc.x = 8 + 370;
                  gongMc.y = 6 + 100 - 15;
                  addChildAt(gongMc,1);
               }
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/biwudahui/huo.swf");
         }
         else
         {
            this.gongMc.x = 8 + 370;
            this.gongMc.y = 6 + 100 - 15;
            this.gongMc.play();
            addChildAt(this.gongMc,1);
         }
         while(this.DataContainers32.numChildren > 0)
         {
            this.DataContainers32.removeChildAt(0);
         }
         while(this.DataContainers16.numChildren > 0)
         {
            this.DataContainers16.removeChildAt(0);
         }
         while(this.DataContainersTxt32.numChildren > 0)
         {
            this.DataContainersTxt32.removeChildAt(0);
         }
         while(this.DataContainersTime.numChildren > 0)
         {
            this.DataContainersTime.removeChildAt(0);
         }
         arrTime = new Array();
         arrTime[0] = data.time16;
         arrTime[1] = data.time8;
         arrTime[2] = data.time4;
         arrTime[3] = data.time3_4;
         arrTime[4] = data.time1_2;
         this.setTime(arrTime);
         if(data.no1[0] != "")
         {
            this.guanjun = "[" + data.no1[4] + LanResManager.getLanCommonTextWords("区") + "]" + data.no1[0];
         }
         arr32 = new Array();
         i = 0;
         while(i < 32)
         {
            o = new Object();
            if(data.beat32[i][0] == "")
            {
               o.name = "";
               o.shengfu = false;
            }
            else
            {
               o.name = "[" + data.beat32[i][4] + LanResManager.getLanCommonTextWords("区") + "]" + data.beat32[i][0];
               o.shengfu = data.beat32[i][1];
               o.paiming = data.beat32[i][2];
               o.id = data.beat32[i][3];
               o.qufu = data.beat32[i][4];
               o.zhuwei = data.beat32[i][5];
            }
            arr32.push(o);
            i++;
         }
         this.init32(arr32);
         arr16 = new Array();
         i = 0;
         while(i < 16)
         {
            o = new Object();
            if(data.beat16[i][0] == "")
            {
               o.name = "";
               o.shengfu = false;
            }
            else
            {
               o.name = "[" + data.beat16[i][4] + LanResManager.getLanCommonTextWords("区") + "]" + data.beat16[i][0];
               o.shengfu = data.beat16[i][1];
               o.paiming = data.beat16[i][2];
               o.id = data.beat16[i][3];
               o.qufu = data.beat16[i][4];
               o.zhuwei = data.beat16[i][5];
            }
            arr16.push(o);
            i++;
         }
         this.init32(arr16);
         arr8 = new Array();
         i = 0;
         while(i < 8)
         {
            o = new Object();
            if(data.beat8[i][0] == "")
            {
               o.name = "";
               o.shengfu = false;
            }
            else
            {
               o.name = "[" + data.beat8[i][4] + LanResManager.getLanCommonTextWords("区") + "]" + data.beat8[i][0];
               o.shengfu = data.beat8[i][1];
               o.paiming = data.beat8[i][2];
               o.id = data.beat8[i][3];
               o.qufu = data.beat8[i][4];
               o.zhuwei = data.beat8[i][5];
            }
            arr8.push(o);
            i++;
         }
         this.init32(arr8);
         arr4 = new Array();
         i = 0;
         while(i < 4)
         {
            o = new Object();
            if(data.beat4[i][0] == "")
            {
               o.name = "";
               o.shengfu = false;
            }
            else
            {
               o.name = "[" + data.beat4[i][4] + LanResManager.getLanCommonTextWords("区") + "]" + data.beat4[i][0];
               o.shengfu = data.beat4[i][1];
               o.paiming = data.beat4[i][2];
               o.id = data.beat4[i][3];
               o.qufu = data.beat4[i][4];
               o.zhuwei = data.beat4[i][5];
            }
            arr4.push(o);
            i++;
         }
         this.init32(arr4);
         arr2 = new Array();
         i = 0;
         while(i < 2)
         {
            o = new Object();
            if(data.beat2[i][0] == "")
            {
               o.name = "";
               o.shengfu = false;
            }
            else
            {
               o.name = "[" + data.beat2[i][4] + LanResManager.getLanCommonTextWords("区") + "]" + data.beat2[i][0];
               o.shengfu = data.beat2[i][1];
               o.paiming = data.beat2[i][2];
               o.id = data.beat2[i][3];
               o.qufu = data.beat2[i][4];
               o.zhuwei = data.beat2[i][5];
            }
            arr2.push(o);
            i++;
         }
         this.init32(arr2);
         arr3 = new Array();
         o = new Object();
         if(data.no1[1] == false && data.no2[1] == false)
         {
            return;
         }
         o.name = "[" + data.no1[4] + LanResManager.getLanCommonTextWords("区") + "]" + data.no1[0];
         arr3.push(o);
         o1 = new Object();
         o1.name = "[" + data.no2[4] + LanResManager.getLanCommonTextWords("区") + "]" + data.no2[0];
         arr3.push(o1);
         this.setEnd(arr3,data.guanjunYuanbao,data.yajunYuanbao);
      }
   }
}

