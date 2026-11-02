package com.tgame.moudels.wuxingquan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingquan.model.Wuxingquan_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wuxingquan_PlaneMediator extends Mediator
   {
      
      public static var curLevel:int;
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "Wuxingquan_PlaneMediator";
      
      private var _senderProxy:Wuxingquan_MsgSenderProxy;
      
      public function Wuxingquan_PlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Wuxingquan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wuxingquan_MsgSenderProxy.NAME) as Wuxingquan_MsgSenderProxy;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN,requestWuxingquanInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN_LINGWU,dengjitupoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN_SKILL_DRAG,skillDragHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN,requestWuxingquanInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN_LINGWU,dengjitupoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN_SKILL_DRAG,skillDragHandler);
         });
      }
      
      private function skillDragHandler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:ItemFace = _loc2_.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc3_;
            TCursorManager.showItem(_loc3_.itemBD);
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
      }
      
      private function requestWuxingquanInfoHandler(param1:Event) : void
      {
         var _loc2_:Wuxingquan_LingwuPanelMediator = null;
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 67)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有67级及以上玩家才可以修炼五形拳");
            NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有67级及以上玩家才可以修炼五形拳");
         }
         else
         {
            _loc2_ = facade.retrieveMediator(Wuxingquan_LingwuPanelMediator.NAME) as Wuxingquan_LingwuPanelMediator;
            this.senderProxy.send_54301();
         }
      }
      
      private function dengjitupoHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.mainCharArrtibutePlane.reManbanBoWxq())
         {
            this.mainCharArrtibutePlane.showPanelWxq(false);
            return;
         }
         this.mainCharArrtibutePlane.showPanelWxq(true);
         this.senderProxy.send_54303(_loc2_);
      }
      
      public function refreshWXInfo(param1:Array, param2:int, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Skill = null;
         var _loc11_:Object = null;
         var _loc6_:Array = [];
         _loc8_ = new Skill(param2);
         _loc8_.isLearn = 1;
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc11_ = new Object();
            _loc11_.id = param1[_loc9_].id;
            _loc11_.name = param1[_loc9_].name;
            _loc11_.jieshao = param1[_loc9_].miaoshu;
            _loc11_.miaoshu = param1[_loc9_].shuoming;
            _loc11_.shuxing = [param1[_loc9_].addAttack,param1[_loc9_].addDefend,param1[_loc9_].addLifeMax,param1[_loc9_].addNeiliMax,param1[_loc9_].addTiliMax];
            _loc11_.zhuangtai = param1[_loc9_].isLingwu;
            _loc11_.qianti = param1[_loc9_].qianti;
            _loc6_.push(_loc11_);
            if(param1[_loc9_].isLingwu == 1)
            {
               _loc7_++;
            }
            _loc9_++;
         }
         _loc8_ = new Skill(param2);
         if(_loc7_ == 6)
         {
            _loc8_.isLearn = 1;
         }
         else
         {
            _loc8_.isLearn = 0;
         }
         this.mainCharArrtibutePlane.setInitializeWxq(_loc6_,_loc8_,_loc8_.isLearn,param3,param4,param5);
         this.mainCharArrtibutePlane.showWuXingQuan();
         curLevel = _loc7_;
         this.mainCharArrtibutePlane.setWuXingQuanJiHuo(GameState.dictMainStatus[40634],GameState.dictMainStatus[40737]);
         var _loc10_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGQUAN_LIANYAOHU_ID] != undefined)
         {
            _loc10_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGQUAN_LIANYAOHU_ID]);
         }
         this.mainCharArrtibutePlane.set_WuXingQuan(_loc10_);
      }
   }
}

