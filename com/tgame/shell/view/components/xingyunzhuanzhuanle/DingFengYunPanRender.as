package com.tgame.shell.view.components.xingyunzhuanzhuanle
{
   import com.asQuery.$;
   import game.display.ListItemRender;
   
   public class DingFengYunPanRender extends ListItemRender
   {
      
      public function DingFengYunPanRender()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         $("wenben1",this,true).attr("text",param1.att);
         $("wenben2",this,true).attr("text",param1.count);
         $("wenben3",this,true).attr("text",param1.value);
      }
   }
}

