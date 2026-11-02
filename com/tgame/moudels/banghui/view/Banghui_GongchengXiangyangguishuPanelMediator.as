package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import com.tgame.shell.view.components.XiangYangGuiShuPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_GongchengXiangyangguishuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_GongchengXiangyangguishuPanelMediator";
      
      private var _senderProxy:Banghui_MsgSenderProxy;
      
      public function Banghui_GongchengXiangyangguishuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Banghui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XiangYangGuiShuPanel,function():void
         {
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_MODIFY_AFFICHE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_TODO,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_GET,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_GET,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_OK,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT_OK,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.addEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SHOP_SHOW,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XiangYangGuiShuPanel,function():void
         {
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_MODIFY_AFFICHE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_TODO,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_GET,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_GET,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_OK,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT_OK,uiHandle);
            GameInstance.uiInstance.gongchengXiangyangguishuSPanel.removeEventListener(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SHOP_SHOW,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Goods = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:BanghuiInfo = _loc2_.banghuiInfo;
         var _loc4_:String = param1.type;
         if(param1 is BaseEvent)
         {
            _loc5_ = (param1 as BaseEvent).data;
         }
         switch(_loc4_)
         {
            case Event.ADDED_TO_STAGE:
               GameInstance.uiInstance.gongchengXiangyangguishuSPanel.reset();
               _loc6_ = new Goods(SpecialGoodsID.YLZR_ID);
               GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setItem(_loc6_);
               this.senderProxy.send_51103();
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_MODIFY_AFFICHE:
               this.senderProxy.send_51145(_loc5_ as String);
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE:
               GameInstance.uiInstance.gongchengXiangyangguishuSPanel.showRevenuePanel();
               this.senderProxy.send_51109();
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_TODO:
               GameInstance.uiInstance.gongchengXiangyangguishuSPanel.showTodoPanel([]);
               this.senderProxy.send_51105();
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT:
               this.senderProxy.send_51147();
               GameInstance.uiInstance.gongchengXiangyangguishuSPanel.showSumbitPanel(new Date());
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_GET:
               this.senderProxy.send_51143(_loc5_ as int);
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_GET:
               this.senderProxy.send_51113();
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_OK:
               this.senderProxy.send_51111((_loc5_ as int) / 100 * 10000);
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT_OK:
               this.senderProxy.send_51107();
               break;
            case XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SHOP_SHOW:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,1);
         }
      }
      
      public function f5() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._gongchengXiangyangguishuSPanel))
         {
            this.senderProxy.send_51103();
         }
      }
      
      public function receive_xiangyangguishu(param1:int, param2:String, param3:String, param4:Object, param5:int) : void
      {
         if(param1 != GameConfig.xiangyangcheng_banghuiID)
         {
            return;
         }
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setAffiche(param3,GameInstance.mainChar.id == GameConfig.xiangyangcheng_bangzhuID);
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setPartyName(param2);
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setChengZhu(param4["name1"] || LanResManager.getLanCommonTextWords("无"));
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setFuChengZhu(param4["name2"] || LanResManager.getLanCommonTextWords("无"));
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setYuanShuai(param4["name3"] || LanResManager.getLanCommonTextWords("无"));
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setDaChen(param4["name4"] || LanResManager.getLanCommonTextWords("无"));
         GameInstance.uiInstance.gongchengXiangyangguishuSPanel.setZhuGuan(param4["name5"] || LanResManager.getLanCommonTextWords("无"));
      }
   }
}

