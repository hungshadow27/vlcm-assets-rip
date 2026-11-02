package com.tgame.moudels.XiangLong.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.XiangLong.info.XiangLongMainPanelVO;
   import com.tgame.moudels.XiangLong.model.XiangLong_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiangLong_TargetPanelMediator extends Mediator
   {
      
      private static var _xianglongVO:XiangLongMainPanelVO;
      
      public static const NAME:String = "XiangLong_TargetPanelMediator";
      
      private var _senderProxy:XiangLong_MsgSenderProxy;
      
      public function XiangLong_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get xianglongVO() : XiangLongMainPanelVO
      {
         if(!_xianglongVO)
         {
            _xianglongVO = new XiangLongMainPanelVO();
         }
         return _xianglongVO;
      }
      
      public static function clearVO() : void
      {
         if(_xianglongVO)
         {
            _xianglongVO = null;
         }
      }
      
      private function get senderProxy() : XiangLong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiangLong_MsgSenderProxy.NAME) as XiangLong_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIANGLONGSHIBAZHANGJ,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIANGLONGSHIBAZHANGJ,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         XiangLong_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_51907(GameInstance.lookPlayerID);
      }
      
      public function initializeMainUI() : void
      {
         var _loc1_:Boolean = false;
         this.targetArrtibutePlane.set_XLSBZ(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetArrtibutePlane.showXiangLongShiBaZhang();
         this.targetArrtibutePlane.initilizeXiangLongShiBaZhangUI(xianglongVO);
         if(xianglongVO.curLearnLevel >= 18)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = false;
         }
         this.targetArrtibutePlane.setJinduNum(xianglongVO.jihuoJindu,_loc1_);
         this.setTips();
      }
      
      public function setTips() : void
      {
         var _loc1_:String = "";
         if(xianglongVO.jihuoJindu > 0)
         {
            _loc1_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + xianglongVO.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御：") + xianglongVO.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命：") + xianglongVO.addJihuoShengming + "</font>";
         }
         else
         {
            _loc1_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("降龙十八掌顶级激活属性（未激活）") + "</font>";
         }
         this.targetArrtibutePlane.menuJinduToolTip(_loc1_);
      }
   }
}

