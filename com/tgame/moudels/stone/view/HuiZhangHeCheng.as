package com.tgame.moudels.stone.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.stone.Stone_ApplicationFacade;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.moudels.zhanWenKeHua.view.ZhanWenKeHua_Mediator;
   import com.tgame.shell.view.components.HuizhangDazaoHechengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuiZhangHeCheng extends Mediator
   {
      
      public static var loaderBuff:LoadBuffer;
      
      public static const NAME:String = "HuiZhangHeCheng";
      
      private var daZaoShi:Goods;
      
      private var huiZhang:Goods;
      
      private var panelType:String;
      
      private var isAddBand:Boolean = false;
      
      private var _sendMsg:Stone_MsgSendProxy;
      
      public function HuiZhangHeCheng(param1:String = null, param2:String = null)
      {
         super(NAME);
      }
      
      protected function get panel() : HuizhangDazaoHechengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huizhangDazaoHechengPanel);
         }
         return viewComponent as HuizhangDazaoHechengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Stone_ApplicationFacade.NEW_ITEM_TO_BACKPACK,Stone_ApplicationFacade.SYNTHESIZE_NOT_ITEM,Stone_ApplicationFacade.EXPENDGAS_AND_PROBABILITY,Stone_ApplicationFacade.CLOSE_STONE_LOAD_BUFF,Stone_ApplicationFacade.SHOW_HUIZHANG_PANEL,Stone_ApplicationFacade.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Goods = null;
         var _loc5_:Goods = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Stone_ApplicationFacade.EXPENDGAS_AND_PROBABILITY:
               if(_loc2_.type == 20 && this.panelType == HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW)
               {
                  _loc4_ = _loc2_.nextLevelItem;
                  if(_loc4_.id == 0)
                  {
                     this.removeLoaderBuff();
                     this.panel.setStone();
                  }
                  else
                  {
                     this.panel.setStone(this.daZaoShi,_loc2_.nextLevelItem);
                     if(this.daZaoShi.bind)
                     {
                        _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.daZaoShi.id,true,true,2);
                     }
                     else
                     {
                        _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.daZaoShi.id,true,true,1);
                     }
                     _loc6_ = this.daZaoShi.bind == 0 ? LanResManager.getLanCommonTextWords("背包中同类型的绑定打造石参与合成") : LanResManager.getLanCommonTextWords("背包中同类型非绑定打造石参与合成");
                     this.panel.setBingStone(_loc5_,_loc6_,this.daZaoShi.bind == 0 ? true : false,this.isAddBand);
                  }
               }
               if(_loc2_.type == 21 && this.panelType == HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW)
               {
                  if(_loc2_.nextLevelItem.id == 0)
                  {
                     this.removeLoaderBuff();
                     this.panel.setStone_Huizhang();
                     this.panel.setResult_Huizhang([]);
                  }
                  else
                  {
                     this.panel.setStone_Huizhang(this.huiZhang,_loc2_.nextLevelItem);
                     this.panel.setResult_Huizhang([_loc2_.dazaoshi]);
                  }
               }
            case Stone_ApplicationFacade.CLOSE_STONE_LOAD_BUFF:
               this.removeLoaderBuff();
               break;
            case Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               _loc3_ = _loc2_ as Array;
               _loc7_ = 0;
               while(_loc7_ < _loc3_.length)
               {
                  if(this.huiZhang)
                  {
                     if(_loc3_[_loc7_] == this.huiZhang.position)
                     {
                        if(Fun.isVisible(this.panel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  if(this.daZaoShi)
                  {
                     if(_loc3_[_loc7_] == this.daZaoShi.position)
                     {
                        if(Fun.isVisible(this.panel))
                        {
                           PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
                        }
                        this.panelClose(null,true);
                        return;
                     }
                  }
                  _loc7_++;
               }
               break;
            case Stone_ApplicationFacade.SYNTHESIZE_NOT_ITEM:
               if(_loc2_.type != 11)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(ZhanWenKeHua_Mediator,"该物品不能合成"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(ZhanWenKeHua_Mediator,"该物品不能合成"),false);
               }
         }
      }
      
      public function heChengComplete(param1:int, param2:int, param3:int, param4:Array = null) : void
      {
         var _loc5_:Goods = null;
         if(param2 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param2 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.removeLoaderBuff();
         if(!Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
         {
            this.panelClose();
            return;
         }
         if(param1 == 1 && this.panelType == HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW && Boolean(this.daZaoShi))
         {
            this.panel.setResult(param4);
            _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param3);
            if((Boolean(_loc5_)) && _loc5_.count > 0)
            {
               _loc5_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param3);
               this.itemToPanel(null,_loc5_);
            }
            else
            {
               this.daZaoShi = null;
               this.panel.setStone();
            }
         }
         if(param1 == 2 && this.panelType == HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW && Boolean(this.huiZhang))
         {
            this.panel.setStone_Huizhang();
            this.panel.setResult_Huizhang([]);
         }
      }
      
      public function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         loaderBuff = LoadBuffer.show(this.panel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(loaderBuff)
         {
            loaderBuff.close();
         }
         loaderBuff = null;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuizhangDazaoHechengPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START_HUIZHANG,mainCharEquipPuddingHandle);
            panel.addEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE,mainCharEquipPuddingHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuizhangDazaoHechengPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START_HUIZHANG,mainCharEquipPuddingHandle);
            panel.removeEventListener(HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE,mainCharEquipPuddingHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null, param2:Boolean = false) : void
      {
         if(Boolean(loaderBuff) && !param2)
         {
            return;
         }
         this.replay();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.panelType = "";
         if(param2)
         {
            this.removeLoaderBuff();
         }
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc4_:int = 0;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
               break;
            case HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW:
               this.panelClose();
               this.panelType = HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW;
               this.panel.showDazaoshi();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE:
               this.getDaZaoShi();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE:
               this.panel.setResult([]);
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START:
               if(!this.daZaoShi)
               {
                  return;
               }
               this.sendMsg.send_53543({
                  "index":this.daZaoShi.position,
                  "type":1,
                  "isBind":this.isAddBand
               });
               this.addLoadBuffer();
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("打造石合成中");
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_USE_BIND_STONE:
               this.isAddBand = _loc2_.data as Boolean;
               break;
            case HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW:
               this.panelClose();
               this.panelType = HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW;
               this.panel.showHuizhang();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_GET_STONE_HUIZHANG:
               this.getHuiZhang();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_PUT_STONE_HUIZHANG:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case HuizhangDazaoHechengPanel.UI_STONE_PANEL_MAKE_START_HUIZHANG:
               if(!this.huiZhang)
               {
                  return;
               }
               this.sendMsg.send_53543({
                  "index":this.huiZhang.position,
                  "type":2
               });
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("徽章合成中");
               this.addLoadBuffer();
         }
      }
      
      private function getDaZaoShi() : void
      {
         this.daZaoShi = null;
         this.replay();
         this.panel.reset();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
      }
      
      private function getHuiZhang() : void
      {
         this.huiZhang = null;
         this.replay();
         this.panel.reset_Huizhang();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         var _loc4_:Boolean = true;
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
         }
         PipeManager.sendMsg(PipeConstants.USE_BAG,0);
         if(this.panelType == HuizhangDazaoHechengPanel.UI_DAZAOSHIHECHENG_SHOW)
         {
            this.daZaoShi = param2;
            _loc3_.type = 20;
         }
         if(this.panelType == HuizhangDazaoHechengPanel.UI_HUIZHANGHECHENG_SHOW)
         {
            this.huiZhang = param2;
            _loc3_.type = 21;
         }
         _loc3_.XY = param2.position;
         _loc3_.ID = param2.id;
         this.sendMsg.send_50125(_loc3_);
         this.mouseToNormal();
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function replay() : void
      {
         this.panel.setBingStone(null,"",true,this.isAddBand = false);
         this.daZaoShi = null;
         this.huiZhang = null;
      }
      
      private function get sendMsg() : Stone_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Stone_MsgSendProxy.NAME) as Stone_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

