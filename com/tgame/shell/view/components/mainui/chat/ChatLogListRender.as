package com.tgame.shell.view.components.mainui.chat
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   
   public class ChatLogListRender extends FListCellRenderer
   {
      
      public function ChatLogListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FTextArea;
         _height = 20;
         lb = new FTextArea();
         with(lb)
         {
            width = 167;
            height = 20;
            textColor = StaticValue.WHITE;
            wordWrap = false;
            multiline = false;
            text = data.label;
         }
         addChild(lb);
      }
   }
}

