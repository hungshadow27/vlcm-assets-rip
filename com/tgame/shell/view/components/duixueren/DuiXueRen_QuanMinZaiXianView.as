package com.tgame.shell.view.components.duixueren
{
   import com.fireice.text.FLabel;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DuiXueRen_QuanMinZaiXianView extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var txtData:FLabel;
      
      private var arrZaiXian:Array;
      
      private var myTimer:Timer;
      
      private var currTime:int;
      
      public function DuiXueRen_QuanMinZaiXianView()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duixueren/2/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         var _loc2_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duixueren/2/bg2.swf");
         _loc2_.x = 13;
         _loc2_.y = 175;
         addChild(_loc2_);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.txtData = new FLabel();
         this.txtData.textColor = StaticValue.WHITE;
         this.txtData.filters = StaticValue.filter;
         this.txtData.x = 190 + 15;
         this.txtData.y = 174;
         addChild(this.txtData);
      }
      
      public function setQuanMingZaiXianData(param1:int, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:DuiXueRen_QuanMinZaiXianViewRender = null;
         if(param1)
         {
            if(!this.myTimer)
            {
               this.myTimer = new Timer(1000);
               this.myTimer.start();
               this.myTimer.addEventListener(TimerEvent.TIMER,this.onTimerHandler);
            }
            _loc3_ = param1;
            this.currTime = _loc3_;
            this.txtData.text = Math.floor(_loc3_ / 3600) + ":" + Math.floor(_loc3_ % 3600 / 60) + ":" + Math.floor(_loc3_ % 3600 % 60);
         }
         this.removeContainerBoxChildren();
         this.arrZaiXian = new Array();
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc4_ = new DuiXueRen_QuanMinZaiXianViewRender();
            _loc4_.$parent = this.$parent;
            _loc4_.x = _loc3_ * 104;
            _loc4_.y = 245;
            _loc4_.setData(param2[_loc3_]);
            this.arrZaiXian.push(_loc4_);
            this.boxContainer.addChild(_loc4_);
            _loc3_++;
         }
      }
      
      private function onTimerHandler(param1:TimerEvent) : void
      {
         ++this.currTime;
         var _loc2_:int = this.currTime;
         this.txtData.text = Math.floor(_loc2_ / 3600) + ":" + Math.floor(_loc2_ % 3600 / 60) + ":" + Math.floor(_loc2_ % 3600 % 60);
      }
      
      public function setQuanMingZaiXianResult(param1:int, param2:int) : void
      {
         var _loc3_:DuiXueRen_QuanMinZaiXianViewRender = this.arrZaiXian[param1];
         _loc3_.setResult(param2);
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

