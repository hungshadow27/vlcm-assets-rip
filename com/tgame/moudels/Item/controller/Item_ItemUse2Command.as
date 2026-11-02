package com.tgame.moudels.Item.controller
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Item_ItemUse2Command extends SimpleCommand
   {
      
      public function Item_ItemUse2Command()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var sender:Item_MsgSenderProxy = null;
         var good:Goods = null;
         var bagIndex:int = 0;
         var itemID:int = 0;
         var $note:INotification = param1;
         sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         good = $note.getBody() as Goods;
         bagIndex = good.position;
         itemID = good.id;
         if(SpecialGoodsID.isOpenPanelGoods(good.id))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_GOODS_PANEL,good);
         }
         else if(good.quality >= 4 && good.bind == 0)
         {
            FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):*
            {
               if(param1.eventData == FAlert.OK)
               {
                  sender.send_11201([itemID,bagIndex]);
                  TCursorManager.resumFullMouse();
                  ExchangePositionManager.checkUseDrugSound(good);
               }
            },true);
         }
         else
         {
            sender.send_11201([itemID,bagIndex]);
            TCursorManager.resumFullMouse();
            ExchangePositionManager.checkUseDrugSound(good);
         }
      }
   }
}

