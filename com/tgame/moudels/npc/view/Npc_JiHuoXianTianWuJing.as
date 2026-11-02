package com.tgame.moudels.npc.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.npc.Npc_ApplicationFacade;
   import com.tgame.moudels.npc.model.Npc_MsgSenderProxy;
   import com.tgame.shell.view.components.attribute.XiantianWujingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Npc_JiHuoXianTianWuJing extends Mediator
   {
      
      public static const NAME:String = "Npc_JiHuoXianTianWuJing";
      
      private var _sender:Npc_MsgSenderProxy;
      
      public function Npc_JiHuoXianTianWuJing()
      {
         super(NAME);
      }
      
      protected function get panel() : XiantianWujingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xianTianWuJingPanel);
         }
         return viewComponent as XiantianWujingPanel;
      }
      
      public function get sender() : Npc_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Npc_MsgSenderProxy.NAME) as Npc_MsgSenderProxy;
         }
         return this._sender;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Npc_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Npc_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = Number(_loc2_);
               if(_loc3_ != NpcFunctionType.XIAN_TIAN_WU_JING)
               {
                  return;
               }
               if(!Fun.isVisible(GameInstance.uiInstance._xianTianWuJingPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_XIAN_TIAN_WU_JING);
               }
         }
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XiantianWujingPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,mainUIHandle);
            panel.addEventListener(XiantianWujingPanel.UI_XIANTIANWUJING_JIHUO_CLICK,mainUIHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XiantianWujingPanel,function():void
         {
            panel.removeEventListener(XiantianWujingPanel.UI_XIANTIANWUJING_JIHUO_CLICK,mainUIHandle);
         });
      }
      
      private function mainUIHandle(param1:Event = null) : void
      {
         var goods:Goods = null;
         var bodyArr:Array = null;
         var booArr:Array = null;
         var e:Event = param1;
         var type:String = e.type;
         var baseE:BaseEvent = e as BaseEvent;
         switch(type)
         {
            case Event.ADDED_TO_STAGE:
               goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.YANGTIANSHI_ID,true);
               this.panel.setGoods(goods);
               bodyArr = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
               booArr = ExchangePositionManager.getEquipStatus(bodyArr,function():void
               {
               },function():void
               {
               },function():void
               {
               });
               if(booArr.length == 0)
               {
                  this.panel.setInitialize(0,2000,false,100,GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1 ? true : false);
               }
               else
               {
                  this.panel.setInitialize(booArr[4][1],2000,booArr[4][0],100,GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1 ? true : false);
               }
               break;
            case XiantianWujingPanel.UI_XIANTIANWUJING_JIHUO_CLICK:
               this.sender.send_53701();
               PipeManager.sendMsg(PipeConstants.SHOW_XIAN_TIAN_WU_JING);
         }
      }
   }
}

