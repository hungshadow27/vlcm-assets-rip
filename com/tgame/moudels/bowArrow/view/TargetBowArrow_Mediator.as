package com.tgame.moudels.bowArrow.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.bowArrow.info.BowArrowItemInfo;
   import com.tgame.moudels.bowArrow.model.BowArrow_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TargetBowArrow_Mediator extends Mediator
   {
      
      public static const NAME:String = "TargetBowArrow_Mediator";
      
      private var _msgSendProxy:BowArrow_MsgSenderProxy;
      
      public function TargetBowArrow_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get targetAttribute() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
      }
      
      public function updateTargetBowArrow(param1:BowArrowItemInfo) : void
      {
         this.targetAttribute.setJianshu(param1.allArcheryList,param1.activeArcheryList.length,param1.allArcheryList.length);
         var _loc2_:Array = [];
         if(Boolean(param1.bowArrowGoodsTwo) && param1.bowArrowGoodsOne.id != -1)
         {
            _loc2_.push([param1.bowArrowGoodsOne,1]);
         }
         if(Boolean(param1.bowArrowGoodsTwo) && param1.bowArrowGoodsTwo.id != -1)
         {
            _loc2_.push([param1.bowArrowGoodsTwo,2]);
         }
         this.targetAttribute.setJianzhi(_loc2_,param1.curtID);
         this.targetAttribute.setZuoyong(param1.historyDes);
         this.targetAttribute.setShuxing(param1.propertyDesList,param1.ynlianzhounu);
         this.targetAttribute.setName(param1.name,param1.step.toString());
         if(param1.curtID == -1)
         {
            param1.curtID = 1;
            this.targetAttribute.setBowPage(param1.curtID,8,false,1);
         }
         else
         {
            this.targetAttribute.setBowPage(param1.curtID,8);
         }
         this.targetAttribute.setIsOpen(param1.isUseArrow);
         this.targetAttribute.setBowEnabledFun();
         this.targetAttribute.BowShow(param1.visible);
         this.targetAttribute.setBowJihuo(param1.isJihuo);
         this.targetAttribute.setBowEquip(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetAttribute.setYNEquip(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetAttribute.setBowMenghuanYujian(false);
         this.targetAttribute.setBowDanTian(param1.isDanTian);
      }
      
      public function get msgSendProxy() : BowArrow_MsgSenderProxy
      {
         if(this._msgSendProxy == null)
         {
            this._msgSendProxy = facade.retrieveProxy(BowArrow_MsgSenderProxy.NAME) as BowArrow_MsgSenderProxy;
         }
         return this._msgSendProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetAttribute.addEventListener(TargetAttribute.GETGONGJIAN,onClickBowArrow);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetAttribute.addEventListener(TargetAttribute.GETGONGJIAN,onClickBowArrow);
         });
      }
      
      private function onClickBowArrow(param1:BaseEvent) : void
      {
         if(GameInstance.lookPlayerID != -1)
         {
            this.msgSendProxy.send_53045(GameInstance.lookPlayerID);
         }
      }
      
      public function menuBowToolTip(param1:String) : void
      {
         this.targetAttribute.menuBowToolTip(param1);
      }
      
      public function setBowJinduNum(param1:int, param2:Boolean) : void
      {
         this.targetAttribute.setBowJinduNum(param1,param2);
      }
   }
}

