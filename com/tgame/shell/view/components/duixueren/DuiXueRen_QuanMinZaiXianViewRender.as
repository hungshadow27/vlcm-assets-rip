package com.tgame.shell.view.components.duixueren
{
   import com.greensock.TweenLite;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import gs.easing.Quad;
   
   public class DuiXueRen_QuanMinZaiXianViewRender extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private const FANWEI_COUNT:int = 30;
      
      private const ONEBOX_HEIGHT:int = 70;
      
      private const CHUSHIWEIZHI_X:int = 25;
      
      private const CHUSHIWEIZHI_Y:int = 116;
      
      private var spr:Sprite;
      
      private var btnChouJiang:SecondButton;
      
      private var indexTimer:int = 0;
      
      private var skillArr:Array;
      
      private var skillCount:int = 0;
      
      public function DuiXueRen_QuanMinZaiXianViewRender()
      {
         var _loc1_:Sprite = null;
         super();
         this.spr = new Sprite();
         addChild(this.spr);
         this.spr.x = this.CHUSHIWEIZHI_X;
         this.spr.y = this.CHUSHIWEIZHI_Y;
         _loc1_ = new Sprite();
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(16776960,0.5);
         _loc1_.graphics.drawRect(0,0,70,70);
         _loc1_.graphics.endFill();
         _loc1_.x = this.spr.x - 2;
         _loc1_.y = this.spr.y - 2;
         addChild(_loc1_);
         this.spr.mask = _loc1_;
         this.btnChouJiang = new SecondButton();
         this.btnChouJiang.label = LanResManager.getLanCommonTextWords("领取");
         this.btnChouJiang.x = 32;
         this.btnChouJiang.y = 200;
         addChild(this.btnChouJiang);
         this.btnChouJiang.addEventListener(MouseEvent.CLICK,this.onClickHandler);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         if(this.btnChouJiang.label == LanResManager.getLanCommonTextWords("领取"))
         {
            this.$parent.dispatchEvent(new BaseEvent(DuiXueRenPanel.QUANMINGZAIXIAN_LINGQU_CLICK,"",this.indexTimer));
         }
      }
      
      public function setData(param1:Object) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         this.indexTimer = param1.indexTimer;
         this.skillArr = param1.arr;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         _loc2_ = new Goods(this.skillArr[param1.indexGoods].goodsID);
         _loc2_.count = this.skillArr[param1.indexGoods].goodsNum;
         _loc3_ = new ItemFace(_loc2_,65,65);
         this.spr.addChild(_loc3_);
         this.btnChouJiang.enabled = Boolean(param1.isDraw);
         this.btnChouJiang.label = LanResManager.getLanCommonTextWords("领取");
         if(param1.isDraw)
         {
            return;
         }
         this.btnChouJiang.enabled = Boolean(param1.hasDraw);
         if(param1.hasDraw)
         {
            return;
         }
         this.btnChouJiang.enabled = Boolean(param1.isRecieved);
         this.btnChouJiang.label = LanResManager.getLanCommonTextWords("领取");
      }
      
      public function setResult(param1:int) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         this.skillCount = this.FANWEI_COUNT + int(Math.random() * 30);
         var _loc5_:int = 0;
         while(_loc5_ < this.skillCount)
         {
            _loc4_ = this.skillArr.length * Math.random();
            if(this.skillCount - 1 == _loc5_)
            {
               _loc2_ = new Goods(this.skillArr[param1].goodsID);
               _loc2_.count = this.skillArr[param1].goodsNum;
            }
            else
            {
               _loc2_ = new Goods(this.skillArr[_loc4_].goodsID);
               _loc2_.count = this.skillArr[_loc4_].goodsNum;
            }
            _loc3_ = new ItemFace(_loc2_,65,65);
            _loc3_.y = _loc5_ * this.ONEBOX_HEIGHT;
            _loc3_.name = "" + _loc5_;
            this.spr.addChild(_loc3_);
            _loc5_++;
         }
         TweenLite.to(this.spr,3,{
            "y":this.ONEBOX_HEIGHT - this.skillCount * this.ONEBOX_HEIGHT + this.CHUSHIWEIZHI_Y,
            "ease":Quad.easeInOut,
            "onComplete":this.onCompLeteHandler
         });
      }
      
      private function onCompLeteHandler() : void
      {
         this.btnChouJiang.label = LanResManager.getLanCommonTextWords("领取");
      }
   }
}

