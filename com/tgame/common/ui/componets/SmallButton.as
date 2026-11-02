package com.tgame.common.ui.componets
{
   import com.fireice.button.FButton;
   
   public class SmallButton extends FButton
   {
      
      public function SmallButton()
      {
         super();
         skin = "smallButton";
         color = StaticValue.BlUE50;
         border = true;
         paddingTop = 1;
         paddingBottom = 2;
         paddingLeft = 2;
         paddingRight = 2;
      }
   }
}

