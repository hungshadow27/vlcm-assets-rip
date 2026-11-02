package com.tgame.shell.view.components.cycletask
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class CycTaskTipPopWindow extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var tip:FTextArea;
      
      private var ft:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var canceBtn:SecondButton;
      
      private var shopBtn:SecondButton;
      
      private var _type:int;
      
      private var _callBack:Function;
      
      public function CycTaskTipPopWindow(param1:Function = null)
      {
         var $callBack:Function = param1;
         super();
         this._callBack = $callBack;
         skin = "alert";
         width = 266;
         height = 144;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 6;
            y = 26;
            width = 254;
            height = 55;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.ft);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 6;
            y = 76;
            width = 254;
            height = 40;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = "";
         }
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = 116;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.canceBtn = new SecondButton();
         this.canceBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.canceBtn);
         this.canceBtn.x = width - this.canceBtn.width - 50;
         this.canceBtn.y = 116;
         this.canceBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shopBtn = new SecondButton();
         this.shopBtn.label = LanResManager.getLanCommonTextWords("商城购买");
         addChild(this.shopBtn);
         this.shopBtn.x = 50;
         this.shopBtn.y = 116;
         this.shopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this._callBack != null)
               {
                  this._callBack();
               }
               else if(this._type == 1)
               {
                  this.$parent.dispatchEvent(new BaseEvent("UI_CYCLETASK_UPGRADE_OK"));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent("UI_CYCLETASK_DIMINUTION_OK"));
               }
               this.close();
               break;
            case this.canceBtn:
               this.close();
               break;
            case this.shopBtn:
               this.$parent.dispatchEvent(new BaseEvent("UI_CYCLETASK_MALLBTN_CLICK"));
               this.close();
         }
      }
      
      private function close() : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function isItem(param1:Boolean) : void
      {
         switch(this._type)
         {
            case 1:
               if(param1)
               {
                  this.tip.text = "";
                  this.okBtn.visible = true;
                  this.shopBtn.visible = false;
               }
               else
               {
                  this.tip.text = LanResManager.getLanTextWords(this,1);
                  this.okBtn.visible = false;
                  this.shopBtn.visible = true;
               }
               break;
            case 2:
               if(param1)
               {
                  this.tip.text = "";
                  this.okBtn.visible = true;
                  this.shopBtn.visible = false;
               }
               else
               {
                  this.tip.text = LanResManager.getLanTextWords(this,2);
                  this.okBtn.visible = false;
                  this.shopBtn.visible = true;
               }
         }
      }
   }
}

