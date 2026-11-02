package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   
   public class FriendTreeRanader extends FListCellRenderer
   {
      
      public function FriendTreeRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         var str:String;
         var ft:FTextArea;
         _height = 20;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            textColor = StaticValue.WHITE;
            text = data.name;
         }
         addChild(lb);
         str = "";
         if(data.state == 1)
         {
            str = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("可浇水") + "</font>";
         }
         else
         {
            str = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("已浇水") + "</font>";
         }
         ft = new FTextArea();
         ft.x = 145;
         ft.htmlText = str;
         addChild(ft);
      }
   }
}

