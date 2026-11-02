package com.tgame.moudels.attribute.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.jingmai.XueweiRes;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.TAVenationPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Attribute_TaJingmaiPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Attribute_TaJingmaiPanelMediator";
      
      private var _jingmaiID:int = 0;
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function Attribute_TaJingmaiPanelMediator()
      {
         super(NAME);
      }
      
      protected function get taJingmaiPanel() : TAVenationPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.taJingmaiPanel);
         }
         return viewComponent as TAVenationPanel;
      }
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
         }
         return this._senderProxy;
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
         UIEventsRegisterManager.addUIRegisterEvent(TAVenationPanel,function():void
         {
            taJingmaiPanel.addEventListener(TAVenationPanel.UI_TA_GETVENATION,taJingmaiPanleHandle);
            taJingmaiPanel.addEventListener(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,taJingmaiPanleHandle);
            taJingmaiPanel.addEventListener(TAVenationPanel.UI_TA_VENATION_GET_POINT_ATTRIBUTE,taJingmaiPanleHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TAVenationPanel,function():void
         {
            taJingmaiPanel.removeEventListener(TAVenationPanel.UI_TA_GETVENATION,taJingmaiPanleHandle);
            taJingmaiPanel.removeEventListener(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,taJingmaiPanleHandle);
            taJingmaiPanel.removeEventListener(TAVenationPanel.UI_TA_VENATION_GET_POINT_ATTRIBUTE,taJingmaiPanleHandle);
         });
      }
      
      private function taJingmaiPanleHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(GameInstance.peioPlayerID <= 0)
         {
            return;
         }
         var _loc3_:String = param1.type;
         switch(_loc3_)
         {
            case TAVenationPanel.UI_TA_GETVENATION:
               this.setZonglan();
               break;
            case TAVenationPanel.UI_TA_VENATION_EVENT_CLICK:
               _loc2_ = param1 as BaseEvent;
               _loc4_ = parseInt(String(_loc2_.data));
               this.setJingmai(_loc4_);
               break;
            case TAVenationPanel.UI_TA_VENATION_GET_POINT_ATTRIBUTE:
               _loc2_ = param1 as BaseEvent;
               _loc5_ = String(_loc2_.data);
               this.setXueweiShuxingXinxi(_loc5_);
         }
      }
      
      private function setZonglan(param1:Boolean = false) : void
      {
         this._jingmaiID = 0;
         var _loc2_:PurePlayer = GameInstance.peioPlayerData as PurePlayer;
         var _loc3_:JingmaiInfo = _loc2_.jingmaiInfo;
         this.taJingmaiPanel.showVenation(_loc3_.getOpenedJingmaiIDArr(),_loc3_.getOpenedXueweiNum(),OtherConst.MAX_XUEWEI * (_loc3_.isZhenlong ? 2 : 1),param1,_loc3_.isZhenlong);
         this.senderProxy.send_50215();
      }
      
      private function setJingmai(param1:int) : void
      {
         var _loc9_:int = 0;
         this._jingmaiID = param1;
         var _loc2_:JingmaiInfo = GameInstance.peioPlayerData.jingmaiInfo;
         var _loc3_:int = _loc2_.getOpenedXueweiIDByJingmaiID(param1);
         var _loc4_:Boolean = _loc2_.isJingmaiOpened(param1);
         var _loc5_:XueweiRes = XueweiResManager.getJingmaiRes(param1,GameInstance.peioPlayerData.jingmaiInfo.isZhenlong);
         if(!_loc5_)
         {
            return;
         }
         var _loc6_:Array = [];
         if(_loc5_.f_hp_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("血") + "+" + _loc5_.f_hp_add);
         }
         if(_loc5_.f_mp_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("蓝") + "+" + _loc5_.f_mp_add);
         }
         if(_loc5_.f_sp_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("体") + "+" + _loc5_.f_sp_add);
         }
         if(_loc5_.f_attack_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("攻") + "+" + _loc5_.f_attack_add);
         }
         if(_loc5_.f_defence_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("防") + "+" + _loc5_.f_defence_add);
         }
         if(_loc5_.f_dodge_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("闪") + "+" + _loc5_.f_dodge_add);
         }
         if(_loc5_.f_crt_add > 0)
         {
            _loc6_.push(LanResManager.getLanCommonTextWords("暴") + "+" + _loc5_.f_crt_add);
         }
         var _loc7_:String = _loc6_.join(",");
         var _loc8_:Function = this.taJingmaiPanel["show_" + param1];
         if(_loc8_ != null)
         {
            if(_loc3_ == -1)
            {
               _loc9_ = 0;
            }
            else
            {
               _loc9_ = _loc3_ % 100 - 1;
            }
            if(_loc4_)
            {
               _loc9_ = -1;
            }
            _loc8_(_loc9_,_loc4_,_loc7_);
         }
      }
      
      private function setXueweiShuxingXinxi(param1:String) : void
      {
         var _loc2_:XueweiRes = XueweiResManager.getXueweiResByName(param1,GameInstance.peioPlayerData.jingmaiInfo.isZhenlong);
         if(_loc2_ == null)
         {
            return;
         }
         this.taJingmaiPanel.setVenationPointAttribute(param1,_loc2_.addStr,_loc2_.f_need_zhenqi);
      }
      
      public function showTaJingmaiInfo(param1:PurePlayer) : void
      {
         if(this._jingmaiID > 0)
         {
            this.setJingmai(this._jingmaiID);
         }
         else
         {
            this.setZonglan(true);
         }
      }
   }
}

