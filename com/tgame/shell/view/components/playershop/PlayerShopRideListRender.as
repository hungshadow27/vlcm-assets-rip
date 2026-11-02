package com.tgame.shell.view.components.playershop
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.manager.*;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   
   public class PlayerShopRideListRender extends FListCellRenderer
   {
      
      private var baseItem:Mount;
      
      public function PlayerShopRideListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var img:Bitmap;
         var item:Bitmap;
         var lb:FLabel;
         var btn:SmallButton;
         var bg:F9GridBitmap = null;
         var bg1:F9GridBitmap = null;
         _height = 41;
         this.baseItem = data.ride as Mount;
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.y = 1;
         item = this.baseItem.getSmallICO();
         addChild(item);
         item.x = 2;
         item.y = 3;
         lb = new FLabel();
         with(lb)
         {
            x = 39;
            y = 1;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = baseItem.res.name;
         }
         addChild(lb);
         btn = new SmallButton();
         btn.label = LanResManager.getLanCommonTextWords("查看");
         addChild(btn);
         btn.x = 70;
         btn.y = 41 - btn.height;
         btn.addEventListener(MouseEvent.CLICK,this.onLook);
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 94;
         bg.x = 137;
         bg.y = 0;
         bg1 = Tools.get9GridBitmpByName("countBg");
         addChild(bg1);
         bg1.width = 94;
         bg1.x = 137;
         bg1.y = 22;
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 141;
         img.y = 0;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 141;
         img.y = 22;
         lb = new FLabel();
         with(lb)
         {
            x = 165;
            y = 0;
            textColor = StaticValue.ORANGE;
            text = NumberFormatter.formatThousands(data.copper);
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 165;
            y = 22;
            textColor = StaticValue.ORANGE;
            text = NumberFormatter.formatThousands(data.silver);
         }
         addChild(lb);
         if(data.silver > 0)
         {
            bg1.filters = [new GlowFilter(StaticValue.RED,1,3,3,15,BitmapFilterQuality.LOW)];
         }
      }
      
      private function onLook(param1:MouseEvent) : void
      {
         data.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_LOOK_RIDE_INFO,"",(this.baseItem as PureMount).id));
      }
   }
}

