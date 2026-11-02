package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import game.display.Container;
   import game.skin.V631DengLuLingJiangSkin;
   import game.utils.SkinTools;
   
   public class DengLuLingJiangV632Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      private var time:int;
      
      private var lastTimer:int = 0;
      
      public function DengLuLingJiangV632Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(V631DengLuLingJiangSkin.skin,"qitiandenglulingjiang");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [[713852,5],[729089,1],[713852,10],[729803,20],[30307,20],[729328,10]];
         this.init();
      }
      
      private function init() : void
      {
         $("qitiananniu1 qitiananniu2 qitiananniu3 qitiananniu4 qitiananniu5 qitiananniu6",this,true).click(this.clickHanlder);
         $("znqgb",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         this.lastTimer = getTimer();
         this.time = param1;
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         if(_loc2_ - this.lastTimer > 1000)
         {
            this.time += 1;
            this.lastTimer = _loc2_;
         }
         if(this.time > 120 * 60)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
            $("shijian",this,true).attr("text","02:00:00");
         }
         else
         {
            $("shijian",this,true).attr("text",Math.floor(this.time / 3600) + ":" + Math.floor(this.time % 3600 / 60) + ":" + Math.floor(this.time % 3600 % 60));
         }
      }
      
      public function removeHandler() : void
      {
         if(hasEventListener(Event.ENTER_FRAME))
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("iu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[326,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 144 + _loc3_ * 163;
            this.item.y = 360;
            this._container.addChild(this.item);
            _loc3_++;
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

