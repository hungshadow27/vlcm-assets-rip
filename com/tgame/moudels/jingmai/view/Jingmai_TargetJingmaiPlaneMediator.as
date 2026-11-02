package com.tgame.moudels.jingmai.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.jingmai.XueweiRes;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.qihai.QihaiManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jingmai.model.Jingmai_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Jingmai_TargetJingmaiPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Jingmai_TargetJingmaiPlaneMediator";
      
      private var _jingmaiID:int = 0;
      
      private var _msgSenderProxy:Jingmai_MsgSenderProxy;
      
      public function Jingmai_TargetJingmaiPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get msgSenderProxy() : Jingmai_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Jingmai_MsgSenderProxy.NAME) as Jingmai_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.GETVENATION,targetArrtibutePlaneHandle);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,targetArrtibutePlaneHandle);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_TA_VENATION_GET_POINT_ATTRIBUTE,targetArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GETVENATION,targetArrtibutePlaneHandle);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,targetArrtibutePlaneHandle);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_TA_VENATION_GET_POINT_ATTRIBUTE,targetArrtibutePlaneHandle);
         });
      }
      
      private function targetArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TargetAttribute.GETVENATION:
               this.setZonglan();
               break;
            case TargetAttribute.UI_TA_VENATION_EVENT_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = parseInt(String(_loc3_.data));
               this.setJingmai(_loc4_);
               break;
            case TargetAttribute.UI_TA_VENATION_GET_POINT_ATTRIBUTE:
               _loc3_ = param1 as BaseEvent;
               _loc5_ = String(_loc3_.data);
               this.setXueweiShuxingXinxi(_loc5_);
         }
      }
      
      public function setZonglan(param1:Boolean = false) : void
      {
         this._jingmaiID = 0;
         var _loc2_:JingmaiInfo = GameInstance.lookPlayerData.jingmaiInfo;
         this.targetArrtibutePlane.showVenation(_loc2_.getOpenedJingmaiIDArr(),_loc2_.getOpenedXueweiNum(),OtherConst.MAX_XUEWEI * (_loc2_.isZhenlong ? 2 : 1),false,_loc2_.isZhenlong);
         this.targetArrtibutePlane.setQiHaiSta(false);
         this.msgSenderProxy.send_50235(GameInstance.lookPlayerID);
      }
      
      public function setJingmai(param1:int) : void
      {
         var _loc9_:int = 0;
         this._jingmaiID = param1;
         var _loc2_:JingmaiInfo = GameInstance.lookPlayerData.jingmaiInfo;
         var _loc3_:int = _loc2_.getOpenedXueweiIDByJingmaiID(param1);
         var _loc4_:Boolean = _loc2_.isJingmaiOpened(param1);
         var _loc5_:XueweiRes = XueweiResManager.getJingmaiRes(param1,GameInstance.lookPlayerData.jingmaiInfo.isZhenlong);
         if(!_loc5_)
         {
            return;
         }
         this.targetArrtibutePlane.setQiHaiSta(_loc2_.isZhenlong,_loc2_.getQiHaiSta(param1),QihaiManager.getQihaiJiachengRes(param1));
         var _loc6_:Array = [];
         if(_loc5_.f_hp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"血") + _loc5_.f_hp_add);
         }
         if(_loc5_.f_mp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"蓝") + _loc5_.f_mp_add);
         }
         if(_loc5_.f_sp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"体") + _loc5_.f_sp_add);
         }
         if(_loc5_.f_attack_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"攻") + _loc5_.f_attack_add);
         }
         if(_loc5_.f_defence_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"防") + _loc5_.f_defence_add);
         }
         if(_loc5_.f_dodge_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"闪") + _loc5_.f_dodge_add);
         }
         if(_loc5_.f_crt_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"暴") + _loc5_.f_crt_add);
         }
         var _loc7_:String = _loc6_.join(",");
         var _loc8_:Function = this.targetArrtibutePlane["show_" + param1];
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
         var _loc2_:XueweiRes = XueweiResManager.getXueweiResByName(param1,GameInstance.lookPlayerData.jingmaiInfo.isZhenlong);
         if(_loc2_ == null)
         {
            return;
         }
         this.targetArrtibutePlane.setVenationPointAttribute(param1,_loc2_.addStr,_loc2_.f_need_zhenqi);
      }
      
      public function showTaJingmaiInfo() : void
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

