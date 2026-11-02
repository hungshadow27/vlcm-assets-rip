package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class TempListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function TempListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var spr:Sprite;
         var tf:TextFormat;
         var ft:FTextArea;
         var ico:Bitmap = null;
         _height = 20;
         spr = new Sprite();
         switch(data.state)
         {
            case "1":
               spr.name = "1";
               ico = StaticValue.getBitmapByClassName("ui.friend.ico.yan");
               break;
            case "2":
               spr.name = "2";
               ico = StaticValue.getBitmapByClassName("ui.friend.ico.tan");
         }
         if(ico != null)
         {
            addChild(spr);
            spr.x = 5;
            spr.addChild(ico);
            spr.buttonMode = true;
            spr.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         tf = new TextFormat();
         tf.color = data.line == "0" ? 6052956 : StaticValue.BLUE;
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 30;
            width = 170;
            height = 20;
            if(data.line != "0")
            {
               filters = StaticValue.filter;
            }
            defaultTextFormat = tf;
            htmlText = data.playerName;
         }
         addChild(ft);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "1":
               $parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_FRIEND_YANBTN_CLICK,"",int(data.label)));
               break;
            case "2":
               $parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_FRIEND_TANBTN_CLICK,"",int(data.label)));
         }
      }
   }
}

