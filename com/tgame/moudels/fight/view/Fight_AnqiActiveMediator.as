package com.tgame.moudels.fight.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.anqi.AnQiRes;
   import com.tgame.common.res.anqi.AnqiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.moudels.fight.model.Fight_MsgSenderProxy;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.shell.view.components.attribute.AnqiActivation;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fight_AnqiActiveMediator extends Mediator
   {
      
      public static const NAME:String = "Fight_AnqiActiveMediator";
      
      private var _fightProxy:Fight_proxy;
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      public function Fight_AnqiActiveMediator()
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
      
      protected function get anqiActivePanel() : AnqiActivation
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.anqiActivePanel);
         }
         return viewComponent as AnqiActivation;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AnqiActivation,function():void
         {
            anqiActivePanel.addEventListener(AnqiActivation.UI_ANQIACTIVATION_KAIQI_CLICK,handle);
            anqiActivePanel.addEventListener(AnqiActivation.UI_ANQIACTIVATIONHUODONG_YOUHUIKAIQI_CLICK,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AnqiActivation,function():void
         {
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fight_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:AnQiRes = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Goods = null;
         var _loc7_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Fight_ApplicationFacade.NPC_REQ_FUNCTION:
               if(_loc2_ == NpcFunctionType.SHENDIAOXIALV_START)
               {
                  this.senderProxy.send_61031(1);
               }
               else
               {
                  if(_loc2_ != NpcFunctionType.JIHUO_ANQI_YINCANG)
                  {
                     return;
                  }
                  if(GameInstance.mainCharData.anqiInfo.isActiveAnqi == 1)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的暗器隐藏属性已经激活"),false);
                     return;
                  }
                  _loc3_ = AnqiResManager.getAnQiRes(25);
                  _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.ANQI_LIANXI_MUBA,true);
                  _loc5_ = _loc4_ >= 1000 ? true : false;
                  this.anqiActivePanel.setInitialize([_loc3_.getBigICOPath(),_loc3_.name,LanResManager.getLanTextWords(this,"人物攻击力1000"),LanResManager.getLanTextWords(this,"暗器练习木耙1000个"),"100%",_loc5_]);
                  PipeManager.sendMsg(PipeConstants.SHOW_ANQI_ACTIVE);
                  if(GameState.gongneng111)
                  {
                     _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ANLINGSHI,true);
                     _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ANQI_LIANXI_MUBA,true);
                     this.anqiActivePanel.showAnqiActivationHuodong(_loc6_,_loc6_.count,_loc7_,_loc7_.count);
                  }
               }
         }
      }
      
      private function handle(param1:*) : void
      {
         switch(param1.type)
         {
            case AnqiActivation.UI_ANQIACTIVATION_KAIQI_CLICK:
               this.senderProxy.send_52019(0);
               break;
            case AnqiActivation.UI_ANQIACTIVATIONHUODONG_YOUHUIKAIQI_CLICK:
               this.senderProxy.send_52019(1);
         }
      }
      
      public function close() : void
      {
         this.anqiActivePanel.onClose();
      }
   }
}

