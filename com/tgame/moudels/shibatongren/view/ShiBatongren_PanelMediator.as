package com.tgame.moudels.shibatongren.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shibatongren.model.ShiBaTongRen_MsgSenderProxy;
   import com.tgame.moudels.shibatongren.model.info.ShiBaTongRenMainPanelVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiBatongren_PanelMediator extends Mediator
   {
      
      private static var _tongrenVO:ShiBaTongRenMainPanelVO;
      
      public static const NAME:String = "ShiBatongren_PanelMediator";
      
      public static var lookPlayerID:int = -1;
      
      private const ZHAOSHU_MAX:int = 18;
      
      private const ZHAOSHU_MIN:int = 1;
      
      private var refreshDelayTimer:Timer = new Timer(400,1);
      
      private var _senderProxy:ShiBaTongRen_MsgSenderProxy;
      
      public function ShiBatongren_PanelMediator()
      {
         super(NAME);
      }
      
      public static function get tongrenVO() : ShiBaTongRenMainPanelVO
      {
         if(!_tongrenVO)
         {
            _tongrenVO = new ShiBaTongRenMainPanelVO();
         }
         return _tongrenVO;
      }
      
      public static function clearVO() : void
      {
         if(_tongrenVO)
         {
            _tongrenVO = null;
         }
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get senderProxy() : ShiBaTongRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShiBaTongRen_MsgSenderProxy.NAME) as ShiBaTongRen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN,requestShiBaTongRenInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN,chuangguanHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_SBTR,selectYNequip);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN,requestShiBaTongRenInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN,chuangguanHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_SBTR,selectYNequip);
         });
      }
      
      public function initializeMainUI() : void
      {
         this.mainCharArrtibutePlane.showShiBaTongRen();
         this.mainCharArrtibutePlane.initilizeUISBTR(tongrenVO);
         this.mainCharArrtibutePlane.setCHK_LSSH(tongrenVO.YN_QixuanState);
         this.mainCharArrtibutePlane.showYN_LSSH(tongrenVO.YN_Qixuan);
         this.mainCharArrtibutePlane.setXunzhangYN_SBTRZ(this.selectXunzhang());
      }
      
      public function selectXunzhang() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].res.position == ItemPositionRange.POSITION_LONGSHENSHOUHU || _loc2_[_loc3_].res.position == ItemPositionRange.POSTION_20171115ZHIZUNBAQI)
            {
               _loc1_.push(_loc2_[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:int = int(param1.data);
         var _loc3_:int = _loc2_ == 0 ? -1 : 1;
         if(tongrenVO.viewSkillID + _loc3_ > this.ZHAOSHU_MAX)
         {
            tongrenVO.viewSkillID = this.ZHAOSHU_MAX;
         }
         else if(tongrenVO.viewSkillID + _loc3_ < this.ZHAOSHU_MIN)
         {
            tongrenVO.viewSkillID = this.ZHAOSHU_MIN;
         }
         else
         {
            tongrenVO.viewSkillID += _loc3_;
         }
         this.senderProxy.send_54501({
            "userID":-1,
            "skillID":tongrenVO.viewSkillID
         });
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.refreshDelayTimer.stop();
         this.refreshDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function chuangguanHandler(param1:BaseEvent) : void
      {
         if(tongrenVO.viewSkillID > tongrenVO.learnedSkillID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("不能越级闯关"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("不能越级闯关"));
            return;
         }
         if(tongrenVO.viewSkillID < tongrenVO.learnedSkillID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("此关已经通过"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("此关已经通过"));
            return;
         }
         this.senderProxy.send_54503(tongrenVO.viewSkillID);
      }
      
      private function requestShiBaTongRenInfoHandler(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 75)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有75级以上玩家才可以闯关十八铜人阵1"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有75级以上玩家才可以闯关十八铜人阵1"));
         }
         else
         {
            this.senderProxy.send_54501({
               "userID":-1,
               "skillID":0
            });
         }
      }
      
      private function selectYNequip(param1:*) : void
      {
         var _loc6_:Goods = null;
         var _loc2_:int = param1.data as int;
         var _loc3_:Array = GameInstance.mainCharData.goodsInfo.YNsbtrArr;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_] as Goods;
            if(_loc2_ == _loc6_.res.position)
            {
               _loc3_.splice(_loc5_,1);
               _loc3_.push(_loc6_);
            }
            _loc5_++;
         }
         _loc4_ = _loc3_.reverse();
         GameInstance.mainCharData.goodsInfo.YNsbtrArr = _loc4_;
         this.mainCharArrtibutePlane.showYNequipselect();
      }
   }
}

