package com.tgame.shell.view.components.ChristmasRank
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class RankItem extends FListCellRenderer
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function RankItem()
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
            x = 15;
            y = 5;
            width = 37;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.no;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 36;
            y = 5;
            width = 125;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = "【" + data.qf + LanResManager.getLanCommonTextWords("区") + "】" + data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 177;
            y = 5;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            textColor = data.color;
            htmlText = data.shanghai;
         }
         addChild(this.ft);
      }
   }
}

