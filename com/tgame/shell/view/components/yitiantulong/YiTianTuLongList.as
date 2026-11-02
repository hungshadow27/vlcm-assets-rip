package com.tgame.shell.view.components.yitiantulong
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class YiTianTuLongList extends FListCellRenderer
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function YiTianTuLongList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 23;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 5;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.rank;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 100 - 38;
            y = 5;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 216 - 25;
            y = 5;
            width = 80;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.count;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 291 - 25;
            y = 5;
            width = 80;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = data.wuhun;
         }
         addChild(this.ft);
      }
   }
}

