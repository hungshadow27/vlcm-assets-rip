package com.tgame.moudels.Item.controller
{
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgReceivedProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.moudels.Item.view.Item_BackpackMediator;
   import com.tgame.moudels.Item.view.Item_DepotMediator;
   import com.tgame.moudels.Item.view.Item_ItemChangeMediator;
   import com.tgame.moudels.Item.view.Item_KuaFuBagMediator;
   import com.tgame.moudels.Item.view.Item_MainCharAttrMediator;
   import com.tgame.moudels.Item.view.Item_MainCharMeirenMediator;
   import com.tgame.moudels.Item.view.Item_MainCharRideAttrMediator;
   import com.tgame.moudels.Item.view.Item_MainCharShopListMediator;
   import com.tgame.moudels.Item.view.Item_MainCharShopMediator;
   import com.tgame.moudels.Item.view.Item_NPCShopMediator;
   import com.tgame.moudels.Item.view.Item_RepairMediator;
   import com.tgame.moudels.Item.view.Item_RideAttrMediator;
   import com.tgame.moudels.Item.view.Item_RideDepotMediator;
   import com.tgame.moudels.Item.view.Item_SendFlowerMediator;
   import com.tgame.moudels.Item.view.Item_ShortBarMediator;
   import com.tgame.moudels.Item.view.Item_TradeMediator;
   import com.tgame.moudels.Item.view.Item_ZhanhundaiMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Item_StartupCommand extends SimpleCommand
   {
      
      public function Item_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Item_MsgReceivedProxy());
         facade.registerProxy(new Item_MsgSenderProxy());
         facade.registerProxy(new Item_ItemProxy());
         facade.registerProxy(new Item_TipProxy());
         facade.registerCommand(Item_ApplicationFacade.SEND_ITEM_USE,Item_SendItemUseCommand);
         facade.registerCommand(Item_ApplicationFacade.ITEM_USE,Item_ItemUseCommand);
         facade.registerCommand(Item_ApplicationFacade.ITEM_USE_SKILLGOODS,Item_ItemUse2Command);
         facade.registerCommand(Item_ApplicationFacade.ITEM_MOVE,Item_ItemMoveCommand);
         facade.registerMediator(new Item_BackpackMediator());
         facade.registerMediator(new Item_ShortBarMediator());
         facade.registerMediator(new Item_DepotMediator());
         facade.registerMediator(new Item_MainCharAttrMediator());
         facade.registerMediator(new Item_MainCharShopMediator());
         facade.registerMediator(new Item_RideDepotMediator());
         facade.registerMediator(new Item_MainCharShopListMediator());
         facade.registerMediator(new Item_TradeMediator());
         facade.registerMediator(new Item_NPCShopMediator());
         facade.registerMediator(new Item_RideAttrMediator());
         facade.registerMediator(new Item_MainCharRideAttrMediator());
         facade.registerMediator(new Item_SendFlowerMediator());
         facade.registerMediator(new Item_RepairMediator());
         facade.registerMediator(new Item_KuaFuBagMediator());
         facade.registerMediator(new Item_ItemChangeMediator());
         facade.registerMediator(new Item_ZhanhundaiMediator());
         facade.registerMediator(new Item_MainCharMeirenMediator());
         TCursorManager.init();
      }
   }
}

