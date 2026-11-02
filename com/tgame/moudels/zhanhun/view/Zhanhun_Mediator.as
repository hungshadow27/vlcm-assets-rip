package com.tgame.moudels.zhanhun.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhanhun.ZhanHun_ApplicationFacade;
   import com.tgame.moudels.zhanhun.model.Zhanhun_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.ZhanHunTiShiCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Zhanhun_Mediator extends Mediator
   {
      
      public static const NAME:String = "Zhanhun_Mediator";
      
      private var stone:McBaseItem;
      
      public var zbId:int;
      
      private var tuodongId:int;
      
      public var xiangqianShuliang:int;
      
      public var tishiCanvas:ZhanHunTiShiCanvas;
      
      private var _senderProxy:Zhanhun_MsgSenderProxy;
      
      public function Zhanhun_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Zhanhun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Zhanhun_MsgSenderProxy.NAME) as Zhanhun_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhanHun_ApplicationFacade.ZHANHUNDAI_SHUANGJI_CHUANDAI,ZhanHun_ApplicationFacade.ZHANHUN_XIEXIA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = 0;
         switch(param1.getName())
         {
            case ZhanHun_ApplicationFacade.ZHANHUNDAI_SHUANGJI_CHUANDAI:
               _loc2_ = param1.getBody() as int;
               this.senderProxy.send_55833([this.zbId,-1,_loc2_]);
               break;
            case ZhanHun_ApplicationFacade.ZHANHUN_XIEXIA:
               this.senderProxy.send_55837(param1.getBody() as Array);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETZHANHUN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUZHANHUN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHUANGBEI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETZHANHUN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUZHANHUN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHUANGBEI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var zhuangbeiId:int = 0;
         var tuoruID1:int = 0;
         var tuoruID2:int = 0;
         var spr:Sprite = null;
         var it:ItemFace = null;
         var itemFace:ItemFace = null;
         var i:int = 0;
         var str:String = null;
         var col:String = null;
         var name1:String = null;
         var jingyan1:int = 0;
         var str2:String = null;
         var col2:String = null;
         var name2:String = null;
         var jingyan2:int = 0;
         var bo:int = 0;
         var i1:int = 0;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case CharAttribute.GETZHANHUN:
               this.senderProxy.send_55831([-1,1]);
               this.showTiShiCanvas();
               break;
            case CharAttribute.UI_QUZHANHUN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_ZHANHUNHUODE);
               break;
            case CharAttribute.UI_ZHUANGBEI_CLICK:
               zhuangbeiId = evt.data as int;
               if(zhuangbeiId != -1)
               {
                  this.senderProxy.send_55831([-1,zhuangbeiId]);
               }
               else
               {
                  this.senderProxy.send_55831([-1,this.zbId]);
               }
               break;
            case CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK:
               tuoruID1 = evt.data as int;
               this.senderProxy.send_55837([this.zbId,tuoruID1,-1]);
               break;
            case CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER:
               tuoruID2 = evt.data[0] as int;
               spr = evt.data[1] as Sprite;
               i = 0;
               while(i < spr.numChildren)
               {
                  if(spr.getChildAt(i) is ItemFace)
                  {
                     it = spr.getChildAt(i) as ItemFace;
                  }
                  i++;
               }
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(!(TCursorManager.currentItemFace.getBaseItem() is McBaseItem))
                  {
                     return;
                  }
                  this.stone = TCursorManager.currentItemFace.getBaseItem() as McBaseItem;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
                  TCursorManager.removeLockOnMouseStatus();
                  TCursorManager.resumMouse();
                  if(this.stone != null && this.stone.position == 0)
                  {
                     this.senderProxy.send_55835([this.zbId,this.tuodongId,tuoruID2]);
                  }
                  else if(it != null && it.getBaseItem() != null)
                  {
                     if(this.stone.position != it.getBaseItem().position)
                     {
                        str = "";
                        if(this.stone.quality == 1)
                        {
                           col = StaticValue.HUISE_HTML;
                        }
                        else if(this.stone.quality == 2)
                        {
                           col = StaticValue.WHITE_HTML;
                        }
                        else if(this.stone.quality == 3)
                        {
                           col = StaticValue.BLUE_HTML;
                        }
                        else if(this.stone.quality == 4)
                        {
                           col = StaticValue.GREEN_HTML;
                        }
                        else if(this.stone.quality == 5)
                        {
                           col = StaticValue.PURPLE_HTML;
                        }
                        else if(this.stone.quality == 6)
                        {
                           col = StaticValue.YELLOW_HTML;
                        }
                        name1 = "<font color=\'" + col + "\'>" + this.stone.name + "</font>";
                        jingyan1 = this.stone.dangqianJingyan + this.stone.tunshiJingyan;
                        str2 = "";
                        if((it.getBaseItem() as McBaseItem).quality == 1)
                        {
                           col2 = StaticValue.HUISE_HTML;
                        }
                        else if((it.getBaseItem() as McBaseItem).quality == 2)
                        {
                           col2 = StaticValue.WHITE_HTML;
                        }
                        else if((it.getBaseItem() as McBaseItem).quality == 3)
                        {
                           col2 = StaticValue.BLUE_HTML;
                        }
                        else if((it.getBaseItem() as McBaseItem).quality == 4)
                        {
                           col2 = StaticValue.GREEN_HTML;
                        }
                        else if((it.getBaseItem() as McBaseItem).quality == 5)
                        {
                           col2 = StaticValue.PURPLE_HTML;
                        }
                        else if((it.getBaseItem() as McBaseItem).quality == 6)
                        {
                           col2 = StaticValue.YELLOW_HTML;
                        }
                        name2 = "<font color=\'" + col2 + "\'>" + (it.getBaseItem() as McBaseItem).name + "</font>";
                        jingyan2 = (it.getBaseItem() as McBaseItem).dangqianJingyan + (it.getBaseItem() as McBaseItem).tunshiJingyan;
                        if(this.stone.quality > (it.getBaseItem() as McBaseItem).quality)
                        {
                           str = "【" + name1 + "】" + LanResManager.getLanCommonTextWords("将吞噬") + "【" + name2 + "】";
                           str += "<br>" + LanResManager.getLanCommonTextWords("获得") + jingyan2 + LanResManager.getLanCommonTextWords("经验");
                        }
                        else if(this.stone.quality == (it.getBaseItem() as McBaseItem).quality)
                        {
                           if(this.stone.dengji >= (it.getBaseItem() as McBaseItem).dengji)
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
                              senderProxy.send_55833([zbId,tuoruID2,stone.position]);
                           }
                        });
                     }
                  }
                  else
                  {
                     bo = 1;
                     i1 = 0;
                     while(i1 < GameInstance.mainCharData.goodsInfo.goodsBodyArr.length)
                     {
                        if(tuoruID2 == (GameInstance.mainCharData.goodsInfo.goodsBodyArr[i1] as Goods).res.position)
                        {
                           bo = (GameInstance.mainCharData.goodsInfo.goodsBodyArr[i1] as Goods).bind;
                        }
                        i1++;
                     }
                     if(bo == 0 && this.xiangqianShuliang == 0)
                     {
                        FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
                        FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                        FAlert.show(LanResManager.getLanCommonTextWords("镶嵌战魂后，该装备将被绑定！确定要镶嵌吗？"),"",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              senderProxy.send_55833([zbId,tuoruID2,stone.position]);
                           }
                        });
                     }
                     else
                     {
                        this.senderProxy.send_55833([this.zbId,tuoruID2,this.stone.position]);
                     }
                  }
                  break;
               }
               return;
               break;
            case CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START:
               this.tuodongId = evt.data[1];
               itemFace = evt.data[0] as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.source = 1;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      public function openDoublePanel() : void
      {
         if(ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance.zhanhundai))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_ZHANHUNDAI_BAOGUO);
         }
         ResizeManager.showDoublePanel(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.zhanhundai);
      }
      
      public function setData() : void
      {
         this.mainCharArrtibutePlane.showZhanhun();
      }
      
      public function isHuanZhuang(param1:Boolean) : *
      {
         this.mainCharArrtibutePlane.isZhanHunHuanZhuang(param1);
      }
      
      public function setZhanhunItem(param1:McBaseItem, param2:int) : void
      {
         this.mainCharArrtibutePlane.setZhanhunItem(param1,param2);
      }
      
      public function setZhanhunBtn(param1:int) : void
      {
         this.mainCharArrtibutePlane.setZhanhunBtn(param1);
      }
      
      public function setShuxingVis(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setShuxingVis(param1);
      }
      
      public function setZhanhunDakong(param1:int) : void
      {
         this.mainCharArrtibutePlane.setZhanhunDakong(param1);
      }
      
      public function setZhanhunShuxingNum(param1:int, param2:Array) : void
      {
         this.mainCharArrtibutePlane.setZhanhunShuxingNum(param1,param2);
      }
      
      public function updateZhanhun(param1:int) : void
      {
         if(param1 == 1)
         {
            this.senderProxy.send_55831([-1,this.zbId]);
         }
      }
      
      private function showTiShiCanvas() : void
      {
         if(!this.tishiCanvas)
         {
            this.tishiCanvas = new ZhanHunTiShiCanvas();
         }
         if(!this.tishiCanvas.getCheckSta())
         {
            POPWindowManager.showWindow(this.tishiCanvas);
         }
      }
   }
}

