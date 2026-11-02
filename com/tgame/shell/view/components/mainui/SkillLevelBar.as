package com.tgame.shell.view.components.mainui
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SkillLevelBar extends Sprite
   {
      
      private var skillBar:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var lvFta:FTextArea;
      
      private var now:Number;
      
      private var max:Number;
      
      private var num:FTextArea;
      
      private var type:int;
      
      public var skillBarArr:Array;
      
      public function SkillLevelBar()
      {
         this.skillBarArr = [];
         super();
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
         this.num = new FTextArea();
         with(this.num)
         {
            filters = StaticValue.filter;
            width = 108;
            height = 18;
            x = 70;
            y = 3;
            textColor = StaticValue.WHITE;
            text = "0/100";
         }
         addChild(this.num);
         this.lvFta = new FTextArea();
         with(this.lvFta)
         {
            filters = StaticValue.filter;
            width = 108;
            height = 18;
            x = 170;
            y = 5;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("技能等级");
         }
         addChild(this.lvFta);
         addEventListener(MouseEvent.MOUSE_OVER,this.onBarTips);
         addEventListener(MouseEvent.MOUSE_OUT,this.onBarTips);
      }
      
      public function setValue(param1:int, param2:Number, param3:Number, param4:int) : void
      {
         this.lvFta.htmlText = "<font size=\'14\' color=\'" + this.getColorByType() + "\'>" + LanResManager.getLanCommonTextWords("技能") + param1 + LanResManager.getLanCommonTextWords("级") + "</font>";
         this.max = param3;
         this.now = param2;
         if(this.skillBar)
         {
            this.skillBar.gotoAndStop(int(param2 / param3 * 100));
         }
         this.num.htmlText = "<font size=\'14\' color=\'" + StaticValue.WHITE_HTML + "\'>" + param4 + "%</font>";
      }
      
      public function getColorByType() : String
      {
         switch(this.type)
         {
            case 1:
               return StaticValue.RED_HTML;
            case 2:
               return StaticValue.ORANGE_HTML;
            case 3:
               return StaticValue.BLUE_HTML;
            case 4:
               return StaticValue.GREEN_HTML;
            default:
               return StaticValue.WHITE_HTML;
         }
      }
      
      public function setType(param1:int) : void
      {
         var type:int = param1;
         this.type = type;
         if(this.skillBar != null && this.skillBar.parent != null)
         {
            this.skillBar.parent.removeChild(this.skillBar);
         }
         if(this.skillBarArr[type] == null)
         {
            LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/skillbar" + type + ".swf",function(param1:MovieClip):*
            {
               if(param1)
               {
                  skillBar = param1;
                  skillBar.gotoAndStop(int(now / max * 100));
                  addChildAt(skillBar,0);
                  skillBarArr[type] = skillBar;
                  skillBar.addEventListener(MouseEvent.MOUSE_OVER,onBarTips);
                  skillBar.addEventListener(MouseEvent.MOUSE_OUT,onBarTips);
               }
            });
         }
         else
         {
            this.skillBar = this.skillBarArr[type];
            this.skillBar.gotoAndStop(1);
            addChildAt(this.skillBar,0);
            this.skillBarArr[type] = this.skillBar;
         }
      }
      
      private function onBarTips(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onBarTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               switch(this.type)
               {
                  case 1:
                     _loc2_ = LanResManager.getLanCommonTextWords("少林派弟子 红色技能点");
                     break;
                  case 2:
                     _loc2_ = LanResManager.getLanCommonTextWords("全真派弟子 黄色技能点");
                     break;
                  case 3:
                     _loc2_ = LanResManager.getLanCommonTextWords("古墓派弟子 蓝色技能点");
                     break;
                  case 4:
                     _loc2_ = LanResManager.getLanCommonTextWords("桃花派弟子 绿色技能点");
               }
               this.showTip(_loc2_ + ":" + this.now + "/" + this.max);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onBarTips);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 6;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
         Tools.currentStage.addChild(this.tipCanvas);
         if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         }
         if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 10;
         }
      }
      
      private function resize() : void
      {
      }
   }
}

