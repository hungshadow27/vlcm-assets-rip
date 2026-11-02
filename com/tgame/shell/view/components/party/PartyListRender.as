package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class PartyListRender extends FListCellRenderer
   {
      
      public function PartyListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var bg:Bitmap = null;
         _height = 24;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 4;
            width = 96;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.label.charAt(0) == "[" && data.label.indexOf("]") != -1)
            {
               text = data.label.split("]")[1];
            }
            else
            {
               text = data.label;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 96;
            y = 4;
            width = 90;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = data.isLine == "0" ? 6052956 : StaticValue.GREEN;
            if(data.bangzhu.charAt(0) == "[" && data.bangzhu.indexOf("]") != -1)
            {
               text = data.bangzhu.split("]")[1];
            }
            else
            {
               text = data.bangzhu;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 186;
            y = 4;
            width = 58;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.setup;
         }
         addChild(ft);
         if(data.memberTotalIsTop == "1")
         {
            bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
            addChild(bg);
            bg.x = 244;
            bg.y = 2;
            bg.width = 82;
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 244;
            y = 4;
            width = 82;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.memberTotal + "/" + data.memberMax;
         }
         addChild(ft);
         if(data.levelTotalIsTop == "1")
         {
            bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
            addChild(bg);
            bg.x = 328;
            bg.y = 2;
            bg.width = 83;
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 328;
            y = 4;
            width = 83;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.levelTotal;
         }
         addChild(ft);
         if(data.flagLevelIsTop == "1")
         {
            bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
            addChild(bg);
            bg.x = 412;
            bg.y = 2;
            bg.width = 112;
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 412;
            y = 4;
            width = 112;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.PURPLE;
            text = data.flagLevel + LanResManager.getLanCommonTextWords("级") + " " + data.flagName;
         }
         addChild(ft);
         if(data.flagLevelIsTop == "1")
         {
            bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
            addChild(bg);
            bg.x = 412;
            bg.y = 2;
            bg.width = 112;
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 412;
            y = 4;
            width = 112;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.PURPLE;
            text = data.flagLevel + LanResManager.getLanCommonTextWords("级") + " " + data.flagName;
         }
         addChild(ft);
         if(data.bossTotalIsTop == "1")
         {
            bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
            addChild(bg);
            bg.x = 527;
            bg.y = 2;
            bg.width = 107;
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 527;
            y = 4;
            width = 107;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.bossTotal;
         }
         addChild(ft);
      }
   }
}

