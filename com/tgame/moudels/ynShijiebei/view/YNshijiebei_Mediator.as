package com.tgame.moudels.ynShijiebei.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynShijiebei.YNshijiebei_ApplicationFacade;
   import com.tgame.moudels.ynShijiebei.model.YNshijiebei_MsgSendProxy;
   import com.tgame.shell.view.components.YNShijiebeiRankPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNshijiebei_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNshijiebei_Mediator";
      
      private var currentPage:int = 1;
      
      private var _senderProxy:YNshijiebei_MsgSendProxy;
      
      public function YNshijiebei_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNshijiebei_ApplicationFacade.REQUEST_YUENANSHIJIEBEIRANK_PANEL,YNshijiebei_ApplicationFacade.NPC_REQ_FUNCTION,YNshijiebei_ApplicationFacade.YN_SHOW_MIKRANK_PANEL];
      }
      
      private function get senderProxy() : YNshijiebei_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNshijiebei_MsgSendProxy.NAME) as YNshijiebei_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case YNshijiebei_ApplicationFacade.REQUEST_YUENANSHIJIEBEIRANK_PANEL:
               this.senderProxy.send_73791(1);
               break;
            case YNshijiebei_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = int(_loc2_);
               if(_loc3_ == NpcFunctionType.SHIJIEBEI || _loc3_ == NpcFunctionType.YUENAN_ZHONGQIU_SONGCHAPING || _loc3_ == NpcFunctionType.YUENAN_SHANGJIAOLAZHU || _loc3_ == NpcFunctionType.YUENAN_CHRISTMAS_GIFT1 || _loc3_ == NpcFunctionType.YUENAN_CHRISTMAS_GIFT || _loc3_ == NpcFunctionType.YUENAN_TIJIAOMIKZUQIU || _loc3_ == NpcFunctionType.YUENAN_TIJIAOSHIZI || _loc3_ == NpcFunctionType.YUENAN_TIJIAODENGMI || _loc3_ == NpcFunctionType.YUENAN_TIJIAOYUTU)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.yncommitfootballPanel))
                  {
                     GameInstance.uiInstance.yncommitfootballPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yncommitfootballPanel.width / 2;
                     GameInstance.uiInstance.yncommitfootballPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.yncommitfootballPanel.height / 2;
                     GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yncommitfootballPanel);
                  }
                  if(_loc3_ == NpcFunctionType.SHIJIEBEI)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(722202,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(1,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_ZHONGQIU_SONGCHAPING)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(722445,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(2,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.SHIJIEBEI)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(722592,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(3,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_CHRISTMAS_GIFT1)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(722694,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(4,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_CHRISTMAS_GIFT)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(722695,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(5,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_TIJIAOMIKZUQIU)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(723102,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(7,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_TIJIAOSHIZI)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(723103,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(8,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_SHANGJIAOLAZHU)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(723460,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(9,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_TIJIAODENGMI)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(723490,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(10,_loc4_);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_TIJIAOYUTU)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(723694,true);
                     GameInstance.uiInstance.yncommitfootballPanel.setData(11,_loc4_);
                  }
               }
               break;
            case YNshijiebei_ApplicationFacade.YN_SHOW_MIKRANK_PANEL:
               this.senderProxy.send_79443([_loc2_,1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNShijiebeiRankPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynshijiebeiPanel);
         }
         return viewComponent as YNShijiebeiRankPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNShijiebeiRankPanel,function():void
         {
            panel.addEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_JIANGLIPANEL,onHandle);
            panel.addEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_LINGJIANG,onHandle);
            panel.addEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_NEXT,onHandle);
            panel.addEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_PRE,onHandle);
            panel.addEventListener(YNShijiebeiRankPanel.UI_REQUEST_RANK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNShijiebeiRankPanel,function():void
         {
            panel.removeEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_JIANGLIPANEL,onHandle);
            panel.removeEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_LINGJIANG,onHandle);
            panel.removeEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_NEXT,onHandle);
            panel.removeEventListener(YNShijiebeiRankPanel.UI_WORLDCUP_RANK_PRE,onHandle);
            panel.removeEventListener(YNShijiebeiRankPanel.UI_REQUEST_RANK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case YNShijiebeiRankPanel.UI_WORLDCUP_RANK_JIANGLIPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.ynshijiebeijiangliPanel))
               {
                  GameInstance.uiInstance.ynshijiebeijiangliPanel.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
                  GameInstance.uiInstance.ynshijiebeijiangliPanel.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynshijiebeijiangliPanel);
                  GameInstance.uiInstance.ynshijiebeijiangliPanel.setType(int(param1.data));
               }
               break;
            case YNShijiebeiRankPanel.UI_WORLDCUP_RANK_LINGJIANG:
               this.senderProxy.send_79445(int(param1.data));
               break;
            case YNShijiebeiRankPanel.UI_WORLDCUP_RANK_NEXT:
               _loc2_ = param1.data as Array;
               this.senderProxy.send_79443(_loc2_);
               break;
            case YNShijiebeiRankPanel.UI_WORLDCUP_RANK_PRE:
               _loc2_ = param1.data as Array;
               this.senderProxy.send_79443(_loc2_);
               break;
            case YNShijiebeiRankPanel.UI_REQUEST_RANK:
               if(Fun.isVisible(GameInstance.uiInstance.ynshijiebeijiangliPanel))
               {
                  GameInstance.uiInstance.uiContainer.removeChild(GameInstance.uiInstance.ynshijiebeijiangliPanel);
               }
               this.senderProxy.send_79443([int(param1.data),1]);
         }
      }
      
      public function setData(param1:int, param2:int, param3:Array, param4:Boolean) : void
      {
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENANSHIJIEBEIRANK_PANEL);
         }
         this.currentPage = param1;
         var _loc5_:XML = <list/>;
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            _loc7_ = new Object();
            _loc7_ = param3[_loc6_];
            _loc8_ = _loc6_ * param1;
            _loc5_.appendChild(<node type={2} index={_loc7_.index} name={_loc7_.name} count={_loc7_.count}/>);
            _loc6_++;
         }
         this.panel.setData(2,param1,param2);
         this.panel.setList(2,_loc5_);
      }
      
      public function setYDHData(param1:int, param2:int, param3:int, param4:Array, param5:String) : void
      {
         var _loc8_:Object = null;
         var _loc9_:int = 0;
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENANSHIJIEBEIRANK_PANEL);
         }
         this.currentPage = param2;
         var _loc6_:XML = <list/>;
         var _loc7_:int = 0;
         while(_loc7_ < param4.length)
         {
            _loc8_ = new Object();
            _loc8_ = param4[_loc7_];
            _loc9_ = _loc7_ * param2;
            _loc6_.appendChild(<node type={2} index={_loc8_.index} name={_loc8_.name} count={_loc8_.count}/>);
            _loc7_++;
         }
         this.panel.setData(param1,param2,param3,param5);
         this.panel.setList(param1,_loc6_);
      }
   }
}

