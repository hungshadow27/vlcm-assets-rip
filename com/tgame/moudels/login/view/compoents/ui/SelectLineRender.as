package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class SelectLineRender extends FListCellRenderer
   {
      
      public function SelectLineRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:FTextArea = null;
         _height = 42;
         _loc1_ = new FTextArea();
         addChild(_loc1_);
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = data.color;
         _loc1_.selectable = false;
         _loc1_.width = 218;
         _loc1_.height = 20;
         _loc1_.defaultTextFormat = new TextFormat("黑体",16,null,null,null,null,null,null,"center");
         _loc1_.text = data.label;
         _loc1_.y = 11;
         if(data.data == "")
         {
            mouseChildren = false;
            mouseEnabled = false;
         }
         else
         {
            mouseChildren = true;
            mouseEnabled = true;
         }
      }
   }
}

