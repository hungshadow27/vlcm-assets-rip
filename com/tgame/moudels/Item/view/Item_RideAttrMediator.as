package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.RideAttributePanel;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_RideAttrMediator extends Mediator
   {
      
      public static const NAME:String = "Item_RideAttrMediator";
      
      private var _roleID:int;
      
      private var _mountID:int;
      
      private var _mount:PureMount;
      
      private var _isShowSelf:Boolean;
      
      private var avatar_zizeng:int = 0;
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_RideAttrMediator()
      {
         super(NAME);
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get rideAttrPanel() : RideAttributePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rideAttrPanel);
         }
         return viewComponent as RideAttributePanel;
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
      }
      
      public function show(param1:int, param2:int) : void
      {
         this._roleID = param1;
         this._mountID = param2;
         this._isShowSelf = false;
         if(!this._isShowSelf)
         {
            this.sender.send_50061([param1,param2]);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._rideAttrPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_RIDE_ATTR_PANEL);
         }
      }
      
      public function initRideDetail(param1:PureMount) : void
      {
         this._mount = param1;
         this.rideAttrPanel.setRide(this._mount.mountAttributeInfo.getQualityName(),this._mount.name,this._mount.mountAttributeInfo.identity.toString(),this._mount.mountAttributeInfo.lv.toString(),this._mount.mountAttributeInfo.savvy.toString(),this._mount.mountAttributeInfo.energyNow.toString(),this._mount.mountAttributeInfo.fightNow,this._mount.mountAttributeInfo.fightMax,this._mount.mountAttributeInfo.append_hp,this._mount.mountAttributeInfo.append_mp,this._mount.mountAttributeInfo.append_pp,this._mount.mountAttributeInfo.append_ap,this._mount.mountAttributeInfo.append_dp,this._mount.mountAttributeInfo.append_cp,this._mount.mountAttributeInfo.append_ev,this._mount.mountAttributeInfo.append_adx,this._mount.mountAttributeInfo.append_mdx,this._mount.mountAttributeInfo.expNow,this._mount.mountAttributeInfo.expMax,this._mount.mountAttributeInfo.points_attackNow,this._mount.mountAttributeInfo.points_attackMax,this._mount.mountAttributeInfo.points_defenceNow,this._mount.mountAttributeInfo.points_defenceMax
         ,this._mount.mountAttributeInfo.points_flyNow,this._mount.mountAttributeInfo.points_flyMax,this._mount.mountAttributeInfo.points_stongNow,this._mount.mountAttributeInfo.points_stongMax,this._mount.mountGoodsInfo.goodsBagArr,this._mount.mountSkillInfo.skillObj,this._mount.mountAttributeInfo.points_attackFujia,this._mount.mountAttributeInfo.points_defenceFujia,this._mount.mountAttributeInfo.points_flyFujia,this._mount.mountAttributeInfo.points_stongFujia);
         this.rideAttrPanel.setDreamBarPercentage(this._mount.mountAttributeInfo.menghuan * 100,this._mount.mountAttributeInfo.menghuan_mhd,this._mount.mountAttributeInfo.menghuan_wuxing * 100,this._mount.mountAttributeInfo.menghuan_qianli * 100,this._mount.mountAttributeInfo.menghuan_jineng * 100,this._mount.mountAttributeInfo.menghuanShendanJihuo,this._mount.mountAttributeInfo.chaojizuoqiQianNengDan,this._mount.mountAttributeInfo.shoushenDan,this._mount.mountAttributeInfo.zhongjizuoqiQianNengDan,this._mount.mountAttributeInfo.dianfengqiannengDan);
         this.rideAttrPanel.setDreamValue(this._mount.mountAttributeInfo.menghuan_append_hp,this._mount.mountAttributeInfo.menghuan_append_mp,this._mount.mountAttributeInfo.menghuan_append_pp,this._mount.mountAttributeInfo.menghuan_append_ap,this._mount.mountAttributeInfo.menghuan_append_dp,this._mount.mountAttributeInfo.menghuan_append_cp,this._mount.mountAttributeInfo.menghuan_append_ev,this._mount.mountAttributeInfo.menghuan_append_adx,this._mount.mountAttributeInfo.menghuan_append_mdx);
         if(param1.mountAttributeInfo.superMountType > 0)
         {
            this.rideAttrPanel.setSiShengShouValue(param1.mountAttributeInfo.superMpunt_hp,param1.mountAttributeInfo.superMpunt_mp,param1.mountAttributeInfo.superMpunt_pp,param1.mountAttributeInfo.superMpunt_ap,param1.mountAttributeInfo.superMpunt_dp,param1.mountAttributeInfo.superMpunt_ev,param1.mountAttributeInfo.superMpunt_cp,param1.mountAttributeInfo.superMpunt_adx,param1.mountAttributeInfo.superMpunt_mdx);
         }
         this.setAvatar(this._mount);
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
            rideAttrPanel.setAvatar(param2,$pMount.res.id_ico);
         };
         this.rideAttrPanel.setAvatar(null,0);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
   }
}

