package com.tgame.shell.view.components.team
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   
   public class OtherPlayerRender extends FListCellRenderer
   {
      
      public function OtherPlayerRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         var ft:FTextArea;
         _height = 21;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 0;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.playerName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 154;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 232;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.party;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 300;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.setup;
         }
         addChild(lb);
         ft = new FTextArea();
         with(ft)
         {
            ft.name = "mate";
            x = 425;
            y = 0;
            width = 127;
            height = 20;
            defaultTextFormat = StaticValue.format;
            filters = StaticValue.filter;
            if(data.mate == "")
            {
               htmlText = LanResManager.getLanTextWords(this,"未婚");
            }
            else if(data.mateIsLine == 0)
            {
               htmlText = "<font color=\'#5c5c5c\'>" + data.mate + "</font>";
            }
            else
            {
               htmlText = "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + data.mate + "</font>";
            }
         }
         addChild(ft);
      }
   }
}

