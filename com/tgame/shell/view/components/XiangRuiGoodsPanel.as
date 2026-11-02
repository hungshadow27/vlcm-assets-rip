package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class XiangRuiGoodsPanel extends FPanel
   {
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      public function XiangRuiGoodsPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 325 - 20;
         height = 300;
         titleText = LanResManager.getLanCommonTextWords("龙脉宝藏");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new Sprite();
         addChild(this.container);
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,315,170);
            endFill();
         }
         this.container.x = 30;
         this.container.y = 10;
         this.scroll = new FVScorllBar(this.container,240);
         this.scroll.x = 275;
         this.scroll.y = 10;
         addChild(this.scroll);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:Bitmap = null;
         var _loc7_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc6_.x = 49 * (_loc2_ % 5);
            _loc5_ = _loc2_ / 5;
            _loc6_.y = 49 * _loc5_;
            this.container.addChild(_loc6_);
            _loc4_ = param1[_loc2_] as Goods;
            _loc7_ = new ItemFace(_loc4_);
            _loc7_.x = 2 + 49 * (_loc2_ % 5);
            _loc7_.y = 49 * _loc5_ + 2;
            this.container.addChild(_loc7_);
            _loc2_++;
         }
         this.scroll.update();
      }
   }
}

