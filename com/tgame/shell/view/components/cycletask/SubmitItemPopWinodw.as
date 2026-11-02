package com.tgame.shell.view.components.cycletask
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SubmitItemPopWinodw extends FPanel
   {
      
      public static const UI_CYCLETASK_ITEM_SUBMIT:String = "UI_CYCLETASK_ITEM_SUBMIT";
      
      private var container:Sprite;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var id:int;
      
      public function SubmitItemPopWinodw()
      {
         var img:Bitmap;
         var ft:FTextArea;
         super();
         skin = "sceondPanel";
         showCloseButton = true;
         width = 208;
         height = 185;
         titleText = LanResManager.getLanTextWords(this,"任务品提交");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.cycletask.submit.item.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 12;
            width = 183;
            height = 35;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(ft);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 10;
         this.container.y = 43;
         this.container.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("提交");
         addChild(this.okBtn);
         this.okBtn.x = 28;
         this.okBtn.y = 127;
         this.okBtn.enabled = false;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 28;
         this.cancelBtn.y = 127;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public static function showSubmitItemPanel(param1:Array) : DisplayObject
      {
         var _loc2_:SubmitItemPopWinodw = new SubmitItemPopWinodw();
         _loc2_.setItem(param1);
         POPWindowManager.showWindow(_loc2_,false);
         return _loc2_;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_ITEM_SUBMIT,"",this.id));
               this.okBtn.enabled = false;
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.container.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (this.container.getChildAt(_loc2_) as ItemFace).showFram = false;
            _loc2_++;
         }
         (param1.target as ItemFace).showFram = true;
         this.id = (param1.target as ItemFace).getBaseItem().position;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.okBtn.enabled = false;
         dispatchEvent(new BaseEvent(UI_CYCLETASK_ITEM_SUBMIT,"",-1));
         POPWindowManager.closeWindow();
      }
      
      private function setItem(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         if(param1.length > 10)
         {
            _loc2_ = param1.slice(0,10);
         }
         else
         {
            _loc2_ = param1;
         }
         var _loc5_:int = int(_loc2_.length);
         _loc3_ = 0;
         loop1:
         while(_loc3_ < 2)
         {
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               if(_loc3_ * 5 + _loc4_ == _loc5_)
               {
                  break loop1;
               }
               _loc6_ = new ItemFace(param1[_loc3_ * 5 + _loc4_] as Goods);
               this.container.addChild(_loc6_);
               _loc6_.x = _loc4_ * 38;
               _loc6_.y = _loc3_ * 38;
               _loc4_++;
            }
            _loc3_++;
         }
         if(this.container.numChildren > 0)
         {
            (this.container.getChildAt(0) as ItemFace).showFram = true;
            this.id = (this.container.getChildAt(0) as ItemFace).getBaseItem().position;
            this.okBtn.enabled = true;
         }
      }
   }
}

