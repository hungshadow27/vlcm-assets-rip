package com.tgame.moudels.XiangLong.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.XiangLong.info.XiangLongMainPanelVO;
   import com.tgame.moudels.XiangLong.model.XiangLong_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiangLong_PlaneMediator extends Mediator
   {
      
      public static var lookPlayerID:int;
      
      private static var _xianglongVO:XiangLongMainPanelVO;
      
      public static const NAME:String = "XiangLong_PlaneMediator";
      
      private const ZHAOSHU_MAX:int = 19;
      
      private const ZHAOSHU_MIN:int = 1;
      
      private var refreshDelayTimer:Timer = new Timer(400,1);
      
      private var _senderProxy:XiangLong_MsgSenderProxy;
      
      public function XiangLong_PlaneMediator()
      {
         super(NAME);
      }
      
      public static function get xianglongVO() : XiangLongMainPanelVO
      {
         if(!_xianglongVO)
         {
            _xianglongVO = new XiangLongMainPanelVO();
         }
         return _xianglongVO;
      }
      
      public static function clearVO() : void
      {
         if(_xianglongVO)
         {
            _xianglongVO = null;
         }
      }
      
      private function get senderProxy() : XiangLong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiangLong_MsgSenderProxy.NAME) as XiangLong_MsgSenderProxy;
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
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SHOW,requestXiangLongInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIANGLONGSHIBAZHANG_LINGWU_SHOW,lingwuHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIANGLONGSHIBAZHANG_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_INSTALL,skillInstallHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_DRAG,onXiangLongStartDrag);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SHOW,requestXiangLongInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIANGLONGSHIBAZHANG_LINGWU_SHOW,lingwuHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIANGLONGSHIBAZHANG_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_INSTALL,skillInstallHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIANGLONGSHIBAZHANG_SKILL_DRAG,onXiangLongStartDrag);
         });
      }
      
      public function initializeMainUI() : void
      {
         var _loc1_:Boolean = false;
         this.mainCharArrtibutePlane.showXiangLongShiBaZhang();
         this.mainCharArrtibutePlane.initilizeUI(xianglongVO);
         if(xianglongVO.curLearnLevel >= 18)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = false;
         }
         this.mainCharArrtibutePlane.setJinduNum(xianglongVO.jihuoJindu,_loc1_);
         this.setTips();
         this.mainCharArrtibutePlane.set_XLSBZ(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
      }
      
      public function setPanelUpdate(param1:int) : void
      {
         var _loc2_:Object = new Object();
         if(Fun.isVisible(GameInstance.uiInstance.charAttribute))
         {
            switch(param1)
            {
               case 1:
                  this.senderProxy.send_51901(0);
                  break;
               case 2:
                  _loc2_.type = 2;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 3:
                  _loc2_.type = 3;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 4:
                  _loc2_.type = 4;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 5:
                  _loc2_.type = 5;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 6:
                  _loc2_.type = 6;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 7:
                  _loc2_.type = 7;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
                  break;
               case 8:
                  _loc2_.type = 8;
                  PipeManager.sendMsg(PipeConstants.DINGJI_JIHUO_SHUXING,_loc2_);
            }
         }
      }
      
      public function setTips() : void
      {
         var _loc1_:String = "";
         if(xianglongVO.jihuoJindu > 0)
         {
            _loc1_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + xianglongVO.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + xianglongVO.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + xianglongVO.addJihuoShengming + "</font>";
         }
         else
         {
            _loc1_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("降龙十八掌顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuJinduToolTip(_loc1_);
      }
      
      private function requestXiangLongInfoHandler(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 70)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有70级以上玩家才可以修炼降龙十八掌");
            NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有70级以上玩家才可以修炼降龙十八掌");
         }
         else
         {
            this.senderProxy.send_51901(0);
         }
      }
      
      private function lingwuHandler(param1:BaseEvent) : void
      {
         if(xianglongVO.curShowLevel > xianglongVO.curLearnLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟此式");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟此式");
            return;
         }
         if(xianglongVO.curShowLevel < xianglongVO.curLearnLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"此式已经领悟");
            NoticeManager.notify(NoticeManager.FOOT,"此式已经领悟");
            return;
         }
         this.senderProxy.send_51903(xianglongVO.curShowLevel);
      }
      
      public function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:Boolean = Boolean(param1.data);
         var _loc3_:int = _loc2_ ? -1 : 1;
         if(xianglongVO.curShowLevel + _loc3_ > this.ZHAOSHU_MAX)
         {
            xianglongVO.curShowLevel = this.ZHAOSHU_MAX;
         }
         else if(xianglongVO.curShowLevel + _loc3_ < this.ZHAOSHU_MIN)
         {
            xianglongVO.curShowLevel = this.ZHAOSHU_MIN;
         }
         else
         {
            xianglongVO.curShowLevel += _loc3_;
         }
         this.senderProxy.send_51901(xianglongVO.curShowLevel);
         this.refreshDelayTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.refreshDelayTimer.start();
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.refreshDelayTimer.stop();
         this.refreshDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      public function skillInstallHandler(param1:BaseEvent) : void
      {
         var _loc4_:Skill = null;
         var _loc5_:Skill = null;
         var _loc2_:Boolean = Boolean(param1.data.isInstall);
         var _loc3_:int = param1.data.skillPos + 1;
         if(_loc2_)
         {
            if(TCursorManager.currentItemFace != null && TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
            {
               _loc4_ = TCursorManager.currentItemFace.getBaseItem() as Skill;
               if(!_loc4_)
               {
                  return;
               }
               this.senderProxy.send_51911({
                  "pos":_loc3_,
                  "skillID":_loc4_.id
               });
            }
         }
         else if(TCursorManager.currentItemFace != null && TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc5_ = TCursorManager.currentItemFace.getBaseItem() as Skill;
            if(!_loc5_)
            {
               return;
            }
            this.senderProxy.send_51911({
               "pos":_loc3_,
               "skillID":_loc5_.id
            });
         }
         else
         {
            this.senderProxy.send_51909(_loc3_);
         }
      }
      
      private function onXiangLongStartDrag(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc2_;
            TCursorManager.showItem(_loc2_.itemBD);
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
      }
   }
}

