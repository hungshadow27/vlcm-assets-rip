package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.WangzhezhibangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class WangzhezhibangLingjiangRanader extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function WangzhezhibangLingjiangRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         var btn:SecondButton;
         var ft:FTextArea = null;
         var bit:Bitmap = null;
         var item:ItemFace = null;
         _height = 48;
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            textColor = StaticValue.WHITE;
            text = data.name;
         }
         addChild(lb);
         ft = new FTextArea();
         ft.x = 10;
         ft.y = 20;
         ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + data.desc + "</font>";
         ft.width = 380;
         addChild(ft);
         if(data.gid != 0)
         {
            bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
            bit.x = 235;
            bit.y = 6;
            addChild(bit);
            item = new ItemFace(new Goods(data.gid));
            item.x = 237;
            item.y = 8;
            addChild(item);
         }
         btn = new SecondButton();
         btn.x = 400;
         btn.y = 15;
         if(data.state == 0)
         {
            btn.enabled = false;
         }
         else
         {
            btn.enabled = true;
         }
         btn.label = LanResManager.getLanCommonTextWords("点击领取");
         btn.name = data.type;
         addChild(btn);
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         $parent.dispatchEvent(new BaseEvent(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGQUJIANGLI,"",param1.target.name));
      }
   }
}

