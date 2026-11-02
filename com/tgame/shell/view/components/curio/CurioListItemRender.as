package com.tgame.shell.view.components.curio
{
   import com.fireice.tree.FTreeCellRenderer;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class CurioListItemRender extends FTreeCellRenderer
   {
      
      public function CurioListItemRender()
      {
         super();
      }
      
      override public function itemRender() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         var _loc2_:String = this.data.showLabel;
         if(data.state == null)
         {
            _loc1_.color = StaticValue.ORANGE;
         }
         else if(data.state == "1")
         {
            _loc1_.color = StaticValue.BLUE;
            _loc2_ += "<font color=\'" + StaticValue.RED_HTML + "\'>(" + LanResManager.getLanCommonTextWords("未完成") + ")</font>";
         }
         else if(data.state == "2" || data.state == "3")
         {
            _loc1_.color = StaticValue.GREEN;
            _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>(" + LanResManager.getLanCommonTextWords("已完成") + ")</font>";
         }
         labelTextField.filters = StaticValue.filter;
         this.labelTextField.defaultTextFormat = _loc1_;
         this.labelTextField.htmlText = _loc2_;
         this.labelTextField.x = this.icon.width;
         this.labelTextField.y = 0;
      }
   }
}

