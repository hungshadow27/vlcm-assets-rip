package com.tgame.shell.view.components.dantiaowang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class DTWRankList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var $parent2:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function DTWRankList()
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
            textColor = data.color;
            htmlText = data.rank;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 100;
            y = 5;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 200;
            y = 5;
            width = 80;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.count;
         }
         addChild(this.ft);
      }
   }
}

