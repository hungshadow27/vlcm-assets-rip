package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class ShenDiaoXiaLvShenQingHuoDongPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var subBtn:FSimpleButton;
      
      private var sumBtn:FSimpleButton;
      
      private var count:FTextInput;
      
      private var shengyu:FTextArea;
      
      private var MAXsuipian:int;
      
      private var okBtn:SecondButton;
      
      private var line:int;
      
      private var tf:TextFormat;
      
      public function ShenDiaoXiaLvShenQingHuoDongPanel()
      {
         var _loc1_:FTextArea = null;
         var _loc2_:F9GridBitmap = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         dragAble = false;
         width = 260;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("申请活动");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         _loc1_.width = 200;
         _loc1_.height = 50;
         _loc1_.x = 20;
         _loc1_.y = 15;
         _loc1_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("输入索要提交的侠侣碎片数：") + "</font></textformat>";
         addChild(_loc1_);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 72 - 25;
         this.subBtn.y = 81 - 25;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc2_ = Tools.get9GridBitmpByName("countBg");
         addChild(_loc2_);
         _loc2_.width = 115;
         _loc2_.x = 98 - 27;
         _loc2_.y = 83 - 27 - 1;
         this.count = new FTextInput();
         this.count.restrict = "0-9";
         this.count.text = "1";
         this.count.textColor = 16777215;
         this.count.defaultTextFormat = this.tf;
         addChild(this.count);
         this.count.x = 94;
         this.count.y = 83 - 27;
         this.count.width = 60;
         this.count.height = 20;
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.sumBtn = new FSimpleButton();
         this.sumBtn.skin = "sumButton";
         addChild(this.sumBtn);
         this.sumBtn.x = 168 + 25;
         this.sumBtn.y = 81 - 25;
         this.sumBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shengyu = new FTextArea();
         this.shengyu.multiline = true;
         this.shengyu.autoSize = TextFieldAutoSize.LEFT;
         this.shengyu.wordWrap = true;
         this.shengyu.width = 150;
         this.shengyu.height = 50;
         this.shengyu.x = 40 - 16;
         this.shengyu.y = 108 - 13;
         addChild(this.shengyu);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 30 + 70;
         this.okBtn.y = 146 - 13;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.count.text = "1";
         POPWindowManager.closeWindow();
         this.$parent.dispatchEvent(new BaseEvent(ShenDiaoXiaLv.UI_SHENDIAOXIALV_CLOSE));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 1)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
               }
               else
               {
                  this.count.text = "1";
               }
               break;
            case this.sumBtn:
               if(int(this.count.text) >= this.MAXsuipian)
               {
                  this.count.text = this.MAXsuipian.toString();
               }
               else
               {
                  this.count.text = (int(this.count.text) + 1).toString();
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK,"",[this.line,int(this.count.text)]));
               this.onClose();
         }
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) <= 1)
         {
            this.count.text = "1";
         }
         if(int(this.count.text) >= this.MAXsuipian)
         {
            this.count.text = String(this.MAXsuipian);
         }
      }
      
      public function setTupoInit() : void
      {
         var _loc1_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(308972,true);
         this.MAXsuipian = _loc1_.count;
         this.shengyu.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("剩余侠侣碎片：") + this.MAXsuipian + "</font>";
      }
      
      public function setLine(param1:int) : void
      {
         this.line = param1;
      }
   }
}

