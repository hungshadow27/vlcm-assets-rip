package com.tgame.moudels.lianti.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.lianti.LiantiRes;
   import com.tgame.common.res.lianti.LiantiResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.lianti.model.Lianti_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Lianti_TargetLiantiPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Lianti_TargetLiantiPanelMediator";
      
      private var _currentLookLiantiID:int = 1;
      
      private var _msgSenderProxy:Lianti_MsgSenderProxy;
      
      public function Lianti_TargetLiantiPanelMediator()
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
      
      private function get msgSenderProxy() : Lianti_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Lianti_MsgSenderProxy.NAME) as Lianti_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.GETDUANZAOROUSHEN,targetArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.GETDUANZAOROUSHEN,targetArrtibutePlaneHandle);
         });
      }
      
      private function targetArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TargetAttribute.GETDUANZAOROUSHEN:
               this.targetArrtibutePlane.showSmithingBody();
               this.msgSenderProxy.send_53001(GameInstance.lookPlayerID);
         }
      }
      
      public function updateLiantiUI(param1:int, param2:Array = null, param3:Boolean = false, param4:Boolean = false, param5:Array = null) : void
      {
         var _loc8_:LiantiRes = null;
         this.targetArrtibutePlane.set_RouShen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetArrtibutePlane.setRouti(GameInstance.lookPlayerData.attributeInfo.isJiHuoRoutiJinshen);
         this.targetArrtibutePlane.reSetRouShen();
         if(param2 != null)
         {
            GameInstance.lookPlayerData.attributeInfo.currentLiantiID = param1;
            this._currentLookLiantiID = param1;
            this.targetArrtibutePlane.setJindu(GameInstance.lookPlayerData.attributeInfo.currentLiantiID);
            this.targetArrtibutePlane.setJihuo(param3);
            this.targetArrtibutePlane.setJihuoDajinlong(param4);
            this.targetArrtibutePlane.setIsJihuoMohua(param5);
            if(param4 == true)
            {
               this.targetArrtibutePlane.loadLongPicture();
            }
         }
         else
         {
            if(param1 < 1 || param1 > LiantiResManager.MAX_LIANTI_LV)
            {
               return;
            }
            this._currentLookLiantiID = param1;
         }
         var _loc6_:LiantiRes = LiantiResManager.getLiantiRes(this._currentLookLiantiID);
         var _loc7_:GoodsRes = GoodsResManager.getGoodsRes(_loc6_.f_tupo_need_goodsmodel);
         if(this._currentLookLiantiID != LiantiResManager.MAX_LIANTI_LV)
         {
            _loc8_ = LiantiResManager.getLiantiRes(this._currentLookLiantiID + 1);
         }
         this.targetArrtibutePlane.setJingjie(_loc6_.f_name);
         this.targetArrtibutePlane.setRouti(GameInstance.lookPlayerData.attributeInfo.isJiHuoRoutiJinshen);
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         if(param2 != null)
         {
            _loc9_ = param2[0] == _loc6_.f_hp && param2[1] == _loc6_.f_mp && param2[2] == _loc6_.f_sp && param2[3] == _loc6_.f_atk && param2[4] == _loc6_.f_def && param2[5] == _loc6_.f_atk_speed && param2[6] == _loc6_.f_move_speed && param2[7] == _loc6_.f_fjsh && param2[8] == _loc6_.f_shjm && param2[9] == _loc6_.f_aq_jv;
            _loc10_ = (_loc9_) && GameInstance.lookPlayerData.attributeInfo.currentLiantiID != LiantiResManager.MAX_LIANTI_LV;
            this.targetArrtibutePlane.setBar1(_loc6_.f_hp > 0,param2[0],_loc6_.f_hp);
            this.targetArrtibutePlane.setBar2(_loc6_.f_mp > 0,param2[1],_loc6_.f_mp);
            this.targetArrtibutePlane.setBar3(_loc6_.f_sp > 0,param2[2],_loc6_.f_sp);
            this.targetArrtibutePlane.setBar4(_loc6_.f_atk > 0,param2[3],_loc6_.f_atk);
            this.targetArrtibutePlane.setBar5(_loc6_.f_def > 0,param2[4],_loc6_.f_def);
            this.targetArrtibutePlane.setBar6(_loc6_.f_atk_speed > 0,param2[5],_loc6_.f_atk_speed);
            this.targetArrtibutePlane.setBar7(_loc6_.f_move_speed > 0,param2[6],_loc6_.f_move_speed);
            this.targetArrtibutePlane.setBar8(_loc6_.f_fjsh > 0,param2[7],_loc6_.f_fjsh);
            this.targetArrtibutePlane.setBar9(_loc6_.f_shjm > 0,param2[8],_loc6_.f_shjm);
            this.targetArrtibutePlane.setBar10(_loc6_.f_aq_jv > 0,param2[9],_loc6_.f_aq_jv);
         }
         else
         {
            _loc9_ = this._currentLookLiantiID < GameInstance.lookPlayerData.attributeInfo.currentLiantiID;
            _loc10_ = false;
            this.targetArrtibutePlane.setBar1(_loc6_.f_hp > 0,_loc9_ ? _loc6_.f_hp : 0,_loc6_.f_hp);
            this.targetArrtibutePlane.setBar2(_loc6_.f_mp > 0,_loc9_ ? _loc6_.f_mp : 0,_loc6_.f_mp);
            this.targetArrtibutePlane.setBar3(_loc6_.f_sp > 0,_loc9_ ? _loc6_.f_sp : 0,_loc6_.f_sp);
            this.targetArrtibutePlane.setBar4(_loc6_.f_atk > 0,_loc9_ ? _loc6_.f_atk : 0,_loc6_.f_atk);
            this.targetArrtibutePlane.setBar5(_loc6_.f_def > 0,_loc9_ ? _loc6_.f_def : 0,_loc6_.f_def);
            this.targetArrtibutePlane.setBar6(_loc6_.f_atk_speed > 0,_loc9_ ? _loc6_.f_atk_speed : 0,_loc6_.f_atk_speed);
            this.targetArrtibutePlane.setBar7(_loc6_.f_move_speed > 0,_loc9_ ? _loc6_.f_move_speed : 0,_loc6_.f_move_speed);
            this.targetArrtibutePlane.setBar8(_loc6_.f_fjsh > 0,_loc9_ ? _loc6_.f_fjsh : 0,_loc6_.f_fjsh);
            this.targetArrtibutePlane.setBar9(_loc6_.f_shjm > 0,_loc9_ ? _loc6_.f_shjm : 0,_loc6_.f_shjm);
            this.targetArrtibutePlane.setBar10(_loc6_.f_aq_jv > 0,_loc9_ ? _loc6_.f_aq_jv : 0,_loc6_.f_aq_jv);
         }
         this.targetArrtibutePlane.setMiaoshu(LiantiResManager.getLiantiMainDes(this._currentLookLiantiID));
         this.targetArrtibutePlane.setPage(this._currentLookLiantiID,LiantiResManager.MAX_LIANTI_LV,_loc9_);
         this.targetArrtibutePlane.setRouShenEnabledFun();
      }
      
      public function initializeMainUI(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Boolean = false;
         if(param1 >= 8)
         {
            _loc6_ = true;
         }
         else
         {
            _loc6_ = false;
         }
         this.targetArrtibutePlane.setRoushenJinduNum(param2,_loc6_);
         var _loc7_:String = "";
         if(param2 > 0)
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + " " + LanResManager.getLanCommonTextWords("防御:") + param4 + " " + LanResManager.getLanCommonTextWords("生命:") + param5 + "</font>";
         }
         else
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身顶级激活属性（未激活）") + "</font>";
         }
         this.targetArrtibutePlane.menuRoushenJinduToolTip(_loc7_);
      }
      
      public function zuoqi(param1:Boolean) : void
      {
         this.targetArrtibutePlane.roushenzuoqi(param1);
      }
   }
}

