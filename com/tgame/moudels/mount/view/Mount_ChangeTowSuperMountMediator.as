package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideJiaohuanShenshouPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_ChangeTowSuperMountMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_ChangeTowSuperMountMediator";
      
      private var avatar_zizeng:int = 1;
      
      private var selectMountID:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_ChangeTowSuperMountMediator(param1:String = null, param2:Object = null)
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
      
      protected function get panel() : RideJiaohuanShenshouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.changeSuperMount1);
         }
         return viewComponent as RideJiaohuanShenshouPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function changeSuperMountComplete(param1:int) : void
      {
         var _loc2_:Goods = null;
         if(param1 == 1)
         {
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,6]);
         }
         else
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SHENG_SHOU_BIAN_HUAN_SHEN_DAN);
            this.panel.setInit([_loc2_,_loc2_,_loc2_,_loc2_],[true,true,true,true]);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RideJiaohuanShenshouPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.addEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,targetCharRidePlaneHandle);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideJiaohuanShenshouPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.removeEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1,targetCharRidePlaneHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function addedPanel(param1:Event) : void
      {
         this.panel.setSishoushengHuhuan();
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SHENG_SHOU_BIAN_HUAN_SHEN_DAN);
         this.panel.setInit([_loc2_,_loc2_,_loc2_,_loc2_],[false,false,false,false]);
         this.msgSenderProxy.send_50029([GameInstance.mainChar.id,6]);
      }
      
      private function panelClose(param1:Event = null) : void
      {
         this.selectMountID = 0;
      }
      
      private function targetCharRidePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN_1:
               _loc5_ = _loc3_.data as Array;
               this.msgSenderProxy.send_52097({
                  "mid":int(_loc5_[0]),
                  "type":int(_loc5_[1]),
                  "panelID":this.panel.panelID
               });
         }
      }
      
      public function setMountList(param1:Array) : void
      {
         var _loc3_:String = null;
         var _loc4_:PureMount = null;
         var _loc7_:Goods = null;
         var _loc2_:XML = <list/>;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc2_.appendChild(<node showlabel={_loc4_.name} level={_loc4_.mountAttributeInfo.lv} label={_loc4_.id} state={_loc4_.fightStatus} quality={_loc4_.mountAttributeInfo.quality}/>);
            _loc6_ = _loc5_;
            _loc5_++;
         }
         _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SHENG_SHOU_BIAN_HUAN_SHEN_DAN);
         if(param1.length > 0)
         {
            this.panel.setInit([_loc7_,_loc7_,_loc7_,_loc7_],[true,true,true,true]);
         }
         else
         {
            this.panel.setInit([_loc7_,_loc7_,_loc7_,_loc7_],[false,false,false,false]);
         }
         this.panel.setRideList(_loc2_,_loc6_);
      }
   }
}

