package com.tgame.moudels.XiSuiJing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.XiSuiJing.model.XiSuiJing_MsgSenderProxy;
   import com.tgame.moudels.XiSuiJing.model.info.XiSuiJingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiSuiJing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XiSuiJing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XiSuiJing_MsgSenderProxy;
      
      public function XiSuiJing_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiSuiJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiSuiJing_MsgSenderProxy.NAME) as XiSuiJing_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
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
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.YIJINJING_X,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YIJINJING_X,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_51997(GameInstance.lookPlayerID);
      }
      
      public function upDataPanel(param1:int, param2:XiSuiJingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYiJinJing_X();
         this.targetArrtibutePlane.setYiJinJingEnabledFunJ_X();
         this.targetArrtibutePlane.initilizeYiJinJingUI_X(param2);
         this.targetArrtibutePlane.set_XiSuiJing(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
      
      public function upDataXisuijingJindu(param1:XiSuiJingVO) : void
      {
         var _loc2_:Boolean = false;
         if(param1.nowID >= 10)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         this.targetArrtibutePlane.setXisuijingJinduNum(param1.jihuoJindu,_loc2_);
         var _loc3_:String = "";
         if(param1.jihuoJindu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + param1.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + param1.addJihuoShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗髓经顶级激活属性（未激活）") + "</font>";
         }
         this.targetArrtibutePlane.menuXisuijingToolTip(_loc3_);
      }
   }
}

