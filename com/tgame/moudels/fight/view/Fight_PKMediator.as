package com.tgame.moudels.fight.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.moudels.fight.model.Fight_MsgSenderProxy;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fight_PKMediator extends Mediator
   {
      
      public static const NAME:String = "Fight_PKMediator";
      
      private var _fightProxy:Fight_proxy;
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      public function Fight_PKMediator()
      {
         super(NAME);
      }
      
      private function get fightProxy() : Fight_proxy
      {
         if(this._fightProxy == null)
         {
            this._fightProxy = facade.retrieveProxy(Fight_proxy.NAME) as Fight_proxy;
         }
         return this._fightProxy;
      }
      
      public function get senderProxy() : Fight_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fight_MsgSenderProxy.NAME) as Fight_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainUI() : MainUI
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mainUI);
         }
         return viewComponent as MainUI;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            mainUI.addEventListener(MainUI.MAINUI_PK_MODEL_CHANGE,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            mainUI.addEventListener(MainUI.MAINUI_PK_MODEL_CHANGE,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fight_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_RELIVE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Fight_ApplicationFacade.SEND_SHENGXIAOTIAOZHAN_RELIVE:
               if(int(_loc2_) == 1)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
                  {
                     GameInstance.uiInstance.shengxiaoRightSpr.onclose();
                     GameInstance.uiInstance.mainUI.setTrackVisible(true);
                     GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
                  }
               }
               this.senderProxy.send_20075(_loc2_);
         }
      }
      
      private function handle(param1:*) : void
      {
         switch(param1.type)
         {
            case MainUI.MAINUI_PK_MODEL_CHANGE:
               this.senderProxy.send_10901(param1.data);
         }
      }
      
      public function switchPKMode(param1:int) : void
      {
         this.mainUI.setCharMode(param1);
         if(GameInstance.mainCharData.attributeInfo.pkMode == param1)
         {
            return;
         }
         GameInstance.mainCharData.attributeInfo.pkMode = param1;
         switch(param1)
         {
            case OtherConst.pkModeArr[0]:
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经切换到和平模式"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经切换到和平模式"),false);
               break;
            case OtherConst.pkModeArr[1]:
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经切换到组队PK模式"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经切换到组队PK模式"),false);
               break;
            case OtherConst.pkModeArr[2]:
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经切换到帮会PK模式"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经切换到帮会PK模式"),false);
               break;
            case OtherConst.pkModeArr[3]:
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您已经切换到全体PK模式"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您已经切换到全体PK模式"),false);
         }
      }
      
      public function showPK(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param2,SceneCharacterType.PLAYER);
         if(!_loc3_)
         {
            return;
         }
         if(param1 == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"您对玩家发起了强制攻击",[_loc3_.name]),false);
         }
         else if(param1 == 2)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"您受到了玩家的强制攻击",[_loc3_.name]),false);
         }
      }
   }
}

