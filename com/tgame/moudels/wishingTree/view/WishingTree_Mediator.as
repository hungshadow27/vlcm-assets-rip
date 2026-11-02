package com.tgame.moudels.wishingTree.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wishingTree.WishingTree_ApplicationFacade;
   import com.tgame.moudels.wishingTree.model.WishingTree_MsgSenderProxy;
   import com.tgame.shell.view.components.WishingTree;
   import com.tgame.shell.view.components.wishingTree.FriendTreePanel;
   import com.tgame.shell.view.components.wishingTree.PlantWishingTreePanel;
   import com.tgame.shell.view.components.wishingTree.WishingTreeDescPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WishingTree_Mediator extends Mediator
   {
      
      private static var loaderBuff:LoadBuffer;
      
      public static const NAME:String = "WishingTree_Mediator";
      
      private var loaderBufTimer:Timer;
      
      private var fri:FriendTreePanel;
      
      private var plant:PlantWishingTreePanel;
      
      private var treeDesc:WishingTreeDescPanel;
      
      private var _senderProxy:WishingTree_MsgSenderProxy;
      
      public function WishingTree_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : WishingTree_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WishingTree_MsgSenderProxy.NAME) as WishingTree_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get wishingTreePanel() : WishingTree
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wishingTreePanel);
         }
         return viewComponent as WishingTree;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [WishingTree_ApplicationFacade.SHOW_ZHONGXUYUANSHU_PANEL,WishingTree_ApplicationFacade.PLANTWISHINGTREE,WishingTree_ApplicationFacade.XUYUANSHU_WATER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:String = null;
         var _loc4_:SceneCharacter = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WishingTree_ApplicationFacade.SHOW_ZHONGXUYUANSHU_PANEL:
               if(this.plant == null)
               {
                  this.plant = new PlantWishingTreePanel();
               }
               this.plant.$parent = GameInstance.uiInstance.wishingTreePanel;
               this.plant.x = (GameConfig.sceneWidth - this.plant.width) / 2;
               this.plant.y = (GameConfig.sceneHeight - this.plant.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.plant);
               break;
            case WishingTree_ApplicationFacade.PLANTWISHINGTREE:
               _loc3_ = param1.getBody() as String;
               this.senderProxy.send_73043(_loc3_);
               break;
            case WishingTree_ApplicationFacade.XUYUANSHU_WATER:
               _loc4_ = param1.getBody() as SceneCharacter;
               this.senderProxy.send_73033(_loc4_.id);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WishingTree,function():void
         {
            wishingTreePanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_HAOYOUJIAOSHUI_BTN_CLICK,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_JIAOSHUI_BTN_CLICK,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_FRIENDLIST_CLICK,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_XUNZHANG_BTN_CLICK,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_FRIEND_RECORD_BTN_CLICK,handler);
            wishingTreePanel.addEventListener(WishingTree.UI_WISHINGTREECLOSE_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WishingTree,function():void
         {
            wishingTreePanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_HAOYOUJIAOSHUI_BTN_CLICK,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_JIAOSHUI_BTN_CLICK,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_FRIENDLIST_CLICK,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_XUNZHANG_BTN_CLICK,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_FRIEND_RECORD_BTN_CLICK,handler);
            wishingTreePanel.removeEventListener(WishingTree.UI_WISHINGTREECLOSE_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_73031();
               break;
            case WishingTree.UI_HAOYOUJIAOSHUI_BTN_CLICK:
               if(this.fri == null)
               {
                  this.fri = new FriendTreePanel();
               }
               this.fri.$parent = GameInstance.uiInstance.wishingTreePanel;
               this.fri.setparent();
               this.fri.x = (GameConfig.sceneWidth - this.fri.width) / 2;
               this.fri.y = (GameConfig.sceneHeight - this.fri.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.fri);
               ResizeManager.showDoublePanel(this.wishingTreePanel,this.fri);
               this.senderProxy.send_73035();
               break;
            case WishingTree.UI_JIAOSHUI_BTN_CLICK:
               _loc3_ = int(_loc2_.data);
               this.senderProxy.send_73041(_loc3_);
               break;
            case WishingTree.UI_XUNZHANG_BTN_CLICK:
               this.senderProxy.send_73039();
               break;
            case WishingTree.UI_FRIEND_RECORD_BTN_CLICK:
               _loc4_ = int(_loc2_.data);
               if(_loc4_ == 1)
               {
                  this.senderProxy.send_73035();
               }
               else
               {
                  this.senderProxy.send_73037();
               }
               break;
            case WishingTree.UI_FRIENDLIST_CLICK:
               _loc5_ = _loc2_.data as Array;
               this.wishingTreeDesc(_loc5_[0],_loc5_[1]);
               break;
            case WishingTree.UI_WISHINGTREECLOSE_CLICK:
               this.closePanel();
         }
      }
      
      private function closePanel() : void
      {
         if(Fun.isVisible(this.treeDesc))
         {
            GameInstance.uiInstance.uiContainer.removeChild(this.treeDesc);
         }
         if(Fun.isVisible(this.fri))
         {
            GameInstance.uiInstance.uiContainer.removeChild(this.fri);
         }
      }
      
      private function wishingTreeDesc(param1:String, param2:String) : void
      {
         if(this.treeDesc == null)
         {
            this.treeDesc = new WishingTreeDescPanel();
         }
         this.treeDesc.setInit(param1,param2);
         this.treeDesc.x = (GameConfig.sceneWidth - this.treeDesc.width) / 2;
         this.treeDesc.y = (GameConfig.sceneHeight - this.treeDesc.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.treeDesc);
         if(this.fri != null)
         {
            ResizeManager.showDoublePanel(this.fri,this.treeDesc);
         }
      }
      
      public function setinit(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.wishingTreePanel.setInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function gotoTree(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:String = "" + param1 + "," + param2 + "," + param3 + ",0";
         MainCharSeachPathManager.mainCharWalk(_loc5_);
      }
      
      public function initFri(param1:Array) : void
      {
         var _loc2_:Object = new Object();
         var _loc3_:XML = <list/>;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         if(param1.length > 30)
         {
            _loc5_ = 30;
         }
         else
         {
            _loc5_ = int(param1.length);
         }
         _loc4_ = param1.reverse();
         for each(_loc2_ in _loc4_)
         {
            _loc3_.appendChild(<node id={_loc2_.id} name={_loc2_.name} state={_loc2_.state} treeID={_loc2_.treeID} treeX={_loc2_.x} treeY={_loc2_.y} sceneID={_loc2_.sceneID} desc={_loc2_.desc}/>);
         }
         this.fri.setFriInit(_loc3_);
      }
      
      public function initRec(param1:String) : void
      {
         var _loc2_:Array = [];
         if(param1 == "")
         {
            _loc2_ = [];
         }
         else
         {
            _loc2_ = param1.split(";");
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         if(_loc2_.length > 30)
         {
            _loc4_ = 30;
         }
         else
         {
            _loc4_ = int(_loc2_.length);
         }
         _loc3_ = _loc2_.reverse();
         var _loc5_:XML = <list/>;
         var _loc6_:Object = new Object();
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc5_.appendChild(<node name={_loc3_[_loc7_]}/>);
            _loc7_++;
         }
         this.fri.setSecInit(_loc5_);
      }
      
      public function LoadingBar() : void
      {
         var timer:Timer;
         var time:Function = null;
         time = function():void
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您浇水成功！"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("恭喜您浇水成功！"));
         };
         SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("浇水中");
         SmallLoadingBar.showLoading(SynthesizeMsg.SynthesizeSmallLoadingBarMsg,5000);
         timer = new Timer(5500,1);
         timer.start();
         timer.addEventListener(TimerEvent.TIMER,time);
      }
   }
}

