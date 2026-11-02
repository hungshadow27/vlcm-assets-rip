package com.tgame.shell.view.components.lliuyueyuanman
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.BBR220251211Skin;
   import game.utils.SkinTools;
   
   public class XueRenBaoZangPanel extends BasePanel
   {
      
      private var arr:Array = [];
      
      private var arr1:Array;
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      public function XueRenBaoZangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(BBR220251211Skin.skin,"BBR2");
         this._container = new Container();
         addChild(this._container);
         this.arr = [[739725,100],[743747,1],[743747,2],[743625,2],[742532,5]];
         this.arr1 = [[711955,1],[739725,1],[731890,1],[733442,5]];
         this.arr2 = [[726642,1],[713831,1],[729177,1],[735848,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2 anniu3 anniu4 anniu5 anniu6 anniu7 anniu8 anniu9",this,true).click(this.clickHanlder);
         $("BBguanbi",this,true).click(this.onClick);
         $("anniu6",this,true).attr("visible",false);
         this.setDataGoods();
      }
      
      public function setNum(param1:int, param2:int) : void
      {
         $("wenben1",this,true).attr("text",param2 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("iu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[327,uint(_loc2_[1])]);
      }
      
      private function setDataGoods() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc2_ = new Goods(743743);
         _loc2_.count = 1;
         _loc3_ = new ItemFace(_loc2_,65,65);
         _loc3_.x = 448;
         _loc3_.y = 231;
         this._container.addChild(_loc3_);
         _loc1_ = 0;
         while(_loc1_ < this.arr.length)
         {
            _loc2_ = new Goods(this.arr[_loc1_][0]);
            _loc2_.count = this.arr[_loc1_][1];
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 522 + _loc1_ * 59;
            _loc3_.y = 66;
            this._container.addChild(_loc3_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.arr1.length)
         {
            _loc2_ = new Goods(this.arr1[_loc1_][0]);
            _loc2_.count = this.arr1[_loc1_][1];
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 549 + _loc1_ * 60;
            _loc3_.y = 221;
            this._container.addChild(_loc3_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.arr2.length)
         {
            _loc2_ = new Goods(this.arr2[_loc1_][0]);
            _loc2_.count = this.arr2[_loc1_][1];
            _loc3_ = new ItemFace(_loc2_);
            _loc3_.x = 549 + _loc1_ * 60;
            _loc3_.y = 267;
            this._container.addChild(_loc3_);
            _loc1_++;
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

