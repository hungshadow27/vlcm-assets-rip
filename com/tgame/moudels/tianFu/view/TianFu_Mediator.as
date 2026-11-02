package com.tgame.moudels.tianFu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianFu.model.TianFu_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianFu_Mediator extends Mediator
   {
      
      public static const NAME:String = "TianFu_Mediator";
      
      private var _senderProxy:TianFu_MsgSenderProxy;
      
      public function TianFu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianFu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianFu_MsgSenderProxy.NAME) as TianFu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETTIANFU,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.TIANFU_TUIMING_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.TIANFU_SHUAXIN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.TIANFU_XIANGQIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.TIANFU_LINGQU_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETTIANFU,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.TIANFU_TUIMING_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.TIANFU_SHUAXIN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.TIANFU_XIANGQIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.TIANFU_LINGQU_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case CharAttribute.GETTIANFU:
               if(!ReloginManager.isInKuafu)
               {
                  this.senderProxy.send_58251();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("跨服服务器屏蔽此功能"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("跨服服务器屏蔽此功能"));
               }
               break;
            case CharAttribute.TIANFU_TUIMING_CLICK:
               this.senderProxy.send_58255();
               break;
            case CharAttribute.TIANFU_SHUAXIN_CLICK:
               this.senderProxy.send_58253();
               break;
            case CharAttribute.TIANFU_XIANGQIAN_CLICK:
               if(!ReloginManager.isInKuafu)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TIANFU_XIANGQIAN,-1);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("跨服服务器屏蔽此功能"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("跨服服务器屏蔽此功能"));
               }
               break;
            case CharAttribute.TIANFU_LINGQU_CLICK:
               this.senderProxy.send_58259();
         }
      }
      
      public function setData(param1:int, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Boolean, param11:int, param12:int, param13:Boolean, param14:Boolean) : void
      {
         if(!ReloginManager.isInKuafu)
         {
            this.mainCharArrtibutePlane.showTianFu();
            this.mainCharArrtibutePlane.setTianFuData(true,param3,param4,param5,param6,param7,param8,param9,param12,param13,param14,param10,param11);
            this.mainCharArrtibutePlane.setTianFuShuaXinNum(param2);
            this.mainCharArrtibutePlane.setTianFuTuiMingNum(param1);
            this.mainCharArrtibutePlane.setTianFuJiHuo(GameState.dictMainStatus[40730]);
         }
      }
      
      public function isHuanZhuang(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.tianfu_huanzhuang(param1);
      }
      
      public function setGoods(param1:Array) : void
      {
         this.mainCharArrtibutePlane.setTianFuGoods(param1);
      }
      
      public function setShuaXinNum(param1:int) : void
      {
         this.mainCharArrtibutePlane.setTianFuShuaXinNum(param1);
      }
      
      public function setTuiMingNum(param1:int) : void
      {
         this.mainCharArrtibutePlane.setTianFuTuiMingNum(param1);
      }
      
      public function setTurn(param1:int = 0, param2:int = 0, param3:int = 5, param4:int = 1440) : void
      {
         this.mainCharArrtibutePlane.setTianFuTurn(param1,param2,param3,param4);
      }
      
      public function lingQuGoods() : void
      {
         this.mainCharArrtibutePlane.tianFuLingQuGoods();
      }
   }
}

