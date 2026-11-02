package com.tgame.moudels.moshouzhanchang.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.moshouzhanchang.MoShouZhanChang_ApplicationFacade;
   import com.tgame.moudels.moshouzhanchang.model.MoShouZhanChang_MsgSendProxy;
   import com.tgame.shell.view.components.moshouzhanchang.DuanLianPanel;
   import com.tgame.shell.view.components.moshouzhanchang.MoShouZhanChang;
   import com.tgame.shell.view.components.moshouzhanchang.PiLiangShiYongPanel;
   import com.tgame.shell.view.components.qitianleiji.NPCDialogPanel;
   import com.tgame.shell.view.components.qitianleiji.NPCDialogPanel_ShengDanDaZhan;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoShouZhanChang_Mediator extends Mediator
   {
      
      public static const NAME:String = "MoShouZhanChang_Mediator";
      
      public var isJDreturn:Boolean = false;
      
      private var _senderProxy:MoShouZhanChang_MsgSendProxy;
      
      private var targetSc:SceneCharacter;
      
      public function MoShouZhanChang_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MoShouZhanChang_ApplicationFacade.SHOW_MOSHOUZHANCHANG_PANEL,MoShouZhanChang_ApplicationFacade.GET_MOSHOUZHANCHANG_PANEL,MoShouZhanChang_ApplicationFacade.MOSHOUZHANCHANG_FUHUO_CLICK,MoShouZhanChang_ApplicationFacade.GOODS_CHANGED,MoShouZhanChang_ApplicationFacade.SHOW_PILIANGUSE_PANEL,MoShouZhanChang_ApplicationFacade.SHOW_DUANLIAN_PANEL,MoShouZhanChang_ApplicationFacade.SHOW_NPCDUIHUAXUNHUA_PANEL,MoShouZhanChang_ApplicationFacade.SHOW_SHENGDANZHIZHAN_PANEL];
      }
      
      private function get senderProxy() : MoShouZhanChang_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MoShouZhanChang_MsgSendProxy.NAME) as MoShouZhanChang_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:SceneCharacter = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case MoShouZhanChang_ApplicationFacade.GET_MOSHOUZHANCHANG_PANEL:
               this.senderProxy.send_81381();
               break;
            case MoShouZhanChang_ApplicationFacade.MOSHOUZHANCHANG_FUHUO_CLICK:
               this.senderProxy.send_81389();
               break;
            case MoShouZhanChang_ApplicationFacade.GOODS_CHANGED:
               break;
            case MoShouZhanChang_ApplicationFacade.SHOW_PILIANGUSE_PANEL:
               _loc3_ = param1.getBody() as Goods;
               if(!_loc3_)
               {
                  return;
               }
               UITools.showPanel(GameInstance.uiInstance.piLiangShiYongPanel);
               GameInstance.uiInstance.piLiangShiYongPanel.setData(_loc3_);
               break;
            case MoShouZhanChang_ApplicationFacade.SHOW_DUANLIAN_PANEL:
               _loc3_ = param1.getBody() as Goods;
               if(!_loc3_)
               {
                  return;
               }
               UITools.showPanel(GameInstance.uiInstance.duanlianPanel);
               ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
               GameInstance.uiInstance.duanlianPanel.setDuanLianDataInit(_loc3_);
               break;
            case MoShouZhanChang_ApplicationFacade.SHOW_NPCDUIHUAXUNHUA_PANEL:
               _loc4_ = param1.getBody() as SceneCharacter;
               UITools.showPanel(GameInstance.uiInstance.npcDialogXunhua);
               GameInstance.uiInstance.npcDialogXunhua.setMonsterID(_loc4_.id,(_loc4_.data as Monster).res.id_kind);
               break;
            case MoShouZhanChang_ApplicationFacade.SHOW_SHENGDANZHIZHAN_PANEL:
               _loc4_ = param1.getBody() as SceneCharacter;
               this.targetSc = _loc4_;
               this.senderProxy.send_83165(_loc4_.id);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : MoShouZhanChang
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.moshouzhanchangPanel);
         }
         return viewComponent as MoShouZhanChang;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MoShouZhanChang,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG,onHandle);
            panel.addEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG_BAOMING_CLICK,onHandle);
            panel.addEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG_LINGQU,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MoShouZhanChang,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG,onHandle);
            panel.removeEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG_BAOMING_CLICK,onHandle);
            panel.removeEventListener(MoShouZhanChang.UI_MOSHOUZHANCHANG_LINGQU,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(PiLiangShiYongPanel,function():void
         {
            GameInstance.uiInstance.piLiangShiYongPanel.addEventListener(PiLiangShiYongPanel.PILIANGSHIYONG_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PiLiangShiYongPanel,function():void
         {
            GameInstance.uiInstance.piLiangShiYongPanel.removeEventListener(PiLiangShiYongPanel.PILIANGSHIYONG_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(DuanLianPanel,function():void
         {
            GameInstance.uiInstance.duanlianPanel.addEventListener(DuanLianPanel.DUANLIAN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DuanLianPanel,function():void
         {
            GameInstance.uiInstance.duanlianPanel.removeEventListener(DuanLianPanel.DUANLIAN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(NPCDialogPanel,function():void
         {
            GameInstance.uiInstance.npcDialogXunhua.addEventListener(NPCDialogPanel.NPCCUNHUA_JIAOSHUI,onHandle);
            GameInstance.uiInstance.npcDialogXunhua.addEventListener(NPCDialogPanel.NPCCUNHUA_LINGJIANG,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NPCDialogPanel,function():void
         {
            GameInstance.uiInstance.npcDialogXunhua.removeEventListener(NPCDialogPanel.NPCCUNHUA_JIAOSHUI,onHandle);
            GameInstance.uiInstance.npcDialogXunhua.removeEventListener(NPCDialogPanel.NPCCUNHUA_LINGJIANG,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(NPCDialogPanel_ShengDanDaZhan,function():void
         {
            GameInstance.uiInstance.shenDanDaZhanPanel.addEventListener(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_JIAOSHUI,onHandle);
            GameInstance.uiInstance.shenDanDaZhanPanel.addEventListener(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_LINGJIANG,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NPCDialogPanel_ShengDanDaZhan,function():void
         {
            GameInstance.uiInstance.shenDanDaZhanPanel.removeEventListener(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_JIAOSHUI,onHandle);
            GameInstance.uiInstance.shenDanDaZhanPanel.removeEventListener(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_LINGJIANG,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case MoShouZhanChang.UI_MOSHOUZHANCHANG_BAOMING_CLICK:
               _loc2_ = param1.data as int;
               this.senderProxy.send_81383(_loc2_);
               break;
            case PiLiangShiYongPanel.PILIANGSHIYONG_CLICK:
               this.senderProxy.send_83061(param1.data as Object);
               break;
            case MoShouZhanChang.UI_MOSHOUZHANCHANG_LINGQU:
               this.senderProxy.send_81387();
               break;
            case DuanLianPanel.DUANLIAN_CLICK:
               this.senderProxy.send_83115(param1.data as int);
               break;
            case NPCDialogPanel.NPCCUNHUA_JIAOSHUI:
               this.senderProxy.send_83161(param1.data as Array);
               break;
            case NPCDialogPanel.NPCCUNHUA_LINGJIANG:
               this.senderProxy.send_83163(param1.data as int);
               break;
            case NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_JIAOSHUI:
               this.senderProxy.send_83167(param1.data as int);
               break;
            case NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_LINGJIANG:
               this.senderProxy.send_83169(param1.data as int);
         }
      }
      
      public function setPanel(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:Boolean) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            UITools.showPanel(this.panel);
         }
         this.panel.setPanel(param1,param2,param3,param4,param5);
      }
      
      public function setDuanLianData(param1:int) : void
      {
         GameInstance.uiInstance.duanlianPanel.setDuanLianData(param1);
      }
      
      public function setShengDanDaZhanData(param1:int, param2:int) : void
      {
         if(param1)
         {
            GameInstance.uiInstance.shenDanDaZhanPanel.setMonsterID(param2);
            UITools.showPanel(GameInstance.uiInstance.shenDanDaZhanPanel);
         }
         else
         {
            PipeManager.sendMsg(PipeConstants.HIT_CHAR,[this.targetSc,true,true]);
         }
      }
   }
}

