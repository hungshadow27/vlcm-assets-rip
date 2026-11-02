package com.tgame.shell.view.components.gift.itemrender
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class YaoQingYouLiPlayerListRender extends FListCellRenderer
   {
      
      public function YaoQingYouLiPlayerListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 0;
            width = 110;
            height = 20;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.playerName;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 110;
            y = 0;
            width = 50;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.lv + LanResManager.getLanCommonTextWords("级");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 160;
            y = 0;
            width = 50;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.party;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 210;
            y = 0;
            width = 110;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.setup;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 320;
            y = 0;
            width = 50;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.state;
         }
         addChild(ft);
      }
   }
}

