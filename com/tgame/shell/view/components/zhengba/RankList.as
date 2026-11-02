package com.tgame.shell.view.components.zhengba
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class RankList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var $parent2:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function RankList()
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
            width = 160;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.mc + " 【" + data.qf + LanResManager.getLanCommonTextWords("区") + "】" + data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 171;
            y = 5;
            width = 100;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.field;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 268;
            y = 5;
            width = 130;
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

