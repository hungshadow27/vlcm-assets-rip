package com.tgame.shell.view.components.duixueren
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFieldAutoSize;
   
   public class DuiXueRenRankRender extends FListCellRenderer
   {
      
      private var txtRank:FLabel;
      
      private var txtName:FTextArea;
      
      private var txtCengShu:FTextArea;
      
      public function DuiXueRenRankRender()
      {
         super();
         this.txtRank = new FLabel();
         this.txtRank.textColor = StaticValue.WHITE;
         this.txtRank.filters = StaticValue.filter;
         this.txtRank.x = 20;
         this.txtRank.y = 5;
         this.txtRank.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.txtRank);
         this.txtName = new FTextArea();
         this.txtName.textColor = StaticValue.WHITE;
         this.txtName.filters = StaticValue.filter;
         this.txtName.x = 35;
         this.txtName.y = 5;
         this.txtName.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.txtName);
         this.txtCengShu = new FTextArea();
         this.txtCengShu.textColor = StaticValue.WHITE;
         this.txtCengShu.filters = StaticValue.filter;
         this.txtCengShu.x = 130;
         this.txtCengShu.y = 5;
         this.txtCengShu.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.txtCengShu);
      }
      
      override public function initUI() : void
      {
         _height = 24;
         this.txtRank.text = data.rank + "";
         this.txtName.text = data.name + "";
         this.txtCengShu.text = data.num + "";
      }
   }
}

