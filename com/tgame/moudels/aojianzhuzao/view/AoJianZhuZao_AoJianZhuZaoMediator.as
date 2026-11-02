package com.tgame.moudels.aojianzhuzao.view
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianzhuzao.model.AoJianZhuZao_MsgSenderProxy;
   import com.tgame.shell.view.components.aojianzhuzao.AoJianZhuZaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AoJianZhuZao_AoJianZhuZaoMediator extends Mediator
   {
      
      public static const NAME:String = "AoJianZhuZao_AoJianZhuZaoMediator";
      
      private var _goods:Goods;
      
      private var lihuaUrl:String = "";
      
      private var lihuaMc:MovieClip;
      
      private var chacheMc:Object = {"lihua":null};
      
      public function AoJianZhuZao_AoJianZhuZaoMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      public function get panel() : AoJianZhuZaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.aoJianZhuZaoPanel);
         }
         return viewComponent as AoJianZhuZaoPanel;
      }
      
      public function get senderProxy() : AoJianZhuZao_MsgSenderProxy
      {
         return facade.retrieveProxy(AoJianZhuZao_MsgSenderProxy.NAME) as AoJianZhuZao_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AoJianZhuZaoPanel,function():void
         {
            panel.addEventListener(AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_DUANZAOBTN_CLICK,panelHandle);
            panel.addEventListener(AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AoJianZhuZaoPanel,function():void
         {
            panel.removeEventListener(AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_DUANZAOBTN_CLICK,panelHandle);
            panel.removeEventListener(AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK,panelHandle);
            resumMouseStatus();
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK:
               _loc3_ = _loc2_.data as int;
               if(_loc3_ == 1)
               {
                  TCursorManager.chickItemToPanelFun = this.itemToPanel;
                  this.changeMouseStatus();
               }
               else
               {
                  this.resumMouseStatus();
                  this._goods = null;
                  this.panel.reset();
               }
               break;
            case AoJianZhuZaoPanel.UI_AOJIANZHUZAOPANEL_DUANZAOBTN_CLICK:
               _loc4_ = _loc2_.data as int;
               if(this._goods)
               {
                  this.senderProxy.send_58103([this._goods.position,_loc4_]);
               }
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         this._goods = param1.getBaseItem() as Goods;
         this.senderProxy.send_58101({"goodId":this._goods.id});
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      public function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      public function sucess_Fang(param1:int, param2:int) : void
      {
         this.panel.SetGoods(param1,param2);
         this.resumMouseStatus();
      }
      
      public function sucess_zhuzao() : void
      {
         this.panel.reset();
         this.resumMouseStatus();
         FightManager.screen_shake(1.5,50,this._onComplete);
         this.lihuaUrl = GameConfig.fileBaseFolder + "res/data/mc/aojianzhuzao/lihua.swf";
         this.lihuaMc = this.chacheMc["lihua"];
         if(this.lihuaMc == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.content)
               {
                  chacheMc["lihua"] = _loc2_.content as MovieClip;
                  lihuaMc = chacheMc["lihua"];
                  GameInstance.uiInstance.letterContainer.addChild(lihuaMc);
                  lihuaMc.play();
                  layOutLiHua();
               }
            },null,false,this.lihuaUrl);
         }
         else
         {
            GameInstance.uiInstance.letterContainer.addChild(this.lihuaMc);
            this.lihuaMc.play();
            this.layOutLiHua();
         }
      }
      
      private function layOutLiHua() : void
      {
         this.lihuaMc.x = (GameConfig.sceneWidth - 1097) / 2;
         this.lihuaMc.y = (GameConfig.sceneHeight - 603) / 2;
      }
      
      private function _onComplete() : void
      {
         FightManager.be_darken(GameInstance.mainChar,true);
      }
   }
}

