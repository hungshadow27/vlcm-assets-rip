package com.tgame.moudels.qinggongyan.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qinggongyan.QingGongYan_ApplicationFacade;
   import com.tgame.moudels.qinggongyan.model.QingGongYan_MsgSenderProxy;
   import com.tgame.shell.view.components.QingGongYanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingGongYan_PanelMediator extends Mediator
   {
      
      public static const NAME:String = "QingGongYan_PanelMediator";
      
      private var _id:int = 0;
      
      private var _name:String;
      
      private var _num:int;
      
      private var _exp:int;
      
      private var _qinggongyan_SenderProxy:QingGongYan_MsgSenderProxy;
      
      public function QingGongYan_PanelMediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [QingGongYan_ApplicationFacade.QINGGONGYAN_CHI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var onWalkArrived:Function;
         var targetSc:SceneCharacter = null;
         var range:int = 0;
         var callBack:MoveCallBack = null;
         var notification:INotification = param1;
         switch(notification.getName())
         {
            case QingGongYan_ApplicationFacade.QINGGONGYAN_CHI:
               if(FightManager.isMainCharCanMove())
               {
                  onWalkArrived = function(param1:SceneCharacter, param2:MapTile):void
                  {
                     var _loc3_:int = _id;
                     var _loc4_:Object = {"tableID":_loc3_};
                     msg_sender.send_55501(_loc4_);
                  };
                  targetSc = notification.getBody() as SceneCharacter;
                  this._id = targetSc.id;
                  range = 175;
                  callBack = new MoveCallBack();
                  callBack.onMoveArrived = onWalkArrived;
                  MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + targetSc.tile_x + "," + targetSc.tile_y + "," + range,false,callBack);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get qinggongyanPanel() : QingGongYanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.qinggongyanPanel);
         }
         return viewComponent as QingGongYanPanel;
      }
      
      public function get msg_sender() : QingGongYan_MsgSenderProxy
      {
         if(this._qinggongyan_SenderProxy == null)
         {
            this._qinggongyan_SenderProxy = facade.retrieveProxy(QingGongYan_MsgSenderProxy.NAME) as QingGongYan_MsgSenderProxy;
         }
         return this._qinggongyan_SenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(QingGongYanPanel,function():void
         {
            qinggongyanPanel.addEventListener(QingGongYanPanel.UI_OPEN_SHANGCHENG,onOpenShangCheng);
            qinggongyanPanel.addEventListener(QingGongYanPanel.UI_QINGGONGYAN_START,onQingGongYanStart);
         });
         UIEventsRegisterManager.addUIRemovedEvent(QingGongYanPanel,function():void
         {
            qinggongyanPanel.removeEventListener(QingGongYanPanel.UI_OPEN_SHANGCHENG,onOpenShangCheng);
            qinggongyanPanel.removeEventListener(QingGongYanPanel.UI_QINGGONGYAN_START,onQingGongYanStart);
         });
      }
      
      private function onOpenShangCheng(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MALL_PLANE);
      }
      
      private function onQingGongYanStart(param1:BaseEvent) : void
      {
         var _loc2_:Object = {"tableID":this._id};
         this.msg_sender.send_55503(_loc2_);
      }
      
      public function setQingGongYanData(param1:int, param2:String, param3:int, param4:int) : void
      {
         this._id = param1;
         this._name = param2;
         this._num = param3;
         this._exp = param4;
         this.qinggongyanPanel.setPlayerName(param2);
         this.qinggongyanPanel.setShengyuFenshu(param3);
         this.qinggongyanPanel.setJingYan(param4);
      }
      
      public function showQingGongYanPanel() : void
      {
         if(!Fun.isVisible(this.qinggongyanPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.qinggongyanPanel);
            this.qinggongyanPanel.x = GameConfig.sceneWidth / 2 - this.qinggongyanPanel.width / 2;
            this.qinggongyanPanel.y = GameConfig.sceneHeight / 2 - this.qinggongyanPanel.height / 2;
         }
      }
   }
}

