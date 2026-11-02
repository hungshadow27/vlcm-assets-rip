package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   
   public class WangzhezhibangZhuweiRanader extends FListCellRenderer
   {
      
      public function WangzhezhibangZhuweiRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         var pingtai:int;
         var btIconPingtai:DisplayObject;
         var ft:FTextArea = null;
         var img:DisplayObject = null;
         _height = 33.5;
         lb = new FLabel();
         with(lb)
         {
            x = 18;
            y = 8;
            textColor = StaticValue.BLUE;
            text = data.no;
         }
         addChild(lb);
         pingtai = int(data.pingtaiID);
         if(pingtai != 106 || pingtai != 110 || pingtai != 111)
         {
            pingtai = 106;
         }
         btIconPingtai = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + String(pingtai) + "_small.png",30,30);
         if(btIconPingtai)
         {
            btIconPingtai.x = 40;
            btIconPingtai.y = 1;
            addChild(btIconPingtai);
         }
         ft = new FTextArea();
         ft.x = 90 - 20;
         ft.y = 8;
         ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + data.partyName + "</font>";
         ft.width = 150;
         addChild(ft);
         ft = new FTextArea();
         ft.x = 215 - 25;
         ft.y = 8;
         ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + data.name + "</font>";
         ft.width = 150;
         addChild(ft);
         ft = new FTextArea();
         ft.x = 325;
         ft.y = 8;
         ft.htmlText = "<font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + data.allCount + "</font>";
         ft.width = 150;
         addChild(ft);
         ft = new FTextArea();
         ft.x = 408;
         ft.y = 8;
         ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.count + "</font>";
         ft.width = 150;
         addChild(ft);
         if(data.value != -1)
         {
            img = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/" + data.value + ".png",41,29);
            img.x = 490;
            img.y = 1;
            addChild(img);
         }
      }
   }
}

