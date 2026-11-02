package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideDreamDanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_MainCharRideMenghuandanMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_MainCharRideMenghuandanMediator";
      
      private var _selectMountID:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_MainCharRideMenghuandanMediator()
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
         UIEventsRegisterManager.addUIRegisterEvent(RideDreamDanPanel,function():void
         {
            GameInstance.uiInstance.rideMenghuandanPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.rideMenghuandanPanel.addEventListener(RideDreamDanPanel.UI_RIDE_SKILL_RESET_SETLECT,uiHandle);
            GameInstance.uiInstance.rideMenghuandanPanel.addEventListener(RideDreamDanPanel.UI_RIDE_SKILL_RESET_OK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideDreamDanPanel,function():void
         {
            GameInstance.uiInstance.rideMenghuandanPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.rideMenghuandanPanel.removeEventListener(RideDreamDanPanel.UI_RIDE_SKILL_RESET_SETLECT,uiHandle);
            GameInstance.uiInstance.rideMenghuandanPanel.removeEventListener(RideDreamDanPanel.UI_RIDE_SKILL_RESET_OK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_52077();
               break;
            case RideDreamDanPanel.UI_RIDE_SKILL_RESET_SETLECT:
               this._selectMountID = int(Number(_loc3_.data));
               this.msgSenderProxy.send_52079(this._selectMountID);
               break;
            case RideDreamDanPanel.UI_RIDE_SKILL_RESET_OK:
               if(this._selectMountID > 0)
               {
                  this.msgSenderProxy.send_52081(this._selectMountID);
               }
         }
      }
      
      public function reRequestSelectMountInfo() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._rideMenghuandanPanel))
         {
            return;
         }
         if(this._selectMountID > 0)
         {
            this.msgSenderProxy.send_52079(this._selectMountID);
         }
      }
      
      public function setRideList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:PureMount = null;
         if(!Fun.isVisible(GameInstance.uiInstance._rideMenghuandanPanel))
         {
            return;
         }
         var _loc4_:XML = <list/>;
         _loc5_ = param2 + "/" + param1;
         for each(_loc6_ in param3)
         {
            _loc4_.appendChild(<node showlabel={_loc6_.name} level={_loc6_.mountAttributeInfo.lv} label={_loc6_.id} state={_loc6_.fightStatus} quality={_loc6_.mountAttributeInfo.quality}/>);
         }
         GameInstance.uiInstance.rideMenghuandanPanel.setRidelist(_loc4_,_loc5_);
      }
      
      public function setRideInfo(param1:PureMount, param2:Array, param3:int, param4:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._rideMenghuandanPanel))
         {
            return;
         }
         if(param1.id != this._selectMountID)
         {
            return;
         }
         var _loc5_:MountAttributeInfo = param1.mountAttributeInfo;
         GameInstance.uiInstance.rideMenghuandanPanel.setRide(param1.name,_loc5_.lv,param1.mountAttributeInfo.menghuan * 100,param2);
         GameInstance.uiInstance.rideMenghuandanPanel.setEquip(param1.mountGoodsInfo.fullGoodsArr);
         if(param3 > 0)
         {
            GameInstance.uiInstance.rideMenghuandanPanel.setAddValue(param4);
         }
         else
         {
            GameInstance.uiInstance.rideMenghuandanPanel.setAddValue(param2);
         }
         GameInstance.uiInstance.rideMenghuandanPanel.setDreamBarPercentage(param1.mountAttributeInfo.menghuan * 100,param1.mountAttributeInfo.menghuan_mhd,param1.mountAttributeInfo.menghuan_wuxing * 100,param1.mountAttributeInfo.menghuan_qianli * 100,param1.mountAttributeInfo.menghuan_jineng * 100,param1.mountAttributeInfo.menghuanShendanJihuo,param1.mountAttributeInfo.chaojizuoqiQianNengDan,param1.mountAttributeInfo.shoushenDan,param1.mountAttributeInfo.zhongjizuoqiQianNengDan,param1.mountAttributeInfo.dianfengqiannengDan);
         this.setAvatar(param1);
      }
      
      private function setAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            GameInstance.uiInstance.rideMenghuandanPanel.setAvatar(param2,$pMount.res.id_ico);
         };
         GameInstance.uiInstance.rideMenghuandanPanel.setAvatar(null,0);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
   }
}

