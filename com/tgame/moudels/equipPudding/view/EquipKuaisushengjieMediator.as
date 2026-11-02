package com.tgame.moudels.equipPudding.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.shell.view.components.EquipUpDataTo120;
   import com.tgame.shell.view.components.EquipUpDataTo150;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class EquipKuaisushengjieMediator extends Mediator
   {
      
      public static const NAME:String = "EquipKuaisushengjieMediator";
      
      private var _msgSenderProxy:EquipPudding_MsgSendProxy;
      
      private var _goods100lv:Goods;
      
      private var _goods120lv:Goods;
      
      private var _huoDongZhuangbeiTilianPanel:EquipUpDataTo120;
      
      private var _120_150ZhuangbeiShengJiePanel:EquipUpDataTo150;
      
      public function EquipKuaisushengjieMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : EquipPudding_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [EquipPudding_ApplicationFacade.KUAISU_SHEGNJIE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case EquipPudding_ApplicationFacade.KUAISU_SHEGNJIE:
               _loc3_ = _loc2_ as Goods;
               if(_loc3_.res.limit_grade == 100)
               {
                  this._goods100lv = _loc3_;
                  this.msgSenderProxy.send_53539([this._goods100lv.id,this._goods100lv.position]);
               }
               else if(_loc3_.res.limit_grade == 120)
               {
                  this._goods120lv = _loc3_;
                  this.msgSenderProxy.send_53539([this._goods120lv.id,this._goods120lv.position]);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipUpDataTo120,function():void
         {
            _huoDongZhuangbeiTilianPanel.addEventListener(EquipUpDataTo120.UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
         UIEventsRegisterManager.addUIRegisterEvent(EquipUpDataTo150,function():void
         {
            _120_150ZhuangbeiShengJiePanel.addEventListener(EquipUpDataTo150.UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipUpDataTo120,function():void
         {
            _huoDongZhuangbeiTilianPanel.removeEventListener(EquipUpDataTo120.UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipUpDataTo150,function():void
         {
            _120_150ZhuangbeiShengJiePanel.removeEventListener(EquipUpDataTo150.UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK,huoDongZhuangbeiTilianPanelHandel);
         });
      }
      
      private function huoDongZhuangbeiTilianPanelHandel(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var goods1:Goods = null;
         var cailiao:Goods = null;
         var tishi:String = null;
         var e:Event = param1;
         var type:String = e.type;
         evt = e as BaseEvent;
         switch(type)
         {
            case EquipUpDataTo120.UI_EQUIP_UPDATA_TO_120_UPBTN_CLICK:
               goods1 = evt.data[0];
               cailiao = evt.data[2];
               if(GameInstance.mainCharData.attributeInfo.lv < 120)
               {
                  tishi = LanResManager.getLanCommonTextWords("你的等级不足120级，升阶后可能无法佩戴该道具，确定升阶吗？");
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("升阶");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(tishi,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_53541([goods1.id,goods1.position,cailiao.id]);
                     }
                     else
                     {
                        _huoDongZhuangbeiTilianPanel.setStartBtnEnabledIsTrue();
                     }
                  });
               }
               else
               {
                  this.msgSenderProxy.send_53541([goods1.id,goods1.position,cailiao.id]);
               }
               break;
            case EquipUpDataTo150.UI_EQUIP_UPDATA_TO_150_UPBTN_CLICK:
               goods1 = evt.data[0];
               cailiao = evt.data[2];
               if(GameInstance.mainCharData.attributeInfo.lv < 150)
               {
                  tishi = LanResManager.getLanCommonTextWords("你的等级不足150级，升阶后可能无法佩戴该道具，确定升阶吗？");
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("升阶");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(tishi,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_53541([goods1.id,goods1.position,cailiao.id]);
                     }
                     else
                     {
                        NoticeManager.notify(NoticeManager.FOOT,"升阶失败！");
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"升阶失败！");
                     }
                  });
               }
               else
               {
                  this.msgSenderProxy.send_53541([goods1.id,goods1.position,cailiao.id]);
               }
         }
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this._goods100lv.id != param1 || this._goods100lv.position != param2)
         {
            return;
         }
         if(this._huoDongZhuangbeiTilianPanel == null)
         {
            this._huoDongZhuangbeiTilianPanel = new EquipUpDataTo120();
            UIEventsRegisterManager.registerUI(this._huoDongZhuangbeiTilianPanel,EquipUpDataTo120);
         }
         if(!Fun.isVisible(this._huoDongZhuangbeiTilianPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this._huoDongZhuangbeiTilianPanel);
            this._huoDongZhuangbeiTilianPanel.x = GameInstance.stage.stageWidth / 2 - this._huoDongZhuangbeiTilianPanel.width / 2;
            this._huoDongZhuangbeiTilianPanel.y = GameInstance.stage.stageHeight / 2 - this._huoDongZhuangbeiTilianPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this._huoDongZhuangbeiTilianPanel);
         }
         var _loc5_:Goods = new Goods(param4);
         _loc5_.roleID = -801;
         _loc5_.position = this._goods100lv.position;
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SGXT);
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SPXT);
         if(Math.floor(param3 / 10000 * 100) == 75)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("升阶进度已达到，您已经可以使用神锻玄铁进行升阶了"));
         }
         this._huoDongZhuangbeiTilianPanel.setUpdataDate(this._goods100lv,Math.floor(param3 / 10000 * 100),_loc5_,_loc6_,_loc7_);
      }
      
      public function setResult(param1:int, param2:int, param3:int) : void
      {
         if(this._goods100lv.id != param1 || this._goods100lv.position != param2)
         {
            return;
         }
         if(param3 == 1)
         {
            this.msgSenderProxy.send_53539([this._goods100lv.id,this._goods100lv.position]);
         }
         else if(param3 == 2)
         {
            if(this._huoDongZhuangbeiTilianPanel.parent != null)
            {
               this._huoDongZhuangbeiTilianPanel.parent.removeChild(this._huoDongZhuangbeiTilianPanel);
            }
         }
      }
      
      public function setData120_150(param1:int, param2:int, param3:int, param4:*) : void
      {
         if(this._goods120lv.id != param1 || this._goods120lv.position != param2)
         {
            return;
         }
         if(this._120_150ZhuangbeiShengJiePanel == null)
         {
            this._120_150ZhuangbeiShengJiePanel = new EquipUpDataTo150();
            UIEventsRegisterManager.registerUI(this._120_150ZhuangbeiShengJiePanel,EquipUpDataTo150);
         }
         if(!Fun.isVisible(this._120_150ZhuangbeiShengJiePanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this._120_150ZhuangbeiShengJiePanel);
            this._120_150ZhuangbeiShengJiePanel.x = GameInstance.stage.stageWidth / 2 - this._120_150ZhuangbeiShengJiePanel.width / 2;
            this._120_150ZhuangbeiShengJiePanel.y = GameInstance.stage.stageHeight / 2 - this._120_150ZhuangbeiShengJiePanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this._120_150ZhuangbeiShengJiePanel);
         }
         var _loc5_:Goods = new Goods(param3);
         _loc5_.roleID = -801;
         _loc5_.position = this._goods120lv.position;
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SMQLJS);
         this._120_150ZhuangbeiShengJiePanel.setUpdataDate(this._goods120lv,_loc5_,_loc6_,param4);
      }
   }
}

