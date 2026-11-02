package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class PlantWishingTreePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var input:FTextInput;
      
      private var ft:FTextArea;
      
      private var btn:SecondButton;
      
      private var inputSpr:FCanvas;
      
      public function PlantWishingTreePanel()
      {
         super();
         this.skin = "panel_btn";
         width = 240;
         height = 390;
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("许愿树");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("填写许愿树寄语") + "</font>";
         this.ft.width = 120;
         addChild(this.ft);
         this.inputSpr = new FCanvas();
         this.inputSpr.skin = "box";
         this.inputSpr.width = 220;
         this.inputSpr.height = 153;
         addChild(this.inputSpr);
         this.inputSpr.x = 10;
         this.inputSpr.y = 30;
         this.input = new FTextInput();
         this.input.x = 15;
         this.input.y = 35;
         this.input.wordWrap = true;
         this.input.width = 215;
         this.input.height = 145;
         this.input.textColor = StaticValue.WHITE;
         addChild(this.input);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 190;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>    " + LanResManager.getLanCommonTextWords("种下许愿树后，许愿树会在当前坐标成长。和朋友们把许愿树重在一起吧！") + "<br>" + "    " + LanResManager.getLanCommonTextWords("种植许愿树后，要进行浇水，与好友互相浇水，才能让许愿树茁壮成长。") + "<br>" + "    " + LanResManager.getLanCommonTextWords("当许愿树从树苗变为参天大树时，可领取2014年植树纪念勋章。") + "</font>";
         this.ft.width = 210;
         this.ft.height = 125;
         this.ft.wordWrap = true;
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = 85;
         this.btn.y = 320;
         this.btn.label = LanResManager.getLanCommonTextWords("种下许愿树");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.input.text == "")
         {
            FAlert.show(LanResManager.getLanCommonTextWords("请写种树寄语！"));
            return;
         }
         PipeManager.sendMsg(PipeConstants.PLANTWISHINGTREE,this.input.text);
         this.input.text = "";
         this.onClose();
      }
   }
}

