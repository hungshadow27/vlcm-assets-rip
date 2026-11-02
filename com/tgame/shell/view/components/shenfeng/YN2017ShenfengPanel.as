package com.tgame.shell.view.components.shenfeng
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.skin.YNshenfengSkin;
   import game.utils.SkinTools;
   
   public class YN2017ShenfengPanel extends BasePanel
   {
      
      private var itemSp1:Sprite;
      
      private var itemSp2:Sprite;
      
      private var itemSp3:Sprite;
      
      private var itemSp4:Sprite;
      
      private var itemSp5:Sprite;
      
      private var itemSp6:Sprite;
      
      private var itemSp7:Sprite;
      
      public function YN2017ShenfengPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YNshenfengSkin.skin,"shenfeng");
         this.itemSp1 = new Sprite();
         this.addChild(this.itemSp1);
         this.itemSp1.x = 179;
         this.itemSp1.y = 222;
         this.itemSp2 = new Sprite();
         this.addChild(this.itemSp2);
         this.itemSp2.x = 179;
         this.itemSp2.y = 278;
         this.itemSp3 = new Sprite();
         this.addChild(this.itemSp3);
         this.itemSp3.x = 179;
         this.itemSp3.y = 334;
         this.itemSp4 = new Sprite();
         this.addChild(this.itemSp4);
         this.itemSp4.x = 179;
         this.itemSp4.y = 390;
         this.itemSp5 = new Sprite();
         this.addChild(this.itemSp5);
         this.itemSp5.x = 179;
         this.itemSp5.y = 446;
         this.itemSp6 = new Sprite();
         this.addChild(this.itemSp6);
         this.itemSp6.x = 179;
         this.itemSp6.y = 502;
         this.itemSp7 = new Sprite();
         this.addChild(this.itemSp7);
         this.itemSp7.x = 179;
         this.itemSp7.y = 558;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < 43)
         {
            $("DFZQLQAN" + _loc1_,this,true).attr("visible",false).click(this.onClickFun);
            _loc1_++;
         }
         $("YBZLGBAN",this,true).click(this.onClick);
         $("wenben2",this,true).attr("text","06/07");
      }
      
      private function onClickFun(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[3,uint(param1.target.name)]);
      }
      
      public function setupData(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         var _loc7_:int = 0;
         $("wenben1",this,true).attr("text","" + param1.cishu).attr("x",64).attr("y",84).attr("x",262).attr("y",166);
         $("wenben2",this,true).attr("text",param1.time).attr("y",190);
         var _loc2_:int = 0;
         while(_loc2_ < param1.itemArr.length)
         {
            _loc3_ = param1.itemArr[_loc2_];
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = new Goods(_loc3_[_loc4_].itemId);
               _loc5_.count = _loc3_[_loc4_].itemNum;
               _loc6_ = new ItemFace(_loc5_);
               this["itemSp" + int(_loc2_ + 1)].addChild(_loc6_);
               _loc6_.x = _loc4_ * 65;
               _loc7_ = _loc2_ * 6 + _loc4_ + 1;
               $("DFZQLQAN" + _loc7_,this,true).attr("visible",true).attr("name","" + _loc3_[_loc4_].onlyId);
               _loc4_++;
            }
            _loc2_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

