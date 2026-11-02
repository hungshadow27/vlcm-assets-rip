package com.fireice.scroll
{
   import com.fireice.base.FUIComponent;
   import com.fireice.button.FSimpleButton;
   import com.fireice.init.SkinInit;
   import com.fireice.panel.FCanvas;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.getTimer;
   
   public class FVScorllBar extends FUIComponent
   {
      
      private var _skin:String;
      
      private var isText:Boolean;
      
      private var target:DisplayObject;
      
      private var Text:TextField;
      
      private var ui:DisplayObject;
      
      internal var upBtn:FSimpleButton;
      
      internal var bottonBtn:FSimpleButton;
      
      internal var bgMc:FCanvas;
      
      internal var slipBtn:FSimpleButton;
      
      internal var ScrollBarHeight:Number;
      
      internal var slipVar:Number;
      
      internal var originalSlipHeight:Number;
      
      internal var slipHeight:Number;
      
      internal var putTime:uint;
      
      internal var rect:Rectangle;
      
      internal var uiHeight:Number;
      
      internal var scrollMask:Sprite;
      
      private var slipBtnHeight:Number;
      
      private var maskWidth:Number;
      
      public function FVScorllBar(param1:DisplayObject, param2:int = 100, param3:int = 100)
      {
         super();
         this.target = param1;
         this.ScrollBarHeight = param2;
         if(param1 is TextField)
         {
            this.isText = true;
            this.initTextScroll();
            this.Text = param1 as TextField;
         }
         else
         {
            this.ui = param1;
            this.isText = false;
            this.maskWidth = param3 == 100 ? this.target.width : param3;
            this.initPanelScroll();
         }
         this.skin = "vScrollBar";
      }
      
      public function set skin(param1:String) : void
      {
         this._skin = param1;
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.track[0];
         this.bgMc.skin = _loc3_.@link;
         _loc3_ = _loc2_.upButton[0];
         this.upBtn.skin = _loc3_.@link;
         _loc3_ = _loc2_.slipButton[0];
         this.slipBtn.skin = _loc3_.@link;
         this.slipBtnHeight = this.slipBtn.height;
         _loc3_ = _loc2_.bottomButton[0];
         this.bottonBtn.skin = _loc3_.@link;
         this.reSize();
      }
      
      private function reSize() : void
      {
         this.upBtn.x = (this.bgMc.width - this.upBtn.width) / 2;
         this.bgMc.height = this.ScrollBarHeight;
         this.bottonBtn.x = (this.bgMc.width - this.bottonBtn.width) / 2;
         this.bottonBtn.y = this.bgMc.height - this.bottonBtn.height;
         this.slipBtn.x = (this.bgMc.width - this.slipBtn.width) / 2;
         this.slipBtn.y = this.upBtn.height;
         this.slipBtn.height = this.slipBtnHeight;
         this.originalSlipHeight = this.slipHeight = this.bgMc.height - this.slipBtn.height - this.upBtn.height - this.bottonBtn.height;
      }
      
      override public function set height(param1:Number) : void
      {
         this.ScrollBarHeight = param1;
         this.reSize();
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this.maskWidth = param1;
         if(!this.isText)
         {
            this.scrollMask.graphics.clear();
            this.scrollMask.graphics.beginFill(16777215);
            this.scrollMask.graphics.drawRect(0,0,this.maskWidth,param2);
            this.scrollMask.graphics.endFill();
            this.target.mask = this.scrollMask;
         }
         this.height = param2;
      }
      
      private function initTextScroll() : void
      {
         this.bgMc = new FCanvas();
         addChild(this.bgMc);
         this.bgMc.width = 15;
         this.upBtn = new FSimpleButton();
         addChild(this.upBtn);
         this.bottonBtn = new FSimpleButton();
         addChild(this.bottonBtn);
         this.slipBtn = new FSimpleButton();
         addChild(this.slipBtn);
         this.bgMc.height = this.ScrollBarHeight;
         this.bottonBtn.y = this.bgMc.height - this.bottonBtn.height;
         this.slipBtn.y = this.upBtn.height;
         visible = false;
         addEventListener(Event.ENTER_FRAME,this.addStageEvent);
      }
      
      private function addStageEvent(param1:Event = null) : void
      {
         if(!stage)
         {
            return;
         }
         if(this.isText)
         {
            this.Text.addEventListener(Event.SCROLL,this.textScroll);
            this.upBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.textUpBtnDown);
            this.bottonBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.textBottonBtnDown);
            this.slipBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.textSlipDown);
            param1.target.removeEventListener(Event.ENTER_FRAME,this.addStageEvent);
         }
         else
         {
            if(this.uiHeight + this.ScrollBarHeight > this.ScrollBarHeight)
            {
               visible = true;
               this.slipBtn.y = this.bgMc.y + this.upBtn.height;
               this.slipBtn.height = this.ScrollBarHeight / this.ui.height * this.originalSlipHeight;
               this.slipHeight = this.bgMc.height - this.slipBtn.height - this.upBtn.height - this.bottonBtn.height;
            }
            else
            {
               visible = false;
            }
            this.ui.addEventListener(MouseEvent.MOUSE_WHEEL,this.panelScroll);
            this.upBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.upBtnDown);
            this.bottonBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.bottonBtnDown);
            this.slipBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.slipDown);
            if(param1 != null)
            {
               param1.target.removeEventListener(Event.ENTER_FRAME,this.addStageEvent);
            }
         }
      }
      
      private function textScroll(param1:Event) : void
      {
         if(this.Text.maxScrollV != 1)
         {
            visible = true;
            this.slipVar = this.Text.scrollV / this.Text.maxScrollV;
            this.slipBtn.height = this.ScrollBarHeight / (this.Text.textHeight + 4) * this.originalSlipHeight;
            this.slipHeight = this.bgMc.height - this.slipBtn.height - this.upBtn.height - this.bottonBtn.height;
            if(this.Text.scrollV != 1)
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * this.slipVar;
            }
            else
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height;
            }
         }
         else
         {
            visible = false;
         }
      }
      
      private function textSlipDown(param1:MouseEvent) : void
      {
         this.Text.removeEventListener(Event.SCROLL,this.textScroll);
         var _loc2_:Rectangle = new Rectangle(this.slipBtn.x,this.bgMc.y + this.upBtn.height,0,this.slipHeight);
         this.slipBtn.startDrag(false,_loc2_);
         addEventListener(Event.ENTER_FRAME,this.textslipBtnDownTime);
         this.slipBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.textSlipUp);
      }
      
      private function textslipBtnDownTime(param1:Event) : void
      {
         this.Text.scrollV = Math.round((this.slipBtn.y - this.upBtn.height) / this.slipHeight * this.Text.maxScrollV);
      }
      
      private function textSlipUp(param1:MouseEvent) : void
      {
         this.Text.addEventListener(Event.SCROLL,this.textScroll);
         this.slipBtn.stopDrag();
         this.slipBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.textSlipUp);
      }
      
      private function textUpBtnDown(param1:MouseEvent) : void
      {
         --this.Text.scrollV;
         if(this.Text.scrollV > 1)
         {
            this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * (this.Text.scrollV / this.Text.maxScrollV);
         }
         else
         {
            this.slipBtn.y = this.bgMc.y + this.upBtn.height;
         }
         this.putTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.textUpBtnDownTime);
         this.upBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.textUpBtnUp);
      }
      
      private function textUpBtnDownTime(param1:Event) : void
      {
         if(getTimer() - this.putTime > 500)
         {
            --this.Text.scrollV;
            if(this.Text.scrollV > 1)
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * (this.Text.scrollV / this.Text.maxScrollV);
            }
            else
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height;
            }
         }
      }
      
      private function textUpBtnUp(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.textUpBtnDownTime);
         this.upBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.textUpBtnUp);
      }
      
      private function textBottonBtnDown(param1:MouseEvent) : void
      {
         ++this.Text.scrollV;
         this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * (this.Text.scrollV / this.Text.maxScrollV);
         this.putTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.textBottonBtnTime);
         this.bottonBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.textBottonBtnUp);
      }
      
      private function textBottonBtnTime(param1:Event) : void
      {
         if(getTimer() - this.putTime > 500)
         {
            ++this.Text.scrollV;
            this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * (this.Text.scrollV / this.Text.maxScrollV);
         }
      }
      
      private function textBottonBtnUp(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.textBottonBtnTime);
         this.bottonBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.textBottonBtnUp);
      }
      
      private function initPanelScroll() : void
      {
         this.bgMc = new FCanvas();
         addChild(this.bgMc);
         this.bgMc.width = 15;
         this.upBtn = new FSimpleButton();
         addChild(this.upBtn);
         this.bottonBtn = new FSimpleButton();
         addChild(this.bottonBtn);
         this.slipBtn = new FSimpleButton();
         addChild(this.slipBtn);
         this.scrollMask = new Sprite();
         this.ui.parent.addChild(this.scrollMask);
         this.scrollMask.x = this.ui.x;
         this.scrollMask.y = this.ui.y;
         this.scrollMask.graphics.beginFill(16777215);
         this.scrollMask.graphics.drawRect(0,0,this.maskWidth,this.ScrollBarHeight);
         this.scrollMask.graphics.endFill();
         this.ui.mask = this.scrollMask;
         this.uiHeight = this.ui.height - this.ScrollBarHeight;
         this.bgMc.height = this.ScrollBarHeight;
         this.bottonBtn.y = this.bgMc.height - this.bottonBtn.height;
         this.slipBtn.y = this.upBtn.height;
         this.slipHeight = this.bgMc.height - this.slipBtn.height - this.upBtn.height - this.bottonBtn.height;
         visible = false;
         addEventListener(Event.ENTER_FRAME,this.addStageEvent);
      }
      
      public function update(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         if(this.target is TextField)
         {
            return;
         }
         var _loc2_:int = this.slipBtn.y;
         this.reSize();
         this.uiHeight = this.ui.height - this.ScrollBarHeight;
         if(param1)
         {
            this.slipBtn.y = _loc2_;
            _loc3_ = this.scrollMask.y - (_loc2_ - this.bgMc.y - this.upBtn.height) * this.uiHeight / this.slipHeight;
            this.ui.y = _loc3_;
         }
         else
         {
            this.ui.y = this.scrollMask.y;
         }
         if(this.uiHeight + this.ScrollBarHeight > this.ScrollBarHeight)
         {
            visible = true;
            this.slipBtn.height = this.ScrollBarHeight / this.ui.height * this.slipHeight;
            this.slipHeight = this.bgMc.height - this.slipBtn.height - this.upBtn.height - this.bottonBtn.height;
            if(this.slipBtn.y + this.slipBtn.height > this.bottonBtn.y)
            {
               this.slipBtn.y = this.bottonBtn.y - this.slipBtn.height;
            }
         }
         else
         {
            visible = false;
         }
      }
      
      private function slipDown(param1:MouseEvent) : void
      {
         var _loc2_:Rectangle = new Rectangle(this.slipBtn.x,this.bgMc.y + this.upBtn.height,0,this.slipHeight);
         this.slipBtn.startDrag(false,_loc2_);
         addEventListener(Event.ENTER_FRAME,this.slipBtnDownTime);
         this.slipBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.slipUp);
      }
      
      private function slipBtnDownTime(param1:Event) : void
      {
         this.ui.y = this.scrollMask.y - (this.slipBtn.y - this.upBtn.height - this.bgMc.y) / this.slipHeight * this.uiHeight;
      }
      
      private function slipUp(param1:MouseEvent) : void
      {
         this.slipBtn.stopDrag();
         this.slipBtn.stage.removeEventListener(Event.ENTER_FRAME,this.slipBtnDownTime);
         this.slipBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.slipUp);
      }
      
      private function panelScroll(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            if(this.scrollMask.y - this.ui.y > 10 * 2)
            {
               this.ui.y += 10 * 2;
            }
            else
            {
               this.ui.y = this.scrollMask.y;
            }
            if(this.scrollMask.y - this.ui.y > 0)
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
            }
            else
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height;
            }
         }
         else if(param1.delta < 0)
         {
            if(this.scrollMask.y - this.ui.y < this.uiHeight - 10 * 2)
            {
               this.ui.y -= 10 * 2;
            }
            else
            {
               this.ui.y = this.scrollMask.y - this.uiHeight;
            }
            this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
         }
      }
      
      public function setScrollPosition(param1:int) : void
      {
         if(param1 > this.ui.height - this.scrollMask.height)
         {
            param1 = this.ui.height - this.scrollMask.height;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.ui.y = this.scrollMask.y - param1;
         this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
      }
      
      private function upBtnDown(param1:MouseEvent) : void
      {
         if(this.scrollMask.y - this.ui.y > 10)
         {
            this.ui.y += 10;
         }
         else
         {
            this.ui.y = this.scrollMask.y;
         }
         if(this.scrollMask.y - this.ui.y > 0)
         {
            this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
         }
         else
         {
            this.slipBtn.y = this.bgMc.y + this.upBtn.height;
         }
         this.putTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.upBtnDownTime);
         this.upBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.upBtnUp);
      }
      
      private function upBtnDownTime(param1:Event) : void
      {
         if(getTimer() - this.putTime > 500)
         {
            if(this.scrollMask.y - this.ui.y > 10)
            {
               this.ui.y += 10;
            }
            else
            {
               this.ui.y = this.scrollMask.y;
            }
            if(this.scrollMask.y - this.ui.y > 0)
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
            }
            else
            {
               this.slipBtn.y = this.bgMc.y + this.upBtn.height;
            }
         }
      }
      
      private function upBtnUp(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.upBtnDownTime);
         this.upBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.upBtnUp);
      }
      
      private function bottonBtnDown(param1:MouseEvent) : void
      {
         if(this.scrollMask.y - this.ui.y < this.uiHeight - 10)
         {
            this.ui.y -= 10;
         }
         else
         {
            this.ui.y = this.scrollMask.y - this.uiHeight;
         }
         this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
         this.putTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.bottonBtnTime);
         this.bottonBtn.stage.addEventListener(MouseEvent.MOUSE_UP,this.bottonBtnUp);
      }
      
      private function bottonBtnTime(param1:Event) : void
      {
         if(getTimer() - this.putTime > 500)
         {
            if(this.scrollMask.y - this.ui.y < this.uiHeight - 10)
            {
               this.ui.y -= 10;
            }
            else
            {
               this.ui.y = this.scrollMask.y - this.uiHeight;
            }
            this.slipBtn.y = this.bgMc.y + this.upBtn.height + this.slipHeight * ((this.scrollMask.y - this.ui.y) / this.uiHeight);
         }
      }
      
      private function bottonBtnUp(param1:MouseEvent) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.bottonBtnTime);
         this.bottonBtn.stage.removeEventListener(MouseEvent.MOUSE_UP,this.bottonBtnUp);
      }
   }
}

