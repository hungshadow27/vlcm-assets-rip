package com.tgame.moudels.Item
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.Item.controller.Item_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Item_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.Item.Item_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ITEM_USE:String = "ITEM_USE";
      
      public static const ITEM_USE_SKILLGOODS:String = "ITEM_USE_SKILLGOODS";
      
      public static const ITEM_MOVE:String = "ITEM_MOVE";
      
      public static const MOUSE_ITEM_MOVE:String = "MOUSE_ITEM_MOVE";
      
      public static const SHORT_KEY:String = "SHORT_KEY";
      
      public static const CTRL_SHORT_KEY:String = "CTRL_SHORT_KEY";
      
      public static const UPDATE_MOUNT_BAG:String = "UPDATE_MOUNT_BAG";
      
      public static const UPDATE_MOUNT_DEPOT:String = "UPDATE_MOUNT_DEPOT";
      
      public static const ADD_AND_UPDATE_MOUNT_BAG:String = "ADD_AND_UPDATE_MOUNT_BAG";
      
      public static const UPDATE_MOUNT_SHOP:String = "UPDATE_MOUNT_SHOP";
      
      public static const START_TRADE:String = "START_TRADE";
      
      public static const LOOK_OTHERCHAR_SHOP_PANEL:String = "LOOK_OTHERCHAR_SHOP_PANEL";
      
      public static const SHOW_SEND_FLOWER_PANEL:String = "SHOW_SEND_FLOWER_PANEL";
      
      public static const USE_BAG:String = "USE_BAG";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const EQUIP_QIANGHUA_SUCCESS:String = "EQUIP_QIANGHUA_SUCCESS";
      
      public static const ITEMTIP_CLEAR:String = "ITEMTIP_CLEAR";
      
      public static const UPDATE_ITEM_BAG:String = "UPDATE_ITEM_BAG";
      
      public static const SHOW_MOUNT_ATTR_PANEL:String = "SHOW_MOUNT_ATTR_PANEL";
      
      public static const SHOW_GOODS_PANEL:String = "SHOW_GOODS_PANEL";
      
      public static const UPDATE_MAINCHAR_YUPEI:String = "UPDATE_MAINCHAR_YUPEI";
      
      public static const UI_CHAR_ATTRIBUTE_MENU_SHOW:String = "UI_CHAR_ATTRIBUTE_MENU_SHOW";
      
      public static const SEND_ITEM_USE:String = "SEND_ITEM_USE";
      
      public static const MAINUI_KUAFU_GUIZHE_QUERY:String = "MAINUI_KUAFU_GUIZHE_QUERY";
      
      public static const KUAFU_STATUS:String = "KUAFU_STATUS";
      
      public static const GOODS_CHANGE:String = "GOODS_CHANGE";
      
      public static const SAVE_SHOW_JIAN:String = "SAVE_SHOW_JIAN";
      
      public static const GUIHUN_XUNZHANG:String = "GUIHUN_XUNZHANG";
      
      public function Item_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ITEM,PipeConstants.MOUSE_ITEM_MOVE,PipeConstants.KEY_0,PipeConstants.KEY_1,PipeConstants.KEY_2,PipeConstants.KEY_3,PipeConstants.KEY_4,PipeConstants.KEY_5,PipeConstants.KEY_6,PipeConstants.KEY_7,PipeConstants.KEY_8,PipeConstants.KEY_9,PipeConstants.CTRL_KEY_0,PipeConstants.CTRL_KEY_1,PipeConstants.CTRL_KEY_2,PipeConstants.CTRL_KEY_3,PipeConstants.CTRL_KEY_4,PipeConstants.CTRL_KEY_5,PipeConstants.CTRL_KEY_6,PipeConstants.CTRL_KEY_7,PipeConstants.CTRL_KEY_8,PipeConstants.CTRL_KEY_9,PipeConstants.UPDATE_MOUNT_BAG,PipeConstants.UPDATE_MOUNT_DEPOT,PipeConstants.ADD_AND_UPDATE_MOUNT_BAG,PipeConstants.UPDATE_MOUNT_SHOP,PipeConstants.START_TRADE,PipeConstants.SHOW_SEND_FLOWER_PANEL,PipeConstants.USE_BAG,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,PipeConstants.EQUIP_QIANGHUA_SUCCESS,PipeConstants.ITEMTIP_CLEAR,PipeConstants.ITEM_USE_SKILLGOODS,PipeConstants.UPDATE_ITEM_BAG,PipeConstants.SHOW_MOUNT_ATTR_PANEL,PipeConstants
         .SHOW_GOODS_PANEL,PipeConstants.UPDATE_MAINCHAR_YUPEI,PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,PipeConstants.ITEM_USE,PipeConstants.SEND_ITEM_USE,PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,PipeConstants.KUAFU_STATUS,PipeConstants.GOODS_CHANGED,PipeConstants.SAVE_SHOW_JIAN,PipeConstants.ITEM_MOVE,PipeConstants.GUIHUN_XUNZHANG],this.handlePipeMessage,Item_ApplicationFacade);
      }
      
      public static function getInstance() : Item_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Item_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Item_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Item_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ITEM:
               this.startup();
               break;
            case PipeConstants.MOUSE_ITEM_MOVE:
               sendNotification(MOUSE_ITEM_MOVE);
               break;
            case PipeConstants.KEY_0:
               sendNotification(SHORT_KEY,_loc2_,"0");
               break;
            case PipeConstants.KEY_1:
               sendNotification(SHORT_KEY,_loc2_,"1");
               break;
            case PipeConstants.KEY_2:
               sendNotification(SHORT_KEY,_loc2_,"2");
               break;
            case PipeConstants.KEY_3:
               sendNotification(SHORT_KEY,_loc2_,"3");
               break;
            case PipeConstants.KEY_4:
               sendNotification(SHORT_KEY,_loc2_,"4");
               break;
            case PipeConstants.KEY_5:
               sendNotification(SHORT_KEY,_loc2_,"5");
               break;
            case PipeConstants.KEY_6:
               sendNotification(SHORT_KEY,_loc2_,"6");
               break;
            case PipeConstants.KEY_7:
               sendNotification(SHORT_KEY,_loc2_,"7");
               break;
            case PipeConstants.KEY_8:
               sendNotification(SHORT_KEY,_loc2_,"8");
               break;
            case PipeConstants.KEY_9:
               sendNotification(SHORT_KEY,_loc2_,"9");
               break;
            case PipeConstants.CTRL_KEY_1:
               sendNotification(CTRL_SHORT_KEY,_loc2_,ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x.toString());
               break;
            case PipeConstants.CTRL_KEY_2:
               sendNotification(CTRL_SHORT_KEY,_loc2_,(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x + 1).toString());
               break;
            case PipeConstants.CTRL_KEY_3:
               sendNotification(CTRL_SHORT_KEY,_loc2_,(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x + 2).toString());
               break;
            case PipeConstants.CTRL_KEY_4:
               sendNotification(CTRL_SHORT_KEY,_loc2_,(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x + 3).toString());
               break;
            case PipeConstants.CTRL_KEY_5:
               sendNotification(CTRL_SHORT_KEY,_loc2_,(ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x + 4).toString());
               break;
            case PipeConstants.UPDATE_MOUNT_BAG:
               sendNotification(UPDATE_MOUNT_BAG);
               break;
            case PipeConstants.UPDATE_MOUNT_DEPOT:
               sendNotification(UPDATE_MOUNT_DEPOT);
               break;
            case PipeConstants.ADD_AND_UPDATE_MOUNT_BAG:
               sendNotification(ADD_AND_UPDATE_MOUNT_BAG);
               break;
            case PipeConstants.UPDATE_MOUNT_SHOP:
               sendNotification(UPDATE_MOUNT_SHOP);
               break;
            case PipeConstants.START_TRADE:
               sendNotification(START_TRADE,_loc2_);
               break;
            case PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL:
               sendNotification(LOOK_OTHERCHAR_SHOP_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SEND_FLOWER_PANEL:
               sendNotification(SHOW_SEND_FLOWER_PANEL,_loc2_);
               break;
            case PipeConstants.USE_BAG:
               sendNotification(USE_BAG,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.EQUIP_QIANGHUA_SUCCESS:
               sendNotification(EQUIP_QIANGHUA_SUCCESS,_loc2_);
               break;
            case PipeConstants.ITEMTIP_CLEAR:
               sendNotification(ITEMTIP_CLEAR,_loc2_);
               break;
            case PipeConstants.ITEM_USE_SKILLGOODS:
               sendNotification(ITEM_USE_SKILLGOODS,_loc2_);
               break;
            case PipeConstants.UPDATE_ITEM_BAG:
               sendNotification(UPDATE_ITEM_BAG,_loc2_);
               break;
            case PipeConstants.SHOW_MOUNT_ATTR_PANEL:
               sendNotification(SHOW_MOUNT_ATTR_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.UPDATE_MAINCHAR_YUPEI:
               sendNotification(UPDATE_MAINCHAR_YUPEI,_loc2_);
               break;
            case PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW:
               sendNotification(UI_CHAR_ATTRIBUTE_MENU_SHOW,_loc2_);
               break;
            case PipeConstants.ITEM_USE:
               sendNotification(ITEM_USE,_loc2_);
               break;
            case PipeConstants.SEND_ITEM_USE:
               sendNotification(SEND_ITEM_USE,_loc2_);
               break;
            case PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY:
               sendNotification(MAINUI_KUAFU_GUIZHE_QUERY,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               sendNotification(KUAFU_STATUS,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGE);
               break;
            case PipeConstants.SAVE_SHOW_JIAN:
               sendNotification(SAVE_SHOW_JIAN,_loc2_);
               break;
            case PipeConstants.ITEM_MOVE:
               sendNotification(ITEM_MOVE,_loc2_);
               break;
            case PipeConstants.GUIHUN_XUNZHANG:
               sendNotification(GUIHUN_XUNZHANG,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

