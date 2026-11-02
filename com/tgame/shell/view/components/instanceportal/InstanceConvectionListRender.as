package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class InstanceConvectionListRender extends FListCellRenderer
   {
      
      public function InstanceConvectionListRender()
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
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            x = 2;
            y = 2;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            x = 125;
            y = 2;
            textColor = StaticValue.WHITE;
            htmlText = data.grade + LanResManager.getLanCommonTextWords("级");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            x = 175;
            y = 2;
            textColor = StaticValue.WHITE;
            htmlText = data.team;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            x = 235;
            y = 2;
            textColor = StaticValue.GREEN;
            htmlText = data.degree;
         }
         addChild(ft);
      }
   }
}

