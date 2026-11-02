package com.tgame.shell.view.components.mainui
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import gs.TweenLite;
   
   public class SysAfficheCanvas extends Sprite
   {
      
      private var tip:FTextArea;
      
      private var timeId:int = -1;
      
      public function SysAfficheCanvas()
      {
         var tf:TextFormat;
         super();
         tf = new TextFormat();
         tf.color = StaticValue.YELLOW;
         tf.align = "center";
         tf.bold = true;
         tf.size = 30;
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 500;
            wordWrap = true;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
         }
         addChild(this.tip);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
      }
      
      private function hide() : void
      {
         TweenLite.to(this,2,{"alpha":0});
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         GameInstance.scene.sceneDispatchEvent(param1);
      }
      
      public function setTip(param1:String) : void
      {
         if(this.timeId != -1)
         {
            clearTimeout(this.timeId);
         }
         this.alpha = 1;
         this.tip.htmlText = param1;
         this.timeId = setTimeout(this.hide,5000);
      }
   }
}

