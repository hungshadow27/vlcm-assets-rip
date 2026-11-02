package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class KuafuLunjianList extends FListCellRenderer
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function KuafuLunjianList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 24;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 2;
            y = 4;
            width = 36;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.zhanchang;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 51;
            y = 4;
            width = 116;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 190;
            y = 4;
            width = 50;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.qufu;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 261;
            y = 4;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.dengji;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 309;
            y = 4;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.shenglv;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 358;
            y = 4;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = data.shengwang;
         }
         addChild(this.ft);
      }
   }
}

