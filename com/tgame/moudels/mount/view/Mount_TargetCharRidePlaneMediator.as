package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_TargetCharRidePlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_TargetCharRidePlaneMediator";
      
      private var avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_TargetCharRidePlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get targetCharArrtibutePlane() : TargetAttribute
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
            targetCharArrtibutePlane.addEventListener(TargetAttribute.UI_TARGETATTRIBUTE_RIDE_SHOW,targetCharRidePlaneHandle);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GETRIDEINTBYID,targetCharRidePlaneHandle);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.UI_TARGETRIDETIPS_SHOW,shouyuanjiacheng_Handle);
            targetCharArrtibutePlane.addEventListener(TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW,targetCharRidePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.UI_TARGETATTRIBUTE_RIDE_SHOW,targetCharRidePlaneHandle);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GETRIDEINTBYID,targetCharRidePlaneHandle);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.UI_TARGETRIDETIPS_SHOW,shouyuanjiacheng_Handle);
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW,targetCharRidePlaneHandle);
         });
      }
      
      private function targetCharRidePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         if(GameInstance.lookPlayerID == -1)
         {
            return;
         }
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TargetAttribute.UI_TARGETATTRIBUTE_RIDE_SHOW:
               GameInstance.lookPlayerData.mountInfo.selectedMountID = -1;
               this.msgSenderProxy.send_50029([GameInstance.lookPlayerID,2]);
               this.targetCharArrtibutePlane.rideContainer.showTargetDianFengShou(false);
               if(GameState.dictTargetStatus[SpecialGoodsID.ZUOQI_DIANFENGSHOU_ID])
               {
                  this.msgSenderProxy.send_74151([GameInstance.lookPlayerID,-1]);
               }
               this.targetCharArrtibutePlane.rideContainer.showTargetRide(false);
               break;
            case TargetAttribute.GETRIDEINTBYID:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               GameInstance.lookPlayerData.mountInfo.selectedMountID = _loc4_;
               this.msgSenderProxy.send_50031([GameInstance.lookPlayerID,_loc4_]);
               this.targetCharArrtibutePlane.rideContainer.showTargetRide(false);
               this.targetCharArrtibutePlane.rideContainer.showTargetDianFengShou(false);
               break;
            case TargetAttribute.UI_TARGETRIDE_DIANFENGSHOU_SHOW:
               _loc3_ = param1 as BaseEvent;
               this.msgSenderProxy.send_74151([GameInstance.lookPlayerID,int(_loc3_.data)]);
         }
      }
      
      private function shouyuanjiacheng_Handle(param1:* = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         this.msgSenderProxy.send_60661([GameInstance.lookPlayerID,GameInstance.lookPlayerData.mountInfo.selectedMountID,_loc2_.data]);
      }
      
      public function setRideList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:PureMount = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         GameInstance.lookPlayerData.mountInfo.selectedMountID = -1;
         var _loc4_:XML = <list/>;
         _loc5_ = param2 + "/" + param1;
         for each(_loc6_ in param3)
         {
            _loc4_.appendChild(<node ycsx={_loc6_.mountAttributeInfo.ycsx} icoId={_loc6_.res.id_ico} xs={_loc6_.mountAttributeInfo.bloodS} showlabel={_loc6_.name} level={_loc6_.mountAttributeInfo.lv} label={_loc6_.id} state={_loc6_.fightStatus} wx={_loc6_.mountAttributeInfo.savvy} quality={_loc6_.mountAttributeInfo.getQualityName()} zw1={_loc6_.mountAttributeInfo.zw1} zw2={_loc6_.mountAttributeInfo.zw2} zw3={_loc6_.mountAttributeInfo.zw3} zw4={_loc6_.mountAttributeInfo.zw4}/>);
         }
         _loc7_ = param1 - param2;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc4_.appendChild(<node showlabel={LanResManager.getLanCommonTextWords("空闲槽位")}/>);
            _loc8_++;
         }
         this.targetCharArrtibutePlane.setRideList(_loc4_,_loc5_);
         this.targetCharArrtibutePlane.showRide();
         this.targetCharArrtibutePlane.setShouwangzhihun(false,false);
         this.targetCharArrtibutePlane.rideContainer.showTargetRide(false);
      }
      
      public function setRideInfo(param1:PureMount, param2:int, param3:String) : void
      {
         var _loc4_:MountAttributeInfo = param1.mountAttributeInfo;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         this.targetCharArrtibutePlane.setRideBaseAttribute(param1.name,_loc4_.getQualityName(),String(_loc4_.savvy),String(_loc4_.identity),String(_loc4_.lv));
         this.targetCharArrtibutePlane.setRideAttibute(_loc4_.expNow,_loc4_.expMax,_loc4_.energyNow,_loc4_.energyMax,_loc4_.fightNow,_loc4_.fightMax,_loc4_.points_attackNow,_loc4_.points_attackMax,_loc4_.points_defenceNow,_loc4_.points_defenceMax,_loc4_.points_flyNow,_loc4_.points_flyMax,_loc4_.points_stongNow,_loc4_.points_stongMax,_loc4_.points_attackFujia,_loc4_.points_defenceFujia,_loc4_.points_flyFujia,_loc4_.points_stongFujia);
         _loc5_ = _loc4_.append_hp + _loc4_.menghuan_append_hp;
         _loc6_ = _loc4_.append_mp + _loc4_.menghuan_append_mp;
         _loc7_ = _loc4_.append_pp + _loc4_.menghuan_append_pp;
         _loc8_ = _loc4_.append_ap + _loc4_.menghuan_append_ap;
         _loc9_ = _loc4_.append_dp + _loc4_.menghuan_append_dp;
         _loc10_ = _loc4_.append_cp + _loc4_.menghuan_append_cp;
         _loc11_ = _loc4_.append_ev + _loc4_.menghuan_append_ev;
         _loc12_ = _loc4_.append_adx + _loc4_.menghuan_append_adx;
         _loc13_ = _loc4_.append_mdx + _loc4_.menghuan_append_mdx;
         _loc5_ += _loc4_.souyuan_hp;
         _loc6_ += _loc4_.souyuan_mp;
         _loc7_ += _loc4_.souyuan_pp;
         _loc7_ = _loc7_ + _loc4_.souyuan_ap;
         _loc9_ += _loc4_.souyuan_dp;
         _loc10_ += _loc4_.souyuan_cp;
         _loc11_ += _loc4_.souyuan_ev;
         _loc12_ += _loc4_.souyuan_adx;
         _loc13_ += _loc4_.souyuan_mdx;
         _loc5_ += _loc4_.superMpunt_hp;
         _loc6_ += _loc4_.superMpunt_mp;
         _loc7_ += _loc4_.superMpunt_pp;
         _loc8_ += _loc4_.superMpunt_ap;
         _loc9_ += _loc4_.superMpunt_dp;
         _loc10_ += _loc4_.superMpunt_cp;
         _loc11_ += _loc4_.superMpunt_ev;
         _loc12_ += _loc4_.superMpunt_adx;
         _loc13_ += _loc4_.superMpunt_mdx;
         this.targetCharArrtibutePlane.setDreamValue(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
         this.targetCharArrtibutePlane.setRideAddCharValue(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
         this.targetCharArrtibutePlane.setRideEquip(param1.mountGoodsInfo.fullGoodsArr);
         this.targetCharArrtibutePlane.setRideSkill(param1.mountSkillInfo.skillObj);
         this.targetCharArrtibutePlane.setExpireDate(param3);
         this.targetCharArrtibutePlane.setShouwangzhihun(_loc4_.isLong,_loc4_.shouwangzhihunJihuo);
         this.targetCharArrtibutePlane.rideContainer.setDreamBarPercentage(param1.mountAttributeInfo.menghuan * 100,param1.mountAttributeInfo.menghuan_mhd,param1.mountAttributeInfo.menghuan_wuxing * 100,param1.mountAttributeInfo.menghuan_qianli * 100,param1.mountAttributeInfo.menghuan_jineng * 100,param1.mountAttributeInfo.menghuanShendanJihuo,param1.mountAttributeInfo.chaojizuoqiQianNengDan,param1.mountAttributeInfo.shoushenDan,param1.mountAttributeInfo.zhongjizuoqiQianNengDan,param1.mountAttributeInfo.dianfengqiannengDan);
         this.targetCharArrtibutePlane.rideContainer.showTargetRide(true);
         this.targetCharArrtibutePlane.rideContainer.setTargetRide(_loc4_.savvy,_loc4_.getQualityName(),_loc4_.fightNow,_loc4_.fightMax,_loc4_.points_attackNow,_loc4_.points_attackMax,_loc4_.points_attackFujia,_loc4_.points_defenceNow,_loc4_.points_defenceMax,_loc4_.points_defenceFujia,_loc4_.points_flyNow,_loc4_.points_flyMax,_loc4_.points_flyFujia,_loc4_.points_stongNow,_loc4_.points_stongMax,_loc4_.points_stongFujia,_loc4_.shouYuanCount);
         if(param1.mountAttributeInfo.superMountType > 0)
         {
            this.targetCharArrtibutePlane.setSiShengShouValue(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
         }
         this.setAvatar(param1,param2);
      }
      
      private function setAvatar(param1:PureMount, param2:int) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         var intYinCangShuXingJiHuo:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            targetCharArrtibutePlane.setRideAvatar(param2,$pMount.res.id_ico);
            targetCharArrtibutePlane.setYinCangShuXingJiHuo(intYinCangShuXingJiHuo);
         };
         this.targetCharArrtibutePlane.setRideAvatar(null,0);
         this.targetCharArrtibutePlane.setYinCangShuXingJiHuo(0);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      public function setShouYuanTips(param1:Array) : void
      {
         this.targetCharArrtibutePlane.rideContainer.setTips(param1);
      }
      
      public function showTargetDianFengShou(param1:Boolean) : void
      {
         this.targetCharArrtibutePlane.rideContainer.showTargetDianFengShou(param1);
      }
      
      public function setDianFengShouData(param1:int, param2:Array, param3:PureMount, param4:int) : void
      {
         this.targetCharArrtibutePlane.rideContainer.setDianFengShouData(param1,param2,param3,param4);
         this.targetCharArrtibutePlane.rideContainer.setDianFengShouFun();
      }
   }
}

