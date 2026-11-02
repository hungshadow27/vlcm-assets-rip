package com.tgame.shell.view.components.wangzhezhibangliucheng
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class WangZheZhiBang_LiuCheng extends FPanel
   {
      
      public var _$parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var guanJunQibg:DisplayObject;
      
      private var sai64:FTextArea;
      
      private var sai16:FTextArea;
      
      private var sai4:FTextArea;
      
      private var sai2:FTextArea;
      
      private var tf:TextFormat;
      
      private var Spr16:Sprite;
      
      private var Spr4:Sprite;
      
      private var guanJun:FTextArea;
      
      private var closeBtn1:FSimpleButton;
      
      private var yArr:Array = [70,121,150,155,284,336,365,369];
      
      private var siqiangArr:Array = [];
      
      private var siqiangObj1:Object = {};
      
      private var siqiangObj2:Object = {};
      
      private var siqiangObj3:Object = {};
      
      private var siqiangObj4:Object = {};
      
      private var siQiang1:FTextArea;
      
      private var siQiang2:FTextArea;
      
      private var siQiang3:FTextArea;
      
      private var siQiang4:FTextArea;
      
      private var guanjun:FTextArea;
      
      public function WangZheZhiBang_LiuCheng()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("王者争霸");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 1000;
         height = 500;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/bg.swf");
         this.bg.x = 0;
         this.bg.y = -35;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/name.swf");
         this.bg.x = 10 + 350;
         this.bg.y = -4;
         addChild(this.bg);
         this.Spr16 = new Sprite();
         addChild(this.Spr16);
         this.Spr4 = new Sprite();
         addChild(this.Spr4);
         this.closeBtn1 = new FSimpleButton();
         this.closeBtn1.skin = "closeButton";
         addChild(this.closeBtn1);
         this.closeBtn1.x = width - this.closeBtn1.width - 2 - 50;
         this.closeBtn1.y = 2 - 25;
         this.closeBtn1.addEventListener(MouseEvent.CLICK,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.sai64 = new FTextArea();
         this.sai64.filters = StaticValue.filter;
         this.sai64.defaultTextFormat = this.tf;
         this.sai64.multiline = true;
         this.sai64.wordWrap = true;
         this.sai64.width = 90;
         this.sai64.x = 325 - 15;
         this.sai64.y = 450 + 23 - 30;
         addChild(this.sai64);
         this.sai16 = new FTextArea();
         this.sai16.filters = StaticValue.filter;
         this.sai16.defaultTextFormat = this.tf;
         this.sai16.multiline = true;
         this.sai16.wordWrap = true;
         this.sai16.width = 120;
         this.sai16.x = 325 + 95 - 25;
         this.sai16.y = 450 + 23 - 30;
         addChild(this.sai16);
         this.sai4 = new FTextArea();
         this.sai4.filters = StaticValue.filter;
         this.sai4.defaultTextFormat = this.tf;
         this.sai4.multiline = true;
         this.sai4.wordWrap = true;
         this.sai4.width = 90;
         this.sai4.x = 325 + 95 * 2 - 5;
         this.sai4.y = 450 + 23 - 30;
         addChild(this.sai4);
         this.sai2 = new FTextArea();
         this.sai2.filters = StaticValue.filter;
         this.sai2.defaultTextFormat = this.tf;
         this.sai2.multiline = true;
         this.sai2.wordWrap = true;
         this.sai2.width = 90;
         this.sai2.x = 325 + 95 * 3;
         this.sai2.y = 450 + 23 - 30;
         addChild(this.sai2);
         this.siqiangObj1 = new Object();
         this.siqiangObj1.isCanyu = false;
         this.siqiangObj1.name = "";
         this.siqiangObj1.qufu = 0;
         this.siqiangObj1.shengli = false;
         this.siqiangObj1.guanjun = false;
         this.siqiangObj2 = new Object();
         this.siqiangObj2.isCanyu = false;
         this.siqiangObj2.name = "";
         this.siqiangObj2.qufu = 0;
         this.siqiangObj2.shengli = false;
         this.siqiangObj2.guanjun = false;
         this.siqiangObj3 = new Object();
         this.siqiangObj3.isCanyu = false;
         this.siqiangObj3.name = "";
         this.siqiangObj3.qufu = 0;
         this.siqiangObj3.shengli = false;
         this.siqiangObj3.guanjun = false;
         this.siqiangObj4 = new Object();
         this.siqiangObj4.isCanyu = false;
         this.siqiangObj4.name = "";
         this.siqiangObj4.qufu = 0;
         this.siqiangObj4.shengli = false;
         this.siqiangObj4.guanjun = false;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_0.swf");
         this.bg.x = 430 + 12;
         this.bg.y = 80;
         this.Spr4.addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zhong_0.swf");
         this.bg.x = 430 + 12 + 65;
         this.bg.y = 80 + 45;
         this.Spr4.addChild(this.bg);
         this.guanJunQibg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/guanjunqi.swf");
         this.guanJunQibg.x = 430 + 12 + 15;
         this.guanJunQibg.y = 80 + 75;
         this.guanJunQibg.filters = Tools.blackWhiteFilter;
         this.Spr4.addChild(this.guanJunQibg);
      }
      
      private function onClose(param1:* = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function liucheng(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:FTextArea = null;
         while(this.Spr16.numChildren > 0)
         {
            this.Spr16.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(_loc2_ < 4)
            {
               if(param1[_loc2_].shengli)
               {
                  this.siqiangObj1 = param1[_loc2_];
               }
            }
            else if(_loc2_ < 8)
            {
               if(param1[_loc2_].shengli)
               {
                  this.siqiangObj2 = param1[_loc2_];
               }
            }
            else if(_loc2_ < 12)
            {
               if(param1[_loc2_].shengli)
               {
                  this.siqiangObj3 = param1[_loc2_];
               }
            }
            else if(_loc2_ < 16)
            {
               if(param1[_loc2_].shengli)
               {
                  this.siqiangObj4 = param1[_loc2_];
               }
            }
            if(param1[_loc2_].guanjun)
            {
               while(this.Spr4.numChildren > 0)
               {
                  this.Spr4.removeChildAt(0);
               }
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_1.swf");
               this.bg.x = 430 + 12;
               this.bg.y = 80;
               this.Spr4.addChild(this.bg);
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zhong_3.swf");
               this.bg.x = 430 + 12 + 65;
               this.bg.y = 80 + 45;
               this.Spr4.addChild(this.bg);
               this.guanJunQibg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/guanjunqi.swf");
               this.guanJunQibg.x = 430 + 12 + 15;
               this.guanJunQibg.y = 80 + 75;
               this.Spr4.addChild(this.guanJunQibg);
               this.guanJun = new FTextArea();
               this.guanJun.filters = StaticValue.filter;
               this.guanJun.defaultTextFormat = this.tf;
               this.guanJun.multiline = true;
               this.guanJun.wordWrap = true;
               this.guanJun.width = 135;
               this.guanJun.x = 444;
               this.guanJun.y = 125 - 30 - 6;
               this.Spr16.addChild(this.guanJun);
               this.guanJun.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + param1[_loc2_].name + "<br>[" + LanResManager.getLanCommonTextWords("帮会") + "]</font>";
            }
            if(_loc2_ < 8)
            {
               if(param1[_loc2_].shengli)
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_1.swf");
                  this.bg.x = 65;
                  this.bg.y = 45 + 54 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  if(param1[_loc2_].guanjun)
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo" + (_loc2_ + 1) % 4 + "_3.swf");
                  }
                  else
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo" + (_loc2_ + 1) % 4 + "_1.swf");
                  }
                  this.bg.x = 210;
                  this.bg.y = this.yArr[_loc2_];
                  this.Spr16.addChild(this.bg);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_0.swf");
                  this.bg.x = 65;
                  this.bg.y = 45 + 54 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo" + (_loc2_ + 1) % 4 + "_0.swf");
                  this.bg.x = 210;
                  this.bg.y = this.yArr[_loc2_];
                  this.Spr16.addChildAt(this.bg,0);
               }
               if(param1[_loc2_].name != "")
               {
                  _loc3_ = new FTextArea();
                  _loc3_.filters = StaticValue.filter;
                  _loc3_.defaultTextFormat = this.tf;
                  _loc3_.multiline = true;
                  _loc3_.wordWrap = true;
                  _loc3_.width = 135;
                  _loc3_.x = 60;
                  _loc3_.y = 55 + 54 * _loc2_;
                  _loc3_.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + param1[_loc2_].name + "<br>[" + LanResManager.getLanCommonTextWords("帮会") + "]</font>";
                  this.Spr16.addChild(_loc3_);
               }
            }
            else
            {
               if(param1[_loc2_].shengli)
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_1.swf");
                  this.bg.x = 65 + 760;
                  this.bg.y = 45 + 54 * (_loc2_ - 8);
                  this.Spr16.addChild(this.bg);
                  if(param1[_loc2_].guanjun)
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/you" + (_loc2_ + 1) % 4 + "_3.swf");
                  }
                  else
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/you" + (_loc2_ + 1) % 4 + "_1.swf");
                  }
                  this.bg.x = 210 + 555 + 15;
                  this.bg.y = this.yArr[_loc2_ - 8];
                  this.Spr16.addChild(this.bg);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_0.swf");
                  this.bg.x = 65 + 760;
                  this.bg.y = 45 + 54 * (_loc2_ - 8);
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/you" + (_loc2_ + 1) % 4 + "_0.swf");
                  this.bg.x = 210 + 555 + 15;
                  this.bg.y = this.yArr[_loc2_ - 8];
                  this.Spr16.addChildAt(this.bg,0);
               }
               if(param1[_loc2_].name != "")
               {
                  _loc3_ = new FTextArea();
                  _loc3_.filters = StaticValue.filter;
                  _loc3_.defaultTextFormat = this.tf;
                  _loc3_.multiline = true;
                  _loc3_.wordWrap = true;
                  _loc3_.width = 135;
                  _loc3_.x = 60 + 760;
                  _loc3_.y = 55 + 54 * (_loc2_ - 8);
                  _loc3_.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + param1[_loc2_].name + "<br>[" + LanResManager.getLanCommonTextWords("帮会") + "]</font>";
                  this.Spr16.addChild(_loc3_);
               }
            }
            _loc2_++;
         }
         this.siqiangArr = [this.siqiangObj1,this.siqiangObj2,this.siqiangObj3,this.siqiangObj4];
         _loc2_ = 0;
         while(_loc2_ < this.siqiangArr.length)
         {
            if(_loc2_ < 2)
            {
               if(this.siqiangArr[_loc2_].guanjun)
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_1.swf");
                  this.bg.x = 260;
                  this.bg.y = 130 + 215 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo" + (_loc2_ + 6) + "_3.swf");
                  this.bg.x = 400 - 5;
                  this.bg.y = 145 + 112 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_3.swf");
                  this.bg.x = 234 + 176 + 2;
                  this.bg.y = 240;
                  this.Spr16.addChild(this.bg);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_0.swf");
                  this.bg.x = 260;
                  this.bg.y = 130 + 215 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo" + (_loc2_ + 6) + "_0.swf");
                  this.bg.x = 400 - 5;
                  this.bg.y = 145 + 112 * _loc2_;
                  this.Spr16.addChildAt(this.bg,0);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_0.swf");
                  this.bg.x = 234 + 176 + 2;
                  this.bg.y = 240;
                  this.Spr16.addChildAt(this.bg,0);
               }
               if(this.siqiangArr[_loc2_].isCanyu)
               {
                  if(this.siqiangArr[_loc2_].guanjun)
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_3.swf");
                  }
                  else
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_1.swf");
                  }
                  this.bg.x = 234;
                  this.bg.y = 132 + 215 * _loc2_;
                  this.Spr16.addChild(this.bg);
                  _loc3_ = new FTextArea();
                  _loc3_.filters = StaticValue.filter;
                  _loc3_.defaultTextFormat = this.tf;
                  _loc3_.multiline = true;
                  _loc3_.wordWrap = true;
                  _loc3_.width = 132;
                  _loc3_.x = 270 - 12;
                  _loc3_.y = 155 + 215 * _loc2_ - 12 - 5;
                  _loc3_.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + this.siqiangArr[_loc2_].name + "<br>[" + LanResManager.getLanCommonTextWords("帮会") + "]</font>";
                  this.Spr16.addChild(_loc3_);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_0.swf");
                  this.bg.x = 234;
                  this.bg.y = 132 + 215 * _loc2_;
                  this.Spr16.addChildAt(this.bg,0);
               }
            }
            else
            {
               if(this.siqiangArr[_loc2_].guanjun)
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_1.swf");
                  this.bg.x = 250 + 360 - 2 + 14;
                  this.bg.y = 130 + 215 * (_loc2_ - 2);
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/you" + (_loc2_ + 4) + "_3.swf");
                  this.bg.x = 400 + 200 - 8 + 11;
                  this.bg.y = 145 + 112 * (_loc2_ - 2);
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_3.swf");
                  this.bg.x = 234 + 176 + 165 + 2;
                  this.bg.y = 240;
                  this.Spr16.addChild(this.bg);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/nameBg_0.swf");
                  this.bg.x = 250 + 360 - 2 + 14;
                  this.bg.y = 130 + 215 * (_loc2_ - 2);
                  this.Spr16.addChild(this.bg);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/you" + (_loc2_ + 4) + "_0.swf");
                  this.bg.x = 400 + 200 - 8 + 11;
                  this.bg.y = 145 + 112 * (_loc2_ - 2);
                  this.Spr16.addChildAt(this.bg,0);
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_0.swf");
                  this.bg.x = 234 + 176 + 165 + 2;
                  this.bg.y = 240;
                  this.Spr16.addChildAt(this.bg,0);
               }
               if(this.siqiangArr[_loc2_].isCanyu)
               {
                  if(this.siqiangArr[_loc2_].guanjun)
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_3.swf");
                  }
                  else
                  {
                     this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_1.swf");
                  }
                  this.bg.x = 230 + 511 + 15;
                  this.bg.y = 132 + 215 * (_loc2_ - 2);
                  this.Spr16.addChild(this.bg);
                  _loc3_ = new FTextArea();
                  _loc3_.filters = StaticValue.filter;
                  _loc3_.defaultTextFormat = this.tf;
                  _loc3_.multiline = true;
                  _loc3_.wordWrap = true;
                  _loc3_.width = 132;
                  _loc3_.x = 270 + 360 - 12;
                  _loc3_.y = 155 + 215 * (_loc2_ - 2) - 12 - 5;
                  _loc3_.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + this.siqiangArr[_loc2_].name + "<br>[" + LanResManager.getLanCommonTextWords("帮会") + "]</font>";
                  this.Spr16.addChild(_loc3_);
               }
               else
               {
                  this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/zuo5_0.swf");
                  this.bg.x = 230 + 511 + 15;
                  this.bg.y = 132 + 215 * (_loc2_ - 2);
                  this.Spr16.addChildAt(this.bg,0);
               }
            }
            _loc2_++;
         }
      }
      
      public function setInitialize(param1:Array, param2:Array) : void
      {
         this.sai64.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("64强预选赛") + "<br><br>" + param1[0].riqi + "<br>" + param1[0].kaishi + LanResManager.getLanCommonTextWords("至") + "<br>" + param1[0].jieshu + "</font>";
         this.sai16.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("16强晋级赛") + "<br><br>" + param1[1].riqi + "<br>" + param1[1].kaishi + LanResManager.getLanCommonTextWords("至") + "<br>" + param1[1].jieshu + "</font>";
         this.sai4.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("半决赛") + "<br><br>" + param1[2].riqi + "<br>" + param1[2].kaishi + LanResManager.getLanCommonTextWords("至") + "<br>" + param1[2].jieshu + "</font>";
         this.sai2.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("决赛") + "<br><br>" + param1[3].riqi + "<br>" + param1[3].kaishi + LanResManager.getLanCommonTextWords("至") + "<br>" + param1[3].jieshu + "</font>";
         this.liucheng(param2);
      }
   }
}

