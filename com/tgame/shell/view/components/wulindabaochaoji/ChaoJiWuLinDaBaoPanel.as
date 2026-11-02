package com.tgame.shell.view.components.wulindabaochaoji
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.WuLinDaBaoSkin;
   import game.utils.SkinTools;
   
   public class ChaoJiWuLinDaBaoPanel extends BasePanel
   {
      
      private var itemSp1:Sprite;
      
      private var itemSp2:Sprite;
      
      private var itemSp3:Sprite;
      
      private var itemSp4:Sprite;
      
      private var itemSp5:Sprite;
      
      private var itemSp6:Sprite;
      
      private var itemSp7:Sprite;
      
      private var itemSp8:Sprite;
      
      private var itemSp9:Sprite;
      
      private var id1:int = 0;
      
      private var id2:int = 0;
      
      private var id3:int = 0;
      
      private var id4:int = 0;
      
      private var id5:int = 0;
      
      private var id6:int = 0;
      
      private var id7:int = 0;
      
      private var id8:int = 0;
      
      private var id9:int = 0;
      
      private var itemArr:* = [];
      
      private var $dataArr:Array = [];
      
      public function ChaoJiWuLinDaBaoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(WuLinDaBaoSkin.skin,"WuLinDaBao");
         this.itemSp1 = new Sprite();
         this.addChild(this.itemSp1);
         this.itemSp1.x = 181 + 94;
         this.itemSp1.y = 222 + 82;
         this.itemSp2 = new Sprite();
         this.addChild(this.itemSp2);
         this.itemSp2.x = 181 + 94;
         this.itemSp2.y = 271 + 7 + 82;
         this.itemSp3 = new Sprite();
         this.addChild(this.itemSp3);
         this.itemSp3.x = 181 + 94;
         this.itemSp3.y = 320 + 14 + 82;
         this.itemSp4 = new Sprite();
         this.addChild(this.itemSp4);
         this.itemSp4.x = 181 + 94;
         this.itemSp4.y = 369 + 21 + 82;
         this.itemSp5 = new Sprite();
         this.addChild(this.itemSp5);
         this.itemSp5.x = 181 + 94;
         this.itemSp5.y = 418 + 28 + 82;
         this.itemSp6 = new Sprite();
         this.addChild(this.itemSp6);
         this.itemSp6.x = 181 + 94;
         this.itemSp6.y = 467 + 35 + 82;
         this.itemSp7 = new Sprite();
         this.addChild(this.itemSp7);
         this.itemSp7.x = 181 + 94;
         this.itemSp7.y = 516 + 42 + 82;
         this.itemSp8 = new Sprite();
         this.addChild(this.itemSp8);
         this.itemSp8.x = 181 + 94;
         this.itemSp8.y = 565 + 49 + 82;
         this.itemSp9 = new Sprite();
         this.addChild(this.itemSp9);
         this.itemSp9.x = 181 + 94;
         this.itemSp9.y = 614 + 56 + 82;
         this.init();
      }
      
      private function init() : void
      {
         $("YBZLGBAN",this,true).click(onClose);
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9",this,true).click(this.clickHanlder);
      }
      
      public function setupData(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:int = 0;
         $("wenben2",this,true).attr("text",param1.time);
         $("wenben1",this,true).attr("text","" + param1.cishu);
         this.itemArr = [];
         this.$dataArr = param1.itemArr;
         var _loc2_:int = 0;
         while(_loc2_ < param1.itemArr.length)
         {
            _loc3_ = param1.itemArr[_loc2_];
            while(this["itemSp" + int(_loc2_ + 1)].numChildren)
            {
               this["itemSp" + int(_loc2_ + 1)].removeChildAt(0);
            }
            this["id" + (_loc2_ + 1)] = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = new Goods(_loc3_[_loc4_].itemId);
               _loc5_.count = _loc3_[_loc4_].itemNum;
               _loc6_ = new ItemFace(_loc5_);
               this["itemSp" + int(_loc2_ + 1)].addChild(_loc6_);
               _loc6_.x = _loc4_ * 60;
               _loc7_ = _loc2_ * 6 + _loc4_ + 1;
               this.itemArr.push(_loc6_);
               _loc6_.name = _loc3_[_loc4_].onlyId;
               _loc4_++;
            }
            this["itemSp" + int(_loc2_ + 1)].name = _loc2_ + 1;
            _loc2_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target.parent;
         var _loc3_:int = int(_loc2_.name);
         var _loc4_:int = 0;
         while(_loc4_ < this.itemArr.length)
         {
            this.itemArr[_loc4_].showKungFuFram = false;
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ < 10)
         {
            this["id" + _loc4_] = 0;
            _loc4_++;
         }
         var _loc5_:ItemFace = param1.target as ItemFace;
         _loc5_.showKungFuFram = true;
         this["id" + _loc3_] = int(_loc5_.name);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = String(param1.target.name).split("N");
         _loc3_ = int(this.$dataArr[int(_loc2_[1] - 1)][0].onlyId);
         PipeManager.sendMsg(PipeConstants.SEND_53099,[3,_loc3_]);
      }
   }
}

