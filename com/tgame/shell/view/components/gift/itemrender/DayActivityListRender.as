package com.tgame.shell.view.components.gift.itemrender
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class DayActivityListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var tf:FTextArea;
      
      public function DayActivityListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var arr:Array = data.grade.split("/");
         this.tf = new FTextArea();
         with(this.tf)
         {
            width = 107;
            height = 20;
            x = 4;
            y = 0;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            if(int(arr[0]) >= int(arr[1]))
            {
               textColor = StaticValue.GREEN;
            }
            else
            {
               textColor = StaticValue.WHITE;
            }
            htmlText = data.label;
         }
         addChild(this.tf);
         this.tf = new FTextArea();
         with(this.tf)
         {
            width = 106;
            height = 20;
            x = 107;
            y = 0;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            if(int(arr[0]) >= int(arr[1]))
            {
               textColor = StaticValue.GREEN;
            }
            else
            {
               textColor = StaticValue.WHITE;
            }
            htmlText = data.grade;
         }
         addChild(this.tf);
         this.tf = new FTextArea();
         with(this.tf)
         {
            width = 90;
            height = 20;
            x = 212;
            y = 0;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            if(int(arr[0]) >= int(arr[1]))
            {
               textColor = StaticValue.GREEN;
            }
            else
            {
               textColor = StaticValue.WHITE;
            }
            htmlText = data.per;
         }
         addChild(this.tf);
      }
   }
}

