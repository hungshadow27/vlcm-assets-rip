package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.*;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ReleaseRidePanel extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var id:String;
      
      private var backgroud:Sprite;
      
      private var panel:FPanel;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function ReleaseRidePanel()
      {
         var img:Bitmap;
         var tip:FTextArea;
         super();
         this.panel = new FPanel();
         this.panel.skin = "sceondPanel_btn";
         this.panel.showCloseButton = true;
         this.panel.width = 254;
         this.panel.height = 236;
         this.panel.titleText = LanResManager.getLanCommonTextWords("坐骑放生");
         this.panel.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.backgroud = new Sprite();
         addChild(this.backgroud);
         addChild(this.panel);
         img = StaticValue.getBitmapByClassName("ui.ride.release.ui");
         this.panel.addChild(img);
         img.x = 6;
         img.y = 2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAdd);
         tip = new FTextArea();
         with(tip)
         {
            width = 230;
            height = 20;
            x = 12;
            y = 8;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望将该坐骑放生吗？") + "</font></textformat>";
         }
         this.panel.addChild(tip);
         tip = new FTextArea();
         with(tip)
         {
            width = 230;
            height = 40;
            x = 12;
            y = 35;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"放生后") + "</font></textformat>";
         }
         this.panel.addChild(tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         this.panel.addChild(this.okBtn);
         this.okBtn.x = 36;
         this.okBtn.y = 183;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         this.panel.addChild(this.cancelBtn);
         this.cancelBtn.x = 158;
         this.cancelBtn.y = 183;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_RELEASE_CLICK,"",this.id));
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
               break;
            case this.cancelBtn:
               if(parent != null)
               {
                  this.parent.removeChild(this);
               }
         }
      }
      
      private function onAdd(param1:Event) : void
      {
         var e:Event = param1;
         with(this.backgroud.graphics)
         {
            clear();
            beginFill(0,0.5);
            drawRect(0,0,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight);
            endFill();
         }
         this.panel.visible = true;
         this.panel.x = (Tools.currentStage.stageWidth - 254) / 2;
         this.panel.y = (Tools.currentStage.stageHeight - 236) / 2;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         var $w:Number = param1;
         var $h:Number = param2;
         with(this.backgroud.graphics)
         {
            clear();
            beginFill(0,0.5);
            drawRect(0,0,$w,$h);
            endFill();
         }
         this.panel.x = ($w - this.panel.width) / 2;
         this.panel.y = ($h - this.panel.height) / 2;
      }
   }
}

