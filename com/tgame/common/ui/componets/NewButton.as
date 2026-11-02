package com.tgame.common.ui.componets
{
   import com.fireice.button.FButton;
   
   public class NewButton extends FButton
   {
      
      public function NewButton()
      {
         super();
         skin = "newButton";
         color = StaticValue.BlUE50;
         border = true;
         paddingTop = 3;
         paddingBottom = 2;
         paddingLeft = 8;
         paddingRight = 8;
      }
      
      public function getSkin() : String
      {
         return _skin;
      }
      
      public function setSkin(param1:String) : void
      {
         skin = param1;
      }
      
      public function setXianshiHuodong() : void
      {
         paddingTop = 8;
      }
      
      public function setPandding(param1:int, param2:int = 0, param3:int = 0, param4:int = 0) : void
      {
         paddingTop = param1;
         paddingBottom = param2;
         paddingLeft = param3;
         paddingRight = param4;
      }
      
      public function setColor(param1:int) : void
      {
         this.color = param1;
      }
   }
}

