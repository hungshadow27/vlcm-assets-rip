package com.tgame.shell.view.components.task
{
   import com.fireice.tree.FTreeCellRenderer;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TaskListitemRender extends FTreeCellRenderer
   {
      
      public function TaskListitemRender()
      {
         super();
      }
      
      override public function itemRender() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         if(data.state == null)
         {
            _loc1_.color = StaticValue.ORANGE;
         }
         else if(data.state == "0")
         {
            _loc1_.color = StaticValue.BLUE;
         }
         else if(data.state == "1")
         {
            _loc1_.color = StaticValue.WHITE;
         }
         else if(data.state == "2")
         {
            _loc1_.color = StaticValue.GREEN;
         }
         else
         {
            _loc1_.color = StaticValue.YELLOW;
         }
         labelTextField.filters = StaticValue.filter;
         this.labelTextField.defaultTextFormat = _loc1_;
         this.labelTextField.autoSize = TextFieldAutoSize.LEFT;
         this.labelTextField.text = this.data.showLabel;
         this.labelTextField.x = this.icon.width;
         this.labelTextField.y = 0;
      }
   }
}

