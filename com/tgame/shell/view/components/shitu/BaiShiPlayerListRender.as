package com.tgame.shell.view.components.shitu
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class BaiShiPlayerListRender extends FListCellRenderer
   {
      
      public static var _panelType:int;
      
      public function BaiShiPlayerListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         var tf:TextFormat = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 4;
            width = 135;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.name.charAt(0) == "[" && data.name.indexOf("]") != -1)
            {
               text = data.name.split("]")[1];
            }
            else
            {
               text = data.name;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 113;
            y = 4;
            width = 100;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            text = data.level;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 155;
            y = 4;
            width = 150;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
         }
         if(_panelType == 1)
         {
            ft.text = data.discipleTotal + "/" + data.discipleMax;
         }
         else if(_panelType == 2)
         {
            ft.text = data.huoyue;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 203;
            y = 4;
            width = 200;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            text = data.setup;
         }
         addChild(ft);
      }
   }
}

