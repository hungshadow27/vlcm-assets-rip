package com.tgame.shell.view.components.mainui
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class MainBiwuDahuiCanvas extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var kuafuBtn:SecondButton;
      
      private var likaiBtn:SecondButton;
      
      public function MainBiwuDahuiCanvas()
      {
         super();
         this.kuafuBtn = new SecondButton();
         this.kuafuBtn.label = LanResManager.getLanCommonTextWords("打开跨服包裹");
         addChild(this.kuafuBtn);
         this.kuafuBtn.x = 0;
         this.kuafuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.likaiBtn = new SecondButton();
         this.likaiBtn.label = LanResManager.getLanCommonTextWords("离开");
         addChild(this.likaiBtn);
         this.likaiBtn.x = 0;
         this.likaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.likaiBtn.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kuafuBtn:
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,"",3));
               break;
            case this.likaiBtn:
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_LIKAI_CLICK));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setBtn(param1:int) : void
      {
         if(param1 == 1)
         {
            this.kuafuBtn.visible = true;
            this.likaiBtn.visible = true;
            this.likaiBtn.y = this.kuafuBtn.y + this.kuafuBtn.height + 5;
         }
         else if(param1 == 2)
         {
            this.kuafuBtn.visible = false;
            this.likaiBtn.visible = true;
            this.likaiBtn.y = this.kuafuBtn.y;
         }
         else if(param1 == 3)
         {
            this.kuafuBtn.visible = true;
            this.likaiBtn.visible = false;
         }
      }
   }
}

