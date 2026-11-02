package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNhesuishuPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var num:DisplayObject;
      
      private var spr:Sprite;
      
      public function YNhesuishuPanel()
      {
         super();
         width = 700;
         height = 195;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("贺岁树");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:FCanvas = null;
         var _loc2_:Bitmap = null;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.width = 500;
         _loc1_.height = 153;
         addChild(_loc1_);
         _loc1_.x = 10;
         _loc1_.y = 0;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box_transparence";
         _loc1_.width = 180;
         _loc1_.height = 153;
         addChild(_loc1_);
         _loc1_.x = 510;
         _loc1_.y = 0;
         _loc2_ = new Bitmap();
         _loc2_ = StaticValue.getBitmapByClassName("ui.line");
         _loc2_.x = 10;
         _loc2_.y = 110;
         _loc2_.width = 680;
         addChild(_loc2_);
         this.spr = new Sprite();
         addChild(this.spr);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 10;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("活动时间：");
         this.ft.width = 200;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 30;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("2016年01月21号（19点）- 2016年01月21号（21点）（贺岁树）") + "<br>" + LanResManager.getLanCommonTextWords("玩家充值888元宝将会获得贺岁果");
         this.ft.textColor = StaticValue.WHITE;
         this.ft.width = 480;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 120;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("备注：每一个服务器只有8个贺岁果");
         this.ft.textColor = StaticValue.RED;
         this.ft.width = 500;
         this.ft.height = 20;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = 550 + 25;
         this.btn.y = 120;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53095,[51]);
      }
      
      public function setData(param1:int) : void
      {
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         this.num = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/pingmuTishi/" + param1 + ".swf");
         this.num.x = 600 - 55 + 25;
         this.num.y = 50 - 20;
         this.spr.addChild(this.num);
         if(param1 <= 0)
         {
            this.btn.enabled = false;
         }
         else
         {
            this.btn.enabled = true;
         }
      }
   }
}

