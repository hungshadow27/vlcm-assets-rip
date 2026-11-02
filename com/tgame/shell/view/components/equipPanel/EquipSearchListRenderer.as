package com.tgame.shell.view.components.equipPanel
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class EquipSearchListRenderer extends FListCellRenderer
   {
      
      private var txtName:FTextArea;
      
      public function EquipSearchListRenderer()
      {
         super();
         this.txtName = new FTextArea();
         this.txtName.textColor = StaticValue.WHITE;
         this.txtName.filters = StaticValue.filter;
         this.txtName.x = 15;
         this.txtName.y = 5;
         this.txtName.width = 200;
         addChild(this.txtName);
      }
      
      override public function initUI() : void
      {
         _height = 24;
         this.txtName.text = data.res.name + "";
      }
   }
}

