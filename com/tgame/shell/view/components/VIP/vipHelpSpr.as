package com.tgame.shell.view.components.VIP
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.shell.view.components.VIP;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class vipHelpSpr extends Sprite
   {
      
      private var closeBtn:FSimpleButton;
      
      private var ft:FTextArea;
      
      public var $parent:DisplayObject;
      
      public function vipHelpSpr()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/VIP/vipHelp.swf",242,385);
         _loc1_.x = 0;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 210;
         this.closeBtn.y = 10;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(VIP.UI_VIPGUIZE_CLOSE,"",0));
      }
   }
}

