package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class PartyFlagInstallListRender extends FListCellRenderer
   {
      
      public function PartyFlagInstallListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea = null;
         var bg:Bitmap = null;
         var colorBar:ColorBar = null;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 2;
            width = 90;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = data.label;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 90;
            y = 2;
            width = 60;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.coordinate;
         }
         addChild(ft);
         if(data.flagID != "")
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 155;
               y = 2;
               width = 90;
               height = 20;
               defaultTextFormat = tf;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               text = data.flagName;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 246;
               y = 2;
               width = 45;
               height = 20;
               defaultTextFormat = tf;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               text = data.flagLv;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 289;
               y = 2;
               width = 87;
               height = 20;
               defaultTextFormat = tf;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               if(data.party.charAt(0) == "[" && data.party.indexOf("]") != -1)
               {
                  text = data.party.split("]")[1];
               }
               else
               {
                  text = data.party;
               }
            }
            addChild(ft);
            bg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
            addChild(bg);
            bg.x = 377;
            bg.y = 5;
            bg.width = 94;
            colorBar = new ColorBar(5,86,5,true,true);
            colorBar.mouseChildren = false;
            colorBar.mouseEnabled = false;
            addChild(colorBar);
            colorBar.x = 381;
            colorBar.y = 8;
            colorBar.setValue(int(data.lifeNow),int(data.lifeMax));
         }
      }
   }
}

