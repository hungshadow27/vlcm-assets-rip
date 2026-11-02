package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AnqiMubaPanel extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var imgIco1:DisplayObject;
      
      private var OkBtn:SecondButton;
      
      private var CancelBtn:SecondButton;
      
      public function AnqiMubaPanel()
      {
         super();
         this.imgIco1 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/shenqimubai.png",440,354);
         this.imgIco1.x = 0;
         this.imgIco1.y = 0;
         addChild(this.imgIco1);
         this.OkBtn = new SecondButton();
         this.OkBtn.label = LanResManager.getLanTextWords(this,"使用神奇木耙突破");
         addChild(this.OkBtn);
         this.OkBtn.x = 55;
         this.OkBtn.y = 322;
         this.OkBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.CancelBtn = new SecondButton();
         this.CancelBtn.label = LanResManager.getLanTextWords(this,"留待下阶暗器突破瓶颈时使用");
         addChild(this.CancelBtn);
         this.CancelBtn.x = 215;
         this.CancelBtn.y = 322;
         this.CancelBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.OkBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJINGTISHI_MUBATUPO_CLICK));
               break;
            case this.CancelBtn:
               this.onClose();
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

