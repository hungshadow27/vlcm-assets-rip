package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.ride.FengLeiShouPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_FengLeiShouPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_FengLeiShouPlaneMediator";
      
      private var _selectMountID:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      private var fengLeiData:Array;
      
      public function Mount_FengLeiShouPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : FengLeiShouPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fengLeiShouPanel);
         }
         return viewComponent as FengLeiShouPanel;
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
         return [Mount_ApplicationFacade.SHOW_FENGLEISHOU_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.SHOW_FENGLEISHOU_PANEL:
               this.msgSenderProxy.send_74101();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FengLeiShouPanel,function():void
         {
            panel.addEventListener(FengLeiShouPanel.UI_RIDE_FENGLEISHOU_DUIHUAN,uiHandle);
            panel.addEventListener(FengLeiShouPanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
            panel.addEventListener(FengLeiShouPanel.UI_NEXT_MOUNT_BTN,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FengLeiShouPanel,function():void
         {
            panel.removeEventListener(FengLeiShouPanel.UI_RIDE_FENGLEISHOU_DUIHUAN,uiHandle);
            panel.removeEventListener(FengLeiShouPanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
            panel.removeEventListener(FengLeiShouPanel.UI_NEXT_MOUNT_BTN,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case FengLeiShouPanel.UI_RIDE_FENGLEISHOU_DUIHUAN:
               this.msgSenderProxy.send_74105(_loc3_.data as Array);
               break;
            case FengLeiShouPanel.UI_RIDE_MOUNT_SETLECT:
               _loc5_ = _loc3_.data as int;
               _loc6_ = 0;
               while(_loc6_ < this.fengLeiData.length)
               {
                  if(_loc5_ == this.fengLeiData[_loc6_].id)
                  {
                     this.panel.setDuiHuanType(_loc6_);
                     this.setPanelData(this.fengLeiData[_loc6_]);
                  }
                  _loc6_++;
               }
               break;
            case FengLeiShouPanel.UI_NEXT_MOUNT_BTN:
               this.panel.setDuiHuanType(_loc3_.data as int);
               this.setPanelData(this.fengLeiData[_loc3_.data as int]);
         }
      }
      
      private function setPanelData(param1:Object) : void
      {
         this.setAvatar(new PureMount(param1.id));
         this.panel.setAddValue(param1.gongJi,param1.fangYu,param1.shengMing,param1.baoJi,param1.shanBi);
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1.goodsId,true);
         this.panel.setGoods(_loc2_.res.name,param1.needNum,_loc2_.count);
      }
      
      public function setRideList(param1:int, param2:Array, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         this.fengLeiData = param3;
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         var _loc4_:XML = <list/>;
         _loc5_ = param1 + "/" + 10;
         for each(_loc6_ in param2)
         {
            _loc4_.appendChild(<node showlabel={_loc6_.name} level={_loc6_.lv} label={_loc6_.id} state={_loc6_.fightStatus} quality={_loc6_.quality} nextId={_loc6_.nextId}/>);
         }
         this.panel.setRidelist(_loc4_,_loc5_);
      }
      
      public function setResult(param1:Boolean) : void
      {
         if(param1 == 1)
         {
            this.panel.parent.removeChild(this.panel);
         }
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
            panel.avatar = param2;
         };
         this.panel.avatar = null;
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
   }
}

