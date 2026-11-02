package com.tgame.moudels.gift.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.gift.model.GIFT_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.XianshiLingquPanel;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Gift_OpenSelectGoodsCommand extends SimpleCommand
   {
      
      public function Gift_OpenSelectGoodsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var goodsPanel:XianshiLingquPanel;
         var fromGoodsID:int = 0;
         var toGoodsID:int = 0;
         var time:int = 0;
         var $note:INotification = param1;
         fromGoodsID = Number($note.getBody());
         switch(fromGoodsID)
         {
            case 9146:
               toGoodsID = 1222;
               time = 10;
         }
         goodsPanel = new XianshiLingquPanel(new Goods(toGoodsID),time);
         goodsPanel.addEventListener(XianshiLingquPanel.UI_XIANSHILINGQU_OK,function(param1:BaseEvent):void
         {
            var _loc2_:GIFT_MsgSenderProxy = facade.retrieveProxy(GIFT_MsgSenderProxy.NAME) as GIFT_MsgSenderProxy;
            _loc2_.send_53055([fromGoodsID,toGoodsID]);
         });
         goodsPanel.x = GameInstance.stage.stageWidth / 2 - goodsPanel.panelWidth / 2;
         goodsPanel.y = GameInstance.stage.stageHeight / 2 - goodsPanel.panelHeight / 2;
         GameInstance.uiInstance.uiContainer.addChild(goodsPanel);
      }
   }
}

