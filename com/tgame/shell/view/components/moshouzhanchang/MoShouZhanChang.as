package com.tgame.shell.view.components.moshouzhanchang
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import game.display.Button;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.moshouzhanchang20180726Skin;
   import game.utils.SkinTools;
   
   public class MoShouZhanChang extends BasePanel
   {
      
      public static const UI_MOSHOUZHANCHANG:String = "UI_MOSHOUZHANCHANG";
      
      public static const UI_MOSHOUZHANCHANG_BAOMING_CLICK:String = "UI_MOSHOUZHANCHANG_BAOMING_CLICK";
      
      public static const UI_MOSHOUZHANCHANG_LINGQU:String = "UI_MOSHOUZHANCHANG_LINGQU";
      
      private var btnClose:SimpleButton;
      
      private var btnBaoMing:SimpleButton;
      
      private var btnQuXiao:SimpleButton;
      
      private var cishuFt:Label;
      
      private var timeFt:Label;
      
      private var kaiFangFt1:Label;
      
      private var kaiFangFt2:Label;
      
      private var kaiFangFt3:Label;
      
      private var time:int;
      
      private var stratTime:int;
      
      private var btnLingQu1:Button;
      
      private var btnLingQu2:Button;
      
      public function MoShouZhanChang()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(moshouzhanchang20180726Skin.skin,"moshouzhanchang");
      }
      
      override protected function createVariableReference() : void
      {
         this.btnClose = getChildByName("guanbi") as SimpleButton;
         this.btnClose.addEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this.btnBaoMing = getChildByName("baminganniu1") as SimpleButton;
         this.btnBaoMing.addEventListener(MouseEvent.CLICK,this.onClicHandlerk);
         this.btnQuXiao = getChildByName("baminganniu2") as SimpleButton;
         this.btnQuXiao.addEventListener(MouseEvent.CLICK,this.onClicHandlerk);
         this.cishuFt = getChildByName("wenzi6") as Label;
         this.timeFt = getChildByName("wenz8") as Label;
         this.kaiFangFt2 = getChildByName("tongguanjiangliwenben") as Label;
         this.kaiFangFt2.wordWrap = true;
         this.kaiFangFt2.htmlText = LanResManager.getLanCommonTextWords("魔兽战场奖励胜");
         this.kaiFangFt3 = getChildByName("shibaijiangliwenben") as Label;
         this.kaiFangFt3.wordWrap = true;
         this.kaiFangFt3.htmlText = LanResManager.getLanCommonTextWords("魔兽战场奖励败");
         this.btnLingQu1 = getChildByName("lingquanniu1") as Button;
         this.btnLingQu1.addEventListener(MouseEvent.CLICK,this.onClicHandlerk);
         this.btnLingQu2 = getChildByName("lingquanniu2") as Button;
         this.btnLingQu2.addEventListener(MouseEvent.CLICK,this.onClicHandlerk);
      }
      
      private function onCloseHandler(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClicHandlerk(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnBaoMing:
               dispatchEvent(new BaseEvent(UI_MOSHOUZHANCHANG_BAOMING_CLICK,"",1));
               break;
            case this.btnQuXiao:
               dispatchEvent(new BaseEvent(UI_MOSHOUZHANCHANG_BAOMING_CLICK,"",0));
               break;
            case this.btnLingQu1:
               dispatchEvent(new Event(UI_MOSHOUZHANCHANG_LINGQU));
               break;
            case this.btnLingQu2:
               dispatchEvent(new Event(UI_MOSHOUZHANCHANG_LINGQU));
         }
      }
      
      public function setPanel(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:Boolean) : void
      {
         this.btnBaoMing.visible = !param2;
         this.btnQuXiao.visible = param2;
         this.cishuFt.width = 100;
         this.cishuFt.htmlText = param1 + " lần";
         this.setTime(param3);
         this.btnLingQu1.enabled = param4;
         this.btnLingQu2.enabled = param5;
      }
      
      public function setTime(param1:int) : void
      {
         this.time = param1;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.time + _loc2_;
         if(_loc2_ > 0)
         {
            this.timeFt.htmlText = Math.floor(_loc2_ / 3600) + ":" + Math.floor(_loc2_ % 3600 / 60) + ":" + Math.floor(_loc2_ % 3600 % 60);
         }
         else
         {
            this.timeFt.htmlText = "0:0:0";
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
      }
   }
}

