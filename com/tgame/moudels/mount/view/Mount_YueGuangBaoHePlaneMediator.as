package com.tgame.moudels.mount.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.ride.YueGuangBaoHePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_YueGuangBaoHePlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_YueGuangBaoHePlaneMediator";
      
      private var _selectMountID:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var mountArr:Array = [];
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_YueGuangBaoHePlaneMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : YueGuangBaoHePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yueGuangBaoHePanel);
         }
         return viewComponent as YueGuangBaoHePanel;
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
         return [Mount_ApplicationFacade.SHOW_YUEGUANGBAOHE_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.SHOW_YUEGUANGBAOHE_PANEL:
               this.msgSenderProxy.send_60681();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YueGuangBaoHePanel,function():void
         {
            panel.addEventListener(YueGuangBaoHePanel.UI_RIDE_CHONGXINNIEPAN,uiHandle);
            panel.addEventListener(YueGuangBaoHePanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YueGuangBaoHePanel,function():void
         {
            panel.removeEventListener(YueGuangBaoHePanel.UI_RIDE_CHONGXINNIEPAN,uiHandle);
            panel.removeEventListener(YueGuangBaoHePanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
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
               break;
            case YueGuangBaoHePanel.UI_RIDE_CHONGXINNIEPAN:
               this._selectMountID = int(Number(_loc3_.data));
               this.msgSenderProxy.send_60683(this._selectMountID);
               break;
            case YueGuangBaoHePanel.UI_RIDE_MOUNT_SETLECT:
               this.showRide(_loc3_.data as int);
         }
      }
      
      public function showRide(param1:int) : void
      {
         var _loc2_:PureMount = null;
         for each(_loc2_ in this.mountArr)
         {
            if(param1 == _loc2_.id)
            {
               this.setRideInfo(_loc2_);
               return;
            }
         }
      }
      
      public function setRideList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:PureMount = null;
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         this.mountArr = param3;
         var _loc4_:XML = <list/>;
         _loc5_ = param2 + "/" + param1;
         for each(_loc6_ in param3)
         {
            _loc4_.appendChild(<node showlabel={_loc6_.name} level={_loc6_.mountAttributeInfo.lv} label={_loc6_.id} state={_loc6_.fightStatus} quality={_loc6_.mountAttributeInfo.quality}/>);
         }
         this.panel.setRidelist(_loc4_,_loc5_);
         if(param2 > 0)
         {
            this.setRideInfo(param3[0]);
         }
      }
      
      public function setRideInfo(param1:PureMount) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            return;
         }
         var _loc2_:MountAttributeInfo = param1.mountAttributeInfo;
         this.panel.setRide(param1.name,_loc2_.lv);
         this.setAvatar(param1);
      }
      
      public function setResult(param1:Boolean, param2:int) : void
      {
         this.panel.parent.removeChild(this.panel);
         this.msgSenderProxy.send_50011([param2,11]);
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

