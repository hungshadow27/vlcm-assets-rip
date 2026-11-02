package com.tgame.common.ui.componets
{
   import com.fireice.button.FButton;
   
   public class TabButton extends FButton
   {
      
      public function TabButton()
      {
         super();
         skin = "tabBarButton";
         color = StaticValue.BlUE50;
         border = true;
         paddingTop = 3;
         paddingBottom = 2;
         paddingLeft = 5;
         paddingRight = 5;
      }
   }
}

