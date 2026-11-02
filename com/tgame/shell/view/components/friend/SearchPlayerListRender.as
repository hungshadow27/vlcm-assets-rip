package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class SearchPlayerListRender extends FListCellRenderer
   {
      
      public function SearchPlayerListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea = null;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            width = 132;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.playerName;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 131;
            width = 62;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 193;
            width = 73;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.party;
         }
         addChild(ft);
      }
   }
}

