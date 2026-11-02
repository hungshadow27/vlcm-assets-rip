package com.tgame.moudels.Item.controller
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Item_ItemMoveCommand extends SimpleCommand
   {
      
      public function Item_ItemMoveCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var sender:Item_MsgSenderProxy = null;
         var itemFace1:ItemFace = null;
         var itemFace2:ItemFace = null;
         var containerTag:int = 0;
         var arr:Array = null;
         var ar:Array = null;
         var i:int = 0;
         var go:Goods = null;
         var str:String = null;
         var col:String = null;
         var name1:String = null;
         var jingyan1:int = 0;
         var str2:String = null;
         var col2:String = null;
         var name2:String = null;
         var jingyan2:int = 0;
         var $note:INotification = param1;
         sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         var itemArr:Array = $note.getBody() as Array;
         itemFace1 = itemArr[0];
         itemFace2 = itemArr[1];
         var index:int = int(itemArr[2]);
         containerTag = int(itemArr[3]);
         var targetMountID:int = int(itemArr[4]);
         var startMountID:int = int(itemArr[5]);
         if(itemFace1.getBaseItem() != null)
         {
            if(itemFace2 == null)
            {
               if(itemFace1.getBaseItem().position1 != -1)
               {
                  sender.send_10075([itemFace1.getBaseItem().position1,startMountID,index,targetMountID,containerTag]);
               }
               else
               {
                  arr = GameInstance.mainCharData.goodsInfo.YNsbtrArr;
                  ar = [];
                  i = 0;
                  while(i < arr.length)
                  {
                     go = arr[i] as Goods;
                     if(itemFace1.getBaseItem().position == go.res.position)
                     {
                        arr.splice(i,1);
                     }
                     i++;
                  }
                  ar = arr.reverse();
                  GameInstance.mainCharData.goodsInfo.YNsbtrArr = ar;
                  GameInstance.uiInstance.charAttribute.showYNequipselect();
                  sender.send_10075([itemFace1.getBaseItem().position,startMountID,index,targetMountID,containerTag]);
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     if(GameInstance.uiInstance.charAttribute.shibatongrenVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShiBaTongRen();
                     }
                     else if(GameInstance.uiInstance.charAttribute.feilongtanyunshouVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestFeiLong();
                     }
                     else if(GameInstance.uiInstance.charAttribute.dantianVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShowDantianPanel();
                     }
                     else if(GameInstance.uiInstance.charAttribute.YNliulongzhuangbeiVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShowYNliulongzhuangbei();
                     }
                     else if(GameInstance.uiInstance.charAttribute.YNJinfengdiaoVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShowYNJinfengdiao();
                     }
                     else if(GameInstance.uiInstance.charAttribute.jingangfumoquanVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShowJinGangFuMoQuan();
                     }
                     else if(GameInstance.uiInstance.charAttribute.jinzhongzhaoVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestJingZhongZhao();
                     }
                  }
               }
            }
            else if(ItemPositionRange.inZhanhundaiBag(itemFace1.getBaseItem().position))
            {
               if(itemFace1.getBaseItem().position != ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.y && itemFace2.getBaseItem().position != ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.y)
               {
                  if(itemFace1.getBaseItem().position != itemFace2.getBaseItem().position)
                  {
                     str = "";
                     if((itemFace1.getBaseItem() as McBaseItem).quality == 1)
                     {
                        col = StaticValue.HUISE_HTML;
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == 2)
                     {
                        col = StaticValue.WHITE_HTML;
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == 3)
                     {
                        col = StaticValue.BLUE_HTML;
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == 4)
                     {
                        col = StaticValue.GREEN_HTML;
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == 5)
                     {
                        col = StaticValue.PURPLE_HTML;
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == 6)
                     {
                        col = StaticValue.YELLOW_HTML;
                     }
                     name1 = "<font color=\'" + col + "\'>" + (itemFace1.getBaseItem() as McBaseItem).name + "</font>";
                     jingyan1 = (itemFace1.getBaseItem() as McBaseItem).dangqianJingyan + (itemFace1.getBaseItem() as McBaseItem).tunshiJingyan;
                     str2 = "";
                     if(!(itemFace2.getBaseItem() is McBaseItem))
                     {
                        return;
                     }
                     if((itemFace2.getBaseItem() as McBaseItem).quality == 1)
                     {
                        col2 = StaticValue.HUISE_HTML;
                     }
                     else if((itemFace2.getBaseItem() as McBaseItem).quality == 2)
                     {
                        col2 = StaticValue.WHITE_HTML;
                     }
                     else if((itemFace2.getBaseItem() as McBaseItem).quality == 3)
                     {
                        col2 = StaticValue.BLUE_HTML;
                     }
                     else if((itemFace2.getBaseItem() as McBaseItem).quality == 4)
                     {
                        col2 = StaticValue.GREEN_HTML;
                     }
                     else if((itemFace2.getBaseItem() as McBaseItem).quality == 5)
                     {
                        col2 = StaticValue.PURPLE_HTML;
                     }
                     else if((itemFace2.getBaseItem() as McBaseItem).quality == 6)
                     {
                        col2 = StaticValue.YELLOW_HTML;
                     }
                     name2 = "<font color=\'" + col2 + "\'>" + (itemFace2.getBaseItem() as McBaseItem).name + "</font>";
                     jingyan2 = (itemFace2.getBaseItem() as McBaseItem).dangqianJingyan + (itemFace2.getBaseItem() as McBaseItem).tunshiJingyan;
                     if((itemFace1.getBaseItem() as McBaseItem).quality > (itemFace2.getBaseItem() as McBaseItem).quality)
                     {
                        str = "【" + name1 + "】" + LanResManager.getLanCommonTextWords("将吞噬") + "【" + name2 + "】";
                        str += "<br>" + LanResManager.getLanCommonTextWords("获得") + jingyan2 + LanResManager.getLanCommonTextWords("经验");
                     }
                     else if((itemFace1.getBaseItem() as McBaseItem).quality == (itemFace2.getBaseItem() as McBaseItem).quality)
                     {
                        if((itemFace1.getBaseItem() as McBaseItem).dengji >= (itemFace2.getBaseItem() as McBaseItem).dengji)
                        {
                           str = "【" + name1 + "】" + LanResManager.getLanCommonTextWords("将吞噬") + "【" + name2 + "】";
                           str += "<br>" + LanResManager.getLanCommonTextWords("获得") + jingyan2 + LanResManager.getLanCommonTextWords("经验");
                        }
                        else
                        {
                           str = "【" + name2 + "】" + LanResManager.getLanCommonTextWords("将吞噬") + "【" + name1 + "】";
                           str += "<br>" + LanResManager.getLanCommonTextWords("获得") + jingyan1 + LanResManager.getLanCommonTextWords("经验");
                        }
                     }
                     else
                     {
                        str = "【" + name2 + "】" + LanResManager.getLanCommonTextWords("将吞噬") + "【" + name1 + "】";
                        str += "<br>" + LanResManager.getLanCommonTextWords("获得") + jingyan1 + LanResManager.getLanCommonTextWords("经验");
                     }
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                     FAlert.show(str,"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           sender.send_10075([itemFace1.getBaseItem().position,0,itemFace2.getBaseItem().position,0,containerTag]);
                        }
                     });
                  }
               }
               else
               {
                  sender.send_10075([itemFace1.getBaseItem().position,0,itemFace2.getBaseItem().position,0,containerTag]);
               }
            }
            else
            {
               sender.send_10075([itemFace1.getBaseItem().position,0,itemFace2.getBaseItem().position,0,containerTag]);
            }
         }
      }
   }
}

