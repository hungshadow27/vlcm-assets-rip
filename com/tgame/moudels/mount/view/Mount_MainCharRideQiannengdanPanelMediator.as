package com.tgame.moudels.mount.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideQianNengDanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_MainCharRideQiannengdanPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_MainCharRideQiannengdanPanelMediator";
      
      private var _selectMountID:int = 0;
      
      private var _selectMountName:String = "";
      
      private var avatar_zizeng:int = 0;
      
      private var _qiannengdanID:int = 0;
      
      private var _selectQianneng:int = 0;
      
      private var _yijingFujia:Array = [0,0,0,0];
      
      private var _jijiangFujia:Array = [0,0,0,0];
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_MainCharRideQiannengdanPanelMediator()
      {
         super(NAME);
      }
      
      public function setQiannengdanID(param1:int) : void
      {
         this._qiannengdanID = param1;
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
         UIEventsRegisterManager.addUIRegisterEvent(RideQianNengDanPanel,function():void
         {
            GameInstance.uiInstance.rideQiannengdanPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.addEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_SELECT,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.addEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.addEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_OK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideQianNengDanPanel,function():void
         {
            GameInstance.uiInstance.rideQiannengdanPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.removeEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_SELECT,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.removeEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT,uiHandle);
            GameInstance.uiInstance.rideQiannengdanPanel.removeEventListener(RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_OK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var mountID:int = 0;
         var qianliName:String = null;
         var jijiangFJ:int = 0;
         var goodsRes:GoodsRes = null;
         var str:String = null;
         var arr:Array = null;
         var e:Event = param1;
         var type:String = e.type;
         var evt:BaseEvent = e as BaseEvent;
         switch(type)
         {
            case Event.ADDED_TO_STAGE:
               this._selectMountID = 0;
               this._selectMountName = "";
               this._selectQianneng = 0;
               this._yijingFujia = [0,0,0,0];
               this._jijiangFujia = [0,0,0,0];
               this.msgSenderProxy.send_52071();
               break;
            case RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_SELECT:
               this._selectQianneng = 0;
               this._yijingFujia = [0,0,0,0];
               this._jijiangFujia = [0,0,0,0];
               this._selectMountID = evt.data.label;
               this._selectMountName = evt.data.showlabel;
               this.msgSenderProxy.send_52073([this._selectMountID,this._qiannengdanID]);
               break;
            case RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_QIANLI_SELECT:
               this._selectQianneng = evt.data as int;
               if(this._selectQianneng > 0)
               {
                  GameInstance.uiInstance.rideQiannengdanPanel.setAddValue(this._jijiangFujia[this._selectQianneng - 1] + this._yijingFujia[this._selectQianneng - 1],this._jijiangFujia[this._selectQianneng - 1] + this._yijingFujia[0] + this._yijingFujia[1] + this._yijingFujia[2] + this._yijingFujia[3]);
               }
               break;
            case RideQianNengDanPanel.UI_RIDE_QIANNENGDAN_RIDE_OK:
               if(this._selectMountID > 0 && this._qiannengdanID > 0 && this._selectQianneng > 0)
               {
                  qianliName = "";
                  if(this._selectQianneng == 1)
                  {
                     qianliName = LanResManager.getLanCommonTextWords("进攻");
                  }
                  else if(this._selectQianneng == 2)
                  {
                     qianliName = LanResManager.getLanCommonTextWords("防御");
                  }
                  else if(this._selectQianneng == 3)
                  {
                     qianliName = LanResManager.getLanCommonTextWords("健体");
                  }
                  else if(this._selectQianneng == 4)
                  {
                     qianliName = LanResManager.getLanCommonTextWords("轻身");
                  }
                  jijiangFJ = int(this._jijiangFujia[this._selectQianneng - 1]);
                  goodsRes = GoodsResManager.getGoodsRes(this._qiannengdanID);
                  str = LanResManager.getLanTextWords(this,"您确认要将坐骑",[this._selectMountName,qianliName,jijiangFJ,jijiangFJ,goodsRes.name]);
                  arr = [this._selectMountID,this._qiannengdanID,this._selectQianneng];
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_52075(arr);
                     }
                  });
               }
         }
      }
      
      public function reRequestSelectMountInfo(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._rideQiannengdanPanel))
         {
            return;
         }
         if(this._qiannengdanID != param1)
         {
            return;
         }
         if(this._selectMountID > 0 && this._qiannengdanID > 0)
         {
            this.msgSenderProxy.send_52073([this._selectMountID,this._qiannengdanID]);
         }
      }
      
      public function setRideList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:PureMount = null;
         if(!Fun.isVisible(GameInstance.uiInstance._rideQiannengdanPanel))
         {
            return;
         }
         var _loc4_:XML = <list/>;
         _loc5_ = param2 + "/" + param1;
         for each(_loc6_ in param3)
         {
            _loc4_.appendChild(<node showlabel={_loc6_.name} level={_loc6_.mountAttributeInfo.lv} label={_loc6_.id} state={_loc6_.fightStatus} quality={_loc6_.mountAttributeInfo.quality}/>);
         }
         GameInstance.uiInstance.rideQiannengdanPanel.setRidelist(_loc4_,_loc5_);
         _loc6_ = param3[0];
         if(_loc6_ != null)
         {
            GameInstance.uiInstance.rideQiannengdanPanel.setSelectRideByID(this._selectMountID > 0 ? this._selectMountID : _loc6_.id);
         }
      }
      
      public function setRideInfo(param1:PureMount, param2:int, param3:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._rideQiannengdanPanel))
         {
            return;
         }
         if(param1.id != this._selectMountID)
         {
            return;
         }
         if(this._qiannengdanID != param2)
         {
            return;
         }
         this._yijingFujia = [param1.mountAttributeInfo.points_attackFujia,param1.mountAttributeInfo.points_defenceFujia,param1.mountAttributeInfo.points_flyFujia,param1.mountAttributeInfo.points_stongFujia];
         this._jijiangFujia = param3;
         var _loc4_:MountAttributeInfo = param1.mountAttributeInfo;
         GameInstance.uiInstance.rideQiannengdanPanel.setRide(param1.name,_loc4_.lv);
         GameInstance.uiInstance.rideQiannengdanPanel.setEquip(param1.mountGoodsInfo.fullGoodsArr);
         GameInstance.uiInstance.rideQiannengdanPanel.setAttribute(param1.mountAttributeInfo.expNow,param1.mountAttributeInfo.expMax,param1.mountAttributeInfo.points_attackNow,param1.mountAttributeInfo.points_attackMax,param1.mountAttributeInfo.points_defenceNow,param1.mountAttributeInfo.points_defenceMax,param1.mountAttributeInfo.points_flyNow,param1.mountAttributeInfo.points_flyMax,param1.mountAttributeInfo.points_stongNow,param1.mountAttributeInfo.points_stongMax,param1.mountAttributeInfo.points_attackFujia,param1.mountAttributeInfo.points_defenceFujia,param1.mountAttributeInfo.points_flyFujia,param1.mountAttributeInfo.points_stongFujia);
         GameInstance.uiInstance.rideQiannengdanPanel.setDreamBarPercentage(param1.mountAttributeInfo.menghuan * 100,param1.mountAttributeInfo.menghuan_mhd,param1.mountAttributeInfo.menghuan_wuxing * 100,param1.mountAttributeInfo.menghuan_qianli * 100,param1.mountAttributeInfo.menghuan_jineng * 100,param1.mountAttributeInfo.menghuanShendanJihuo,param1.mountAttributeInfo.chaojizuoqiQianNengDan,param1.mountAttributeInfo.shoushenDan,param1.mountAttributeInfo.zhongjizuoqiQianNengDan,param1.mountAttributeInfo.dianfengqiannengDan);
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
            GameInstance.uiInstance.rideQiannengdanPanel.setAvatar(param2,$pMount.res.id_ico);
         };
         GameInstance.uiInstance.rideQiannengdanPanel.setAvatar(null,0);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
   }
}

