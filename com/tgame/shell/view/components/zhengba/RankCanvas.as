package com.tgame.shell.view.components.zhengba
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.*;
   
   public class RankCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var rankList:FList;
      
      public var arrs:Array;
      
      private var bt_bit:Bitmap;
      
      private var line:DisplayObject;
      
      private var ft:FTextArea;
      
      private var fc2:FCanvas;
      
      private var xian:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      public function RankCanvas()
      {
         var i:int = 0;
         this.arrs = [];
         super();
         this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         this.bt_bit.x = 3;
         this.bt_bit.y = 3;
         this.bt_bit.width = 400 - 6;
         this.bt_bit.height = 24;
         addChild(this.bt_bit);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 3;
            y = 5;
            wordWrap = true;
            width = 400;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE50;
            htmlText = "                 " + LanResManager.getLanCommonTextWords("名称") + "                                             " + LanResManager.getLanCommonTextWords("场地") + "                  " + LanResManager.getLanCommonTextWords("击杀次数");
         }
         addChild(this.ft);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 170;
         this.line.y = 5;
         addChild(this.line);
         this.line = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xiangyangzhanchang/shu.png",1,24);
         this.line.x = 270;
         this.line.y = 5;
         addChild(this.line);
         i = 0;
         while(i < 5)
         {
            this.xian = new Bitmap();
            this.xian = StaticValue.getBitmapByClassName("ui.line");
            this.xian.x = 4;
            this.xian.y = (i + 1) * 23 + 28;
            this.xian.width = 390;
            addChild(this.xian);
            if(i % 2 == 1)
            {
               this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
               this.Meng_bit.x = 4;
               this.Meng_bit.y = 23 * i + 28;
               this.Meng_bit.width = 400 - 6;
               this.Meng_bit.height = 23;
               addChild(this.Meng_bit);
            }
            i++;
         }
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 3;
            y = 27;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,400,140);
            graphics.endFill();
         }
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.itemRenderer = new RankList();
         this.rankList.listWidth = 395;
         this.listContainer.addChild(this.rankList);
         this.rankList.x = 0;
         this.rankList.y = 0;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage,false,-int.MAX_VALUE);
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
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         RankList.$parent = this;
         RankList.$parent2 = param1;
      }
      
      public function setInitialize(param1:XML) : void
      {
         this.rankList.dataProvider = param1;
      }
   }
}

