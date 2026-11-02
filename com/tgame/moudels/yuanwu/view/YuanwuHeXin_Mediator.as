package com.tgame.moudels.yuanwu.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.common.auto.AutoMediator;
   import com.tgame.moudels.yuanwu.model.Yuanwu_SenderProxy;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.yuanwu.YuanwuHeXinPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   
   public class YuanwuHeXin_Mediator extends AutoMediator
   {
      
      public static const NAME:String = "YuanwuHeXin_Mediator";
      
      private var _isAutoTisheng:Boolean = false;
      
      private var _isAutoTupo:Boolean = false;
      
      private var _functionId:int;
      
      private var goodID:int;
      
      private var goodCount:int;
      
      private var id:int;
      
      private var _viewComponentInited:Boolean = false;
      
      private var _sender:Yuanwu_SenderProxy;
      
      public function YuanwuHeXin_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuanwuHeXinPanel,function():void
         {
            panel.addEventListener(YuanwuHeXinPanel.Jinjie,onMyPanel);
            panel.addEventListener(YuanwuHeXinPanel.AutoJinjie,onMyPanel);
            panel.addEventListener(YuanwuHeXinPanel.AutoBuy,onMyPanel);
            panel.addEventListener(YuanwuHeXinPanel.TISHENG,onMyPanel);
            panel.addEventListener(YuanwuHeXinPanel.AutoTisheng,onMyPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuanwuHeXinPanel,function():void
         {
            panel.removeEventListener(YuanwuHeXinPanel.Jinjie,onMyPanel);
            panel.removeEventListener(YuanwuHeXinPanel.AutoJinjie,onMyPanel);
            panel.removeEventListener(YuanwuHeXinPanel.AutoBuy,onMyPanel);
            panel.removeEventListener(YuanwuHeXinPanel.TISHENG,onMyPanel);
            panel.removeEventListener(YuanwuHeXinPanel.AutoTisheng,onMyPanel);
         });
      }
      
      private function onMyPanel(param1:BaseEvent) : void
      {
         var _loc2_:Object = param1.data;
         switch(param1.type)
         {
            case YuanwuHeXinPanel.Jinjie:
               this.id = int(_loc2_);
               this.jinjie();
               break;
            case YuanwuHeXinPanel.AutoJinjie:
               this.id = int(_loc2_);
               this.autoJinjie();
               break;
            case YuanwuHeXinPanel.AutoTisheng:
               this.id = int(_loc2_);
               this.autoTisheng();
               break;
            case YuanwuHeXinPanel.AutoBuy:
               isAutoBuy = _loc2_;
               break;
            case YuanwuHeXinPanel.TISHENG:
               this.id = int(_loc2_);
               this.tisheng();
         }
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case PipeConstants.GOODS_CHANGED:
               if(!viewComponent)
               {
                  return;
               }
               if(this._viewComponentInited && !Fun.isVisible(this.panel))
               {
                  return;
               }
               this._viewComponentInited = true;
               this.panel.refuseGood();
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         var _loc1_:Array = [PipeConstants.GOODS_CHANGED];
         return _loc1_.concat(super.listNotificationInterests());
      }
      
      private function tisheng() : void
      {
         if(isAutoBuy)
         {
            clearAuto();
            upgradeFun = this.sender.send_83055;
            upgradeData = [this.id];
            addGood(this.goodID,this.goodCount);
            buyAndUpgrade();
            return;
         }
         var _loc1_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc2_:int = _loc1_.getGoodsNumByID(this.goodID,true);
         if(_loc2_ >= this.goodCount)
         {
            this.sender.send_83055([this.id]);
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,"道具不足提升失败");
         }
      }
      
      private function jinjie() : void
      {
         if(isAutoBuy)
         {
            clearAuto();
            upgradeFun = this.sender.send_83053;
            upgradeData = [this.id];
            addGood(this.goodID,this.goodCount);
            buyAndUpgrade();
            return;
         }
         var _loc1_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc2_:int = _loc1_.getGoodsNumByID(this.goodID,true);
         if(_loc2_ >= this.goodCount)
         {
            this.sender.send_83053(this.id);
         }
         else if(this._isAutoTupo)
         {
            this.stopAutotupo();
            NoticeManager.notify(NoticeManager.FOOT,"道具不足，停止自动突破");
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,"道具不足突破失败");
         }
      }
      
      private function autoJinjie() : void
      {
         var str:String;
         if(this._isAutoTupo)
         {
            this.stopAutotupo();
            NoticeManager.notify(NoticeManager.FOOT,"自动突破停止");
            return;
         }
         FAlert.okLabel = "突破";
         str = "自动突破说明" + "：" + "\n 1、" + "当您的包裹中道具的数量不足时将停止突破" + "\n 2、" + "当您突破已经成功将停止突破" + "\n3、" + "自动购买道具时，包裹空间不足格将停止突破。";
         FAlert.show(str,"自动突破",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               _isAutoTupo = true;
               jinjie();
            }
            FAlert.okLabel = "确定";
         });
      }
      
      private function autoTisheng() : void
      {
         var str:String;
         if(this._isAutoTisheng)
         {
            this.stopAutotisheng();
            NoticeManager.notify(NoticeManager.FOOT,"自动提升停止");
            return;
         }
         FAlert.okLabel = "提升";
         str = "自动提升说明" + "：" + "\n 1、" + "当您的包裹中道具的数量不足时将停止提升" + "\n 2、" + "当您提升已经成功将停止提升" + "\n3、" + "自动购买道具时，包裹空间不足格将停止提升。";
         FAlert.show(str,"自动提升",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               _isAutoTisheng = true;
               tisheng();
            }
            FAlert.okLabel = "确定";
         });
      }
      
      private function stopAutotisheng() : void
      {
         this._isAutoTisheng = false;
         clearTimeout(this._functionId);
      }
      
      private function stopAutotupo() : void
      {
         this._isAutoTupo = false;
         clearTimeout(this._functionId);
      }
      
      public function setData(param1:Object) : void
      {
         this.id = param1.type;
         if(!Fun.isVisible(this.panel))
         {
            UITools.showPanel(this.panel);
         }
         this.panel.setData(param1);
      }
      
      public function setDataInfo(param1:Object) : void
      {
         this.goodID = param1.goods;
         this.goodCount = param1.count;
         this.id = param1.type;
         if(param1.isTupoChenggong)
         {
            this.stopAutotupo();
            this.sender.send_83051(this.id);
         }
         else if(param1.isTupo)
         {
            this.stopAutotisheng();
            this.panel.refuseGood();
            if(this._isAutoTupo)
            {
               this._functionId = setTimeout(this.jinjie,250);
            }
            if(Fun.isVisible(this.panel))
            {
               this.panel.setDataInfo(param1);
            }
         }
         else
         {
            this.panel.refuseGood();
            if(this._isAutoTisheng)
            {
               this._functionId = setTimeout(this.tisheng,250);
            }
            if(Fun.isVisible(this.panel))
            {
               this.panel.setDataInfo(param1);
            }
         }
      }
      
      private function get panel() : YuanwuHeXinPanel
      {
         if(!viewComponent)
         {
            viewComponent = GameInstance.uiInstance.yuanwuhexin;
         }
         return viewComponent as YuanwuHeXinPanel;
      }
      
      private function get sender() : Yuanwu_SenderProxy
      {
         if(!this._sender)
         {
            this._sender = facade.retrieveProxy(Yuanwu_SenderProxy.NAME) as Yuanwu_SenderProxy;
         }
         return this._sender;
      }
   }
}

