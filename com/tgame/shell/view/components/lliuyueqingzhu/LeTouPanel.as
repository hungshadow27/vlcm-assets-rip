package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import game.display.Container;
   import game.display.Label;
   import game.display.RadioButtonGroup;
   import game.skin.LeTouSkin;
   import game.utils.SkinTools;
   
   public class LeTouPanel extends BasePanel
   {
      
      public static const LETOUPANEL_LINGQU_CAIPIAO:String = "LETOUPANEL_LINGQU_CAIPIAO";
      
      public static const LETOUPANEL_LINGQU_JIANGLI:String = "LETOUPANEL_LINGQU_JIANGLI";
      
      private var container:Container;
      
      private var txtTimer:Label;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var radioBG:RadioButtonGroup;
      
      private var arr:Array;
      
      private var dataArr:Array;
      
      public function LeTouPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LeTouSkin.skin,"letou");
         this.container = new Container();
         addChild(this.container);
      }
      
      override protected function createVariableReference() : void
      {
         $("YBZLGBAN",this,true).click(this.onClick);
         $("libaoanniu",this,true).click(this.onClickHandler);
         $("xiaanniu",this,true).click(this.onClickHandler);
         this.txtTimer = getChildByName("daojishi") as Label;
         this.radioBG = getChildByName("yeqian") as RadioButtonGroup;
         this.radioBG.addEventListener(MouseEvent.CLICK,this.onClickHandler);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "libaoanniu":
               dispatchEvent(new BaseEvent(LeTouPanel.LETOUPANEL_LINGQU_CAIPIAO));
               break;
            case "xiaanniu":
               dispatchEvent(new BaseEvent(LeTouPanel.LETOUPANEL_LINGQU_JIANGLI));
               break;
            case "yeqian11":
               this.arr = this.dataArr.length > 10 ? this.dataArr.slice(0,10) : this.dataArr.slice(0);
               this.setNumByPage(this.arr);
               break;
            case "yeqian22":
               this.arr = this.dataArr.length > 10 ? this.dataArr.slice(10) : [];
               this.setNumByPage(this.arr);
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.setTime(param1.times);
         this.dataArr = param1.arr;
         this.arr = this.dataArr.length > 10 ? this.dataArr.slice(0,10) : this.dataArr.slice(0);
         this.setNumByPage(this.arr);
      }
      
      public function setNumByPage(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:LeTouRender = null;
         while(this.container.numChildren)
         {
            this.container.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as String;
            _loc4_ = _loc3_.split(",");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = new LeTouRender();
               this.container.addChild(_loc6_);
               _loc6_.setData(_loc4_[_loc5_]);
               _loc6_.x = 260 + _loc5_ * 70;
               _loc6_.y = 258 + _loc2_ * 36;
               _loc5_++;
            }
            _loc2_++;
         }
      }
      
      private function setTime(param1:int) : void
      {
         this.time = param1;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time - _loc2_;
         if(_loc2_ > 0)
         {
            this.txtTimer.htmlText = Math.floor(_loc2_ % 3600 / 60) + ":" + Math.floor(_loc2_ % 3600 % 60);
         }
         else
         {
            this.txtTimer.htmlText = "0:0";
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
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

import com.asQuery.$;
import com.tgame.common.ui.componets.BasePanel;
import game.skin.LeTouSkin;
import game.utils.SkinTools;

class LeTouRender extends BasePanel
{
   
   public function LeTouRender()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(LeTouSkin.skin,"shuzi");
   }
   
   public function setData(param1:String) : void
   {
      $("wenben111",this,true).attr("text",param1);
   }
}
