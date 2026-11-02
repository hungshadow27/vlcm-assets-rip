package com.tgame.shell.view.components.ChristmasRank
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class RankCanvas extends FCanvas
   {
      
      private var _parent:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var rankList:FList;
      
      private var bt_bit:Bitmap;
      
      private var line:DisplayObject;
      
      private var ft1:FLabel;
      
      private var ft2:FLabel;
      
      private var ft3:FLabel;
      
      private var fc2:FCanvas;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      public function RankCanvas()
      {
         var i:int = 0;
         super();
         this.skin = "box";
         width = 233;
         height = 261;
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 3;
         this.bt_bit.y = 3;
         this.bt_bit.width = 228;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.ft1 = new FLabel();
         with(this.ft1)
         {
            x = 5;
            y = 5;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            text = LanResManager.getLanCommonTextWords("排名");
         }
         addChild(this.ft1);
         this.ft2 = new FLabel();
         with(this.ft2)
         {
            x = 92;
            y = 5;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            text = LanResManager.getLanCommonTextWords("名字");
         }
         addChild(this.ft2);
         this.ft3 = new FLabel();
         with(this.ft3)
         {
            x = 175;
            y = 5;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            text = LanResManager.getLanCommonTextWords("伤害比例");
         }
         addChild(this.ft3);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 37;
         this.line.y = 4;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 143 + 15 + 10;
         this.line.y = 4;
         addChild(this.line);
         i = 0;
         while(i < 10)
         {
            this.xian = new Bitmap();
            this.xian = StaticValue.getBitmapByClassName("ui.line");
            this.xian.x = 4;
            this.xian.y = (i + 1) * 23 + 28;
            this.xian.width = 228;
            addChild(this.xian);
            if(i % 2 == 1)
            {
               this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
               this.Meng_bit.x = 4;
               this.Meng_bit.y = 23 * i + 28;
               this.Meng_bit.width = 228;
               this.Meng_bit.height = 23;
               addChild(this.Meng_bit);
            }
            i++;
         }
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.itemRenderer = new RankItem();
         this.rankList.listWidth = 228;
         addChild(this.rankList);
         this.rankList.x = 3;
         this.rankList.y = 28;
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0,0);
         _loc2_.graphics.drawRect(-9999,0,999999,999999);
         _loc2_.graphics.endFill();
         addChild(_loc2_);
         this.mask = _loc2_;
      }
      
      public function setInitialize(param1:XML) : void
      {
         this.rankList.dataProvider = param1;
      }
   }
}

