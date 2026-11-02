package com.tgame.shell.view.components.ride
{
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class TargetRideDataCanvas extends FPanel
   {
      
      private var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft_wx:FTextArea;
      
      private var ft_pj:FTextArea;
      
      private var bar1:ColorBar;
      
      private var bar2:ColorBar;
      
      private var bar3:ColorBar;
      
      private var bar4:ColorBar;
      
      private var bar5:ColorBar;
      
      private var bit:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bmpSpr:Sprite;
      
      private var strs:String = "";
      
      public function TargetRideDataCanvas()
      {
         super();
         this.skin = "panel";
         this.showCloseButton = false;
         width = 330;
         height = 370;
         titleText = LanResManager.getLanCommonTextWords("坐骑属性");
         this.init();
      }
      
      private function init() : void
      {
         var barBg:Bitmap = null;
         var text:FLabel = new FLabel();
         with(text)
         {
            x = 32;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前坐骑属性");
         }
         addChild(text);
         this.bit = StaticValue.getBitmapByClassName("ui.line");
         this.bit.x = 10;
         this.bit.y = 22;
         this.bit.width = 305;
         addChild(this.bit);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70 + 20;
         barBg.y = 53;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70 + 20;
         barBg.y = 73;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70 + 20;
         barBg.y = 93;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70 + 20;
         barBg.y = 113;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70 + 20;
         barBg.y = 133;
         this.bar1 = new ColorBar(5,212,5);
         addChild(this.bar1);
         this.bar1.x = 72 + 20;
         this.bar1.y = 55;
         this.bar2 = new ColorBar(5,212,5);
         addChild(this.bar2);
         this.bar2.x = 72 + 20;
         this.bar2.y = 75;
         this.bar3 = new ColorBar(5,212,5);
         addChild(this.bar3);
         this.bar3.x = 72 + 20;
         this.bar3.y = 95;
         this.bar4 = new ColorBar(5,212,5);
         addChild(this.bar4);
         this.bar4.x = 72 + 20;
         this.bar4.y = 115;
         this.bar5 = new ColorBar(5,212,5);
         addChild(this.bar5);
         this.bar5.x = 72 + 20;
         this.bar5.y = 135;
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("悟性：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 175 + 15;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("品级：") + "</font>";
         addChild(this.ft);
         this.ft_wx = new FTextArea();
         this.ft_wx.x = 50 + 15;
         this.ft_wx.y = 30;
         addChild(this.ft_wx);
         this.ft_pj = new FTextArea();
         this.ft_pj.x = 225 + 15;
         this.ft_pj.y = 30;
         addChild(this.ft_pj);
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 50;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("出战潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 90;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 110;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轻身潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10 + 15;
         this.ft.y = 130;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("健体潜力：") + "</font>";
         addChild(this.ft);
         this.bit = StaticValue.getBitmapByClassName("ui.line");
         this.bit.x = 10;
         this.bit.y = 150;
         this.bit.width = 305;
         addChild(this.bit);
         this.bmpSpr = new Sprite();
         this.bmpSpr.x = 30;
         this.bmpSpr.y = 150;
         addChild(this.bmpSpr);
      }
      
      private function onBitMouse(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:int = int(_loc2_.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               Tools.currentStage.addChild(this.tipCanvas);
               this.$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TARGETRIDETIPS_SHOW,"",_loc3_));
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.strs != "")
               {
                  this.showTip(this.strs);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               this.tipCanvas.visible = false;
               Tools.currentStage.removeChild(this.tipCanvas);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
         this.tipCanvas.visible = true;
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function setData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int) : void
      {
         this.ft_pj.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         this.ft_wx.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.bar1.setValue(param3,param4);
         this.bar2.setValue(param5,param6,param7);
         this.bar3.setValue(param8,param9,param10);
         this.bar4.setValue(param11,param12,param13);
         this.bar5.setValue(param14,param15,param16);
         this.setStatus(param17);
      }
      
      public function setStatus(param1:int) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc6_:Bitmap = null;
         while(this.bmpSpr.numChildren != 0)
         {
            this.bmpSpr.removeChildAt(0);
         }
         var _loc3_:* = 0;
         var _loc4_:String = "";
         var _loc5_:int = 1;
         while(_loc5_ <= 10)
         {
            if(_loc5_ <= param1)
            {
               _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/" + _loc5_ + "_1.swf");
            }
            else
            {
               _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/" + _loc5_ + "_0.swf");
            }
            if(_loc5_ < 5)
            {
               _loc2_.y = 0;
            }
            else if(_loc5_ < 9)
            {
               _loc2_.y = 60;
            }
            else
            {
               _loc2_.y = 120;
            }
            if(_loc5_ == 5)
            {
               _loc3_ = 0;
            }
            else if(_loc5_ == 9)
            {
               _loc3_ = 1;
            }
            _loc2_.x = _loc3_ * 66;
            _loc3_++;
            this.bmpSpr.addChild(_loc2_);
            _loc2_.name = String(_loc5_);
            if(!_loc2_.hasEventListener(MouseEvent.MOUSE_OVER))
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.onBitMouse);
            }
            if(!_loc2_.hasEventListener(MouseEvent.MOUSE_OUT))
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.onBitMouse);
            }
            if(!_loc2_.hasEventListener(MouseEvent.MOUSE_MOVE))
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onBitMouse);
            }
            _loc5_++;
         }
      }
      
      public function setTips(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Goods = null;
         var _loc2_:String = "";
         if(int(param1[0]) == -1)
         {
            _loc2_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该兽元未激活！") + "</font>";
         }
         else
         {
            _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("该兽元加成属性：") + "<br>";
            if(int(param1[0] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("攻击：") + param1[0] + "<br>";
            }
            if(int(param1[1] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("防御：") + param1[1] + "<br>";
            }
            if(int(param1[2] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("暴击：") + param1[2] + "<br>";
            }
            if(int(param1[3] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("闪避：") + param1[3] + "<br>";
            }
            if(int(param1[4] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("生命：") + param1[4] + "<br>";
            }
            if(int(param1[5] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("内力：") + param1[5] + "<br>";
            }
            if(int(param1[6] != 0))
            {
               _loc2_ += LanResManager.getLanCommonTextWords("体力：") + param1[6];
            }
            if(param1.length > 7)
            {
               _loc3_ = 7;
               while(_loc3_ < param1.length)
               {
                  if(int(param1[_loc3_]) != 0)
                  {
                     if(_loc3_ == 7)
                     {
                        _loc2_ += "<br>" + LanResManager.getLanCommonTextWords("修炼技能：") + "<br>";
                     }
                     _loc4_ = new Goods(int(param1[_loc3_]));
                     _loc2_ += _loc4_.res.name + "<br>";
                  }
                  _loc3_++;
               }
            }
            _loc2_ += "</font>";
         }
         this.strs = _loc2_;
         this.showTip(_loc2_);
      }
   }
}

