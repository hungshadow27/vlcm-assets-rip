package com.tgame.moudels.wuhunxitong.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuhunxitong.WuHunXiTong_ApplicationFacade;
   import com.tgame.moudels.wuhunxitong.model.WuHunXiTong_MsgSendProxy;
   import com.tgame.shell.view.components.attribute.WuHunPanel;
   import com.tgame.shell.view.components.lliuyueqingzhu.LeTouPanel;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuHunXiTong_Mediator extends Mediator
   {
      
      public static const NAME:String = "WuHunXiTong_Mediator";
      
      private var _senderProxy:WuHunXiTong_MsgSendProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function WuHunXiTong_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuHunXiTong_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuHunXiTong_MsgSendProxy.NAME) as WuHunXiTong_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [WuHunXiTong_ApplicationFacade.GET_WUHUNXITONG_PANEL,PipeConstants.GET_CAIPIAO_PANEL,PipeConstants.GET_LETOU_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WuHunXiTong_ApplicationFacade.GET_WUHUNXITONG_PANEL:
               this.senderProxy.send_79661();
               this.senderProxy.send_79663(1);
               break;
            case PipeConstants.GET_CAIPIAO_PANEL:
               UITools.showPanel(GameInstance.uiInstance.caipiaoshowPanel);
               GameInstance.uiInstance.caipiaoshowPanel.showCaiPiao(_loc2_ as int);
               break;
            case PipeConstants.GET_LETOU_PANEL:
               this.senderProxy.send_83211();
         }
      }
      
      public function get panel() : WuHunPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wuhunxitongPanel);
         }
         return viewComponent as WuHunPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WuHunPanel,function():void
         {
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_WUHUN_CLICK,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_ZHUANGBEI_CLICK,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_ZHURU_CLICK,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_CHUZHAN_CLICK,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_XUANZELINGHUN_CLICK,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_SKILL_DRAG,onHandle);
            panel.addEventListener(WuHunPanel.UI_WUHUNXITONG_EQUIP_DRAG,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WuHunPanel,function():void
         {
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_WUHUN_CLICK,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_ZHUANGBEI_CLICK,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_ZHURU_CLICK,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_CHUZHAN_CLICK,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_XUANZELINGHUN_CLICK,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_SKILL_DRAG,onHandle);
            panel.removeEventListener(WuHunPanel.UI_WUHUNXITONG_EQUIP_DRAG,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(LeTouPanel,function():void
         {
            GameInstance.uiInstance.letouPanel.addEventListener(LeTouPanel.LETOUPANEL_LINGQU_CAIPIAO,onHandle);
            GameInstance.uiInstance.letouPanel.addEventListener(LeTouPanel.LETOUPANEL_LINGQU_JIANGLI,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LeTouPanel,function():void
         {
            GameInstance.uiInstance.letouPanel.removeEventListener(LeTouPanel.LETOUPANEL_LINGQU_CAIPIAO,onHandle);
            GameInstance.uiInstance.letouPanel.removeEventListener(LeTouPanel.LETOUPANEL_LINGQU_JIANGLI,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemFace = null;
         var _loc4_:Goods = null;
         var _loc5_:Array = null;
         switch(param1.type)
         {
            case WuHunPanel.UI_WUHUNXITONG_WUHUN_CLICK:
               _loc2_ = param1.data as int;
               this.senderProxy.send_79663(_loc2_);
               break;
            case WuHunPanel.UI_WUHUNXITONG_ZHUANGBEI_CLICK:
               _loc3_ = param1.data as ItemFace;
               _loc4_ = _loc3_.getBaseItem() as Goods;
               PipeManager.sendMsg(PipeConstants.ITEM_MOVE,[_loc3_,null,_loc4_.res.position,ItemPositionRange.CONTAINER_BODY]);
               break;
            case WuHunPanel.UI_WUHUNXITONG_XUANZELINGHUN_CLICK:
               _loc5_ = param1.data as Array;
               this.senderProxy.send_79665(_loc5_);
               break;
            case WuHunPanel.UI_WUHUNXITONG_ZHURU_CLICK:
               _loc2_ = param1.data as int;
               this.senderProxy.send_79671(_loc2_);
               break;
            case WuHunPanel.UI_WUHUNXITONG_CHUZHAN_CLICK:
               _loc5_ = param1.data as Array;
               this.senderProxy.send_79667(_loc5_);
               break;
            case WuHunPanel.UI_WUHUNXITONG_SKILL_DRAG:
               _loc3_ = param1.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case WuHunPanel.UI_WUHUNXITONG_EQUIP_DRAG:
               PipeManager.sendMsg(PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,param1);
               break;
            case LeTouPanel.LETOUPANEL_LINGQU_CAIPIAO:
               this.senderProxy.send_83213();
               break;
            case LeTouPanel.LETOUPANEL_LINGQU_JIANGLI:
               this.senderProxy.send_83215();
         }
      }
      
      public function setPanel(param1:Object, param2:Object, param3:int, param4:Boolean, param5:int, param6:int, param7:int, param8:Array, param9:int, param10:Array) : void
      {
         var _loc12_:int = 0;
         if(Fun.isVisible(GameInstance.uiInstance.wuhunxitongPanel))
         {
            GameInstance.uiInstance.wuhunxitongPanel.setPanel(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         }
         var _loc11_:Array = [];
         for each(_loc12_ in ItemPositionRange.POSTION_WUHUNXITONG_EQUIP)
         {
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc12_] != undefined)
            {
               _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc12_]);
            }
         }
         GameInstance.uiInstance.wuhunxitongPanel.set_WuHunEquip(_loc11_);
      }
      
      public function upDataAvatar(param1:int, param2:int) : void
      {
         var apd:AvatarParamData = null;
         var callBack:Function = null;
         var sex:int = 0;
         var menpai:int = param1;
         var goodsID:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != goodsID + "_" + avatar_zizeng)
            {
               return;
            }
            panel.avatar = param2;
         };
         var apdArr:Array = [];
         if(goodsID == 0)
         {
            sex = PartyType.getSexByParty(menpai);
            if(sex == 1)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1),AvatarPartType.BODY);
            }
            else
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0),AvatarPartType.BODY);
            }
         }
         else
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,new Goods(goodsID).res.id_m),AvatarPartType.BODY);
         }
         apdArr.push(apd);
         this.panel.avatar = null;
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.STAND);
      }
      
      public function update(param1:Array) : void
      {
         GameInstance.uiInstance.wuhunxitongPanel.setList(param1);
      }
      
      public function setLeTouData(param1:Object) : void
      {
         UITools.showPanel(GameInstance.uiInstance.letouPanel);
         GameInstance.uiInstance.letouPanel.setData(param1);
      }
   }
}

