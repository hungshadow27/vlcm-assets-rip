package com.tgame.moudels.ynLiulongzhuangbei.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynLiulongzhuangbei.model.YNliulongzhuangbei_MsgSendProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNliulongzhuangbei_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNliulongzhuangbei_Mediator";
      
      private var _senderProxy:YNliulongzhuangbei_MsgSendProxy;
      
      public function YNliulongzhuangbei_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PipeConstants.GOODS_CHANGED];
      }
      
      private function get senderProxy() : YNliulongzhuangbei_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNliulongzhuangbei_MsgSendProxy.NAME) as YNliulongzhuangbei_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case PipeConstants.GOODS_CHANGED:
               if(this.panel.YNGuiHunVisible())
               {
                  this.panel.YNGuiHunGoodsChange();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            panel.addEventListener(CharAttribute.LIULONGZHUANGBEI,onHandle);
            panel.addEventListener(CharAttribute.UI_YNLIULONGZHUANGBEI_SKILL_DRAG,onHandle);
            panel.addEventListener(CharAttribute.UI_YNJINFENGDIAO_SKILL_DRAG,onHandle);
            panel.addEventListener(CharAttribute.YNJINFENGDIAO,onHandle);
            panel.addEventListener(CharAttribute.JINGLINGQIXUAN,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN_SHENGJI,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN_TUPO,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN_DRAG_STRAT,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN_CLICK,onHandle);
            panel.addEventListener(CharAttribute.GUIHUN_SKILL_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            panel.removeEventListener(CharAttribute.LIULONGZHUANGBEI,onHandle);
            panel.removeEventListener(CharAttribute.UI_YNLIULONGZHUANGBEI_SKILL_DRAG,onHandle);
            panel.removeEventListener(CharAttribute.UI_YNJINFENGDIAO_SKILL_DRAG,onHandle);
            panel.removeEventListener(CharAttribute.YNJINFENGDIAO,onHandle);
            panel.removeEventListener(CharAttribute.JINGLINGQIXUAN,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN_SHENGJI,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN_TUPO,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN_DRAG_STRAT,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN_CLICK,onHandle);
            panel.removeEventListener(CharAttribute.GUIHUN_SKILL_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:ItemFace = null;
         switch(param1.type)
         {
            case CharAttribute.LIULONGZHUANGBEI:
               this.setData("","");
               break;
            case CharAttribute.YNJINFENGDIAO:
               this.setData_jinfengdiao("","");
               break;
            case CharAttribute.UI_YNLIULONGZHUANGBEI_SKILL_DRAG:
            case CharAttribute.UI_YNJINFENGDIAO_SKILL_DRAG:
               _loc2_ = param1.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc2_;
                  TCursorManager.showItem(_loc2_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.JINGLINGQIXUAN:
               this.senderProxy.send_83191(-1);
               break;
            case CharAttribute.GUIHUN:
               this.senderProxy.send_83361(-1);
               break;
            case CharAttribute.GUIHUN_SHENGJI:
               this.senderProxy.send_83363();
               break;
            case CharAttribute.GUIHUN_TUPO:
               this.senderProxy.send_83365(param1.data == true ? 1 : 0);
               break;
            case CharAttribute.GUIHUN_DRAG_STRAT:
               _loc2_ = param1.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc2_;
                  TCursorManager.showItem(_loc2_.itemBD);
                  TCursorManager.source = ItemPositionRange.CONTAINER_HUNHUAN;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.GUIHUN_CLICK:
               PipeManager.sendMsg(PipeConstants.GUIHUN_XUNZHANG,param1.data[1] as int);
               break;
            case CharAttribute.GUIHUN_SKILL_CLICK:
               this.senderProxy.send_83367(param1.data as Array);
         }
      }
      
      public function setData(param1:String, param2:String) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         GameInstance.uiInstance.charAttribute.showYNliulongzhuangbei();
         GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         this.panel.permitYNliulongzhuangbei(true);
         this.panel.setYNliulongzhuangbei(GameInstance.mainCharData.goodsInfo.goodsBodyArr,param1,param2);
      }
      
      public function setData_jinfengdiao(param1:String, param2:String) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         GameInstance.uiInstance.charAttribute.showYNJinfengdiao();
         GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         this.panel.permitYNJinfengdiao(true);
         this.panel.setYNJinfengdiao(GameInstance.mainCharData.goodsInfo.goodsBodyArr,param1,param2);
      }
      
      public function setYNJingLing(param1:Object) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         GameInstance.uiInstance.charAttribute.showYNJingLing();
         GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         this.panel.permitYNJingLing(true);
         this.panel.setYNJingLing(param1);
      }
      
      public function setYNGuiHun(param1:Object) : void
      {
         var _loc4_:int = 0;
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         GameInstance.uiInstance.charAttribute.showYNGuiHun();
         GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         this.panel.permitYNGuiHun(true);
         this.panel.setYNGuiHun(param1);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 6)
         {
            _loc4_ = ItemPositionRange.POSTION_GUIHUN_ARR.x + _loc3_;
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_] != undefined)
            {
               _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc4_]);
            }
            _loc3_++;
         }
         this.panel.set_GuiHun(_loc2_);
      }
   }
}

