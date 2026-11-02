package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.text.TextFormat;
   
   public class ShiTuListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var isWrite:Boolean;
      
      private var text_chenghao:FTextInput;
      
      private var updateArr:Array;
      
      public function ShiTuListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var icon:Bitmap = null;
         if(data.state == "1")
         {
            icon = StaticValue.getBitmapByClassName("ui.shitu.shi.txt");
            addChild(icon);
         }
         tf = new TextFormat();
         tf.color = data.line == "0" ? 6052956 : StaticValue.BLUE;
         ft = new FTextArea();
         with(ft)
         {
            name = "playerName";
            x = 18;
            y = 2;
            width = 120;
            height = 20;
            if(data.line != "0")
            {
               filters = StaticValue.filter;
            }
            defaultTextFormat = tf;
            htmlText = data.playerName;
         }
         addChild(ft);
         ft = new FTextArea();
         tf.align = "center";
         with(ft)
         {
            name = "playerLv";
            x = 125;
            y = 2;
            width = 45;
            height = 20;
            if(data.line != "0")
            {
               filters = StaticValue.filter;
            }
            defaultTextFormat = tf;
            htmlText = data.lv;
         }
         addChild(ft);
         this.text_chenghao = new FTextInput();
         with(this.text_chenghao)
         {
            x = 160;
            y = 2;
            width = 55;
            height = 20;
            if(data.line != "0")
            {
               filters = StaticValue.filter;
            }
            mouseEnabled = isWrite;
            defaultTextFormat = tf;
            htmlText = data.otherName;
         }
         addChild(this.text_chenghao);
         this.text_chenghao.setMaxChars(8);
         this.text_chenghao.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.text_chenghao.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         switch(param1.type)
         {
            case FocusEvent.FOCUS_IN:
               this.text_chenghao.selectable = true;
               this.text_chenghao.text = "";
               break;
            case FocusEvent.FOCUS_OUT:
               this.text_chenghao.selectable = false;
               if(this.text_chenghao.text == "")
               {
                  this.text_chenghao.text = data.otherName;
               }
               else
               {
                  this.updateArr = new Array();
                  this.updateArr.push(data.label);
                  this.updateArr.push(this.text_chenghao.text);
                  $parent.dispatchEvent(new BaseEvent(FriendPanel.UI_SHITU_CHENGHAOTXT_SET,"",this.updateArr));
               }
         }
      }
   }
}

