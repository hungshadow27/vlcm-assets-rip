package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class NPCListRender extends FListCellRenderer
   {
      
      public function NPCListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var lb:FLabel = null;
         _height = 20;
         tf = new TextFormat();
         tf.color = data.state == "0" ? 6052956 : StaticValue.BLUE;
         if(data.state == "1")
         {
            lb = new FLabel();
            with(lb)
            {
               
               mouseEnabled = false;
               x = 13;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               text = "*";
            }
            addChild(lb);
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 30;
            width = 112;
            height = 20;
            defaultTextFormat = tf;
            if(data.state != "0")
            {
               filters = StaticValue.filter;
            }
            htmlText = data.playerName;
         }
         addChild(ft);
         tf.color = StaticValue.WHITE;
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            mouseEnabled = false;
            x = 143;
            width = 57;
            height = 20;
            if(data.line != "0")
            {
               filters = StaticValue.filter;
            }
            defaultTextFormat = tf;
            htmlText = data.value;
         }
         addChild(ft);
      }
   }
}

