package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideJiaohuanShenshouPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_ChangeSuperMount extends Mediator
   {
      
      public static const NAME:String = "Mount_ChangeSuperMount";
      
      private var avatar_zizeng:int = 1;
      
      private var selectMountID:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      private var _mainCharRideFeedPlaneMediator:Mount_MainCharRideFeedPlaneMediator;
      
      public function Mount_ChangeSuperMount()
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
            setViewComponent(GameInstance.uiInstance.changeSuperMount);
         }
         return viewComponent as RideJiaohuanShenshouPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mount_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._changeSuperMount))
               {
                  this.msgSenderProxy.send_50029([GameInstance.mainChar.id,5]);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function changeSuperMountComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,5]);
         }
      }
      
      public function setItem(param1:Array, param2:Array) : void
      {
         var _loc6_:Goods = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1[_loc5_],true,true);
            if(_loc6_.count == 0)
            {
               _loc6_ = new Goods(param1[_loc5_]);
               _loc6_.count = 0;
            }
            _loc3_.push(_loc6_);
            if(_loc6_.count >= param2[_loc5_])
            {
               _loc4_.push(true);
            }
            else
            {
               _loc4_.push(false);
            }
            _loc5_++;
         }
         this.panel.setShowPanel(1,100,param2[0],LanResManager.getLanCommonTextWords("龙鳞圣兽（传说）"),LanResManager.getLanCommonTextWords("圣兽"));
         this.panel.setInit(_loc3_,_loc4_);
      }
      
      public function setUpdataItem(param1:int, param2:int, param3:PureMount, param4:int, param5:String) : void
      {
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true,true);
         this.panel.setUpLevelGoods(_loc6_);
         this.panel.setShowPanel(2,param4,param2,param3.name,param5);
         this.panel.setAvater(param3.mountAttributeInfo.superMountType,param5);
      }
      
      public function superMountZhuanZhiComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,5]);
            this.panel.onClose(null);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RideJiaohuanShenshouPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.addEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,targetCharRidePlaneHandle);
            panel.addEventListener(RideJiaohuanShenshouPanel.SEND_RIDE_ID,targetCharRidePlaneHandle);
            panel.addEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN,targetCharRidePlaneHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RideJiaohuanShenshouPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addedPanel);
            panel.removeEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN,targetCharRidePlaneHandle);
            panel.removeEventListener(RideJiaohuanShenshouPanel.SEND_RIDE_ID,targetCharRidePlaneHandle);
            panel.removeEventListener(RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN,targetCharRidePlaneHandle);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function addedPanel(param1:Event) : void
      {
         this.panel.setInit([null,null,null,null],[false,false,false,false]);
         this.msgSenderProxy.send_50029([GameInstance.mainChar.id,5]);
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
            case RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_JIAOHUANBTN:
               _loc5_ = _loc3_.data as Array;
               this.msgSenderProxy.send_52091({
                  "mid":int(_loc5_[0]),
                  "type":int(_loc5_[1])
               });
               break;
            case RideJiaohuanShenshouPanel.SEND_RIDE_ID:
               this.selectMountID = int(_loc3_.data as String);
               this.msgSenderProxy.send_52093({"mid":this.selectMountID});
               break;
            case RideJiaohuanShenshouPanel.RIDE_JIAOHUANSHENGSHOU_PANEL_UPLEVELBTN:
               this.selectMountID = int(_loc3_.data);
               this.msgSenderProxy.send_52095({"mid":this.selectMountID});
         }
      }
      
      public function setMountList(param1:Array) : void
      {
         var _loc3_:String = null;
         var _loc4_:PureMount = null;
         var _loc2_:XML = <list/>;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc2_.appendChild(<node showlabel={_loc4_.name} level={_loc4_.mountAttributeInfo.lv} label={_loc4_.id} state={_loc4_.fightStatus} quality={_loc4_.mountAttributeInfo.quality}/>);
            if(_loc4_.id == this.selectMountID)
            {
               _loc6_ = _loc5_;
            }
            _loc5_++;
         }
         this.panel.setRideList(_loc2_,_loc6_);
         if(param1.length > 0)
         {
            if(this.selectMountID != 0)
            {
               this.msgSenderProxy.send_52093({"mid":this.selectMountID});
            }
            else
            {
               _loc4_ = param1[0] as PureMount;
               this.msgSenderProxy.send_52093({"mid":_loc4_.id});
            }
         }
         else
         {
            this.panel.setShowPanel(1,100,6000,LanResManager.getLanCommonTextWords("龙鳞圣兽（传说）"),LanResManager.getLanCommonTextWords("圣兽"));
            this.panel.setInit([null,null,null,null],[false,false,false,false]);
         }
      }
      
      private function get mainCharRideFeedPlaneMediator() : Mount_MainCharRideFeedPlaneMediator
      {
         if(!this._mainCharRideFeedPlaneMediator)
         {
            this._mainCharRideFeedPlaneMediator = facade.retrieveMediator(Mount_MainCharRideFeedPlaneMediator.NAME) as Mount_MainCharRideFeedPlaneMediator;
         }
         return this._mainCharRideFeedPlaneMediator;
      }
   }
}

