package com.tgame.moudels.nitaCyclone.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.nitaCyclone.NitaCyclone_ApplicationFacade;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneCmpInfo;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneCmpResultInfo;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneItemInfo;
   import com.tgame.moudels.nitaCyclone.model.NitaCyclone_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class NitaCyclone_Mediator extends Mediator
   {
      
      public static const NAME:String = "NitaCyclone_Mediator";
      
      private var _curtPage:int = 1;
      
      private var _totalPage:uint = 8;
      
      private var _isAutoCmp:Boolean = false;
      
      private var _timer:Timer;
      
      private var _interval:uint;
      
      private var _curtNitaID:uint;
      
      private var _curtStuffID:uint;
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _jinjiePanel:JiHuoRouShenShuXingPanel;
      
      private var _msgSendProxy:NitaCyclone_MsgSenderProxy;
      
      public function NitaCyclone_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get charAttribute() : CharAttribute
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
      
      override public function listNotificationInterests() : Array
      {
         return [NitaCyclone_ApplicationFacade.UPDATE_SKILL,NitaCyclone_ApplicationFacade.DANTIAN_DINGJI_JIHUO_SHUXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case NitaCyclone_ApplicationFacade.UPDATE_SKILL:
               if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  this.msgSendProxy.send_53151(this._curtNitaID);
               }
               break;
            case NitaCyclone_ApplicationFacade.DANTIAN_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 2)
               {
                  this.msgSendProxy.send_53151(-1);
               }
         }
      }
      
      public function get msgSendProxy() : NitaCyclone_MsgSenderProxy
      {
         if(this._msgSendProxy == null)
         {
            this._msgSendProxy = facade.retrieveProxy(NitaCyclone_MsgSenderProxy.NAME) as NitaCyclone_MsgSenderProxy;
         }
         return this._msgSendProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            charAttribute.addEventListener(CharAttribute.GETDANTIAN,onClickNitaPanel);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_SHANGYIYE_CLICK,onSelectNitaPrev);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_XIAYIYE_CLICK,onSelectNitaNext);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_DENGJITUPO_CLICK,onBreachNita);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_GOUMAI_CLICK,onBuyGoods);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_KAISHITISHENG_CLICK,onStartBreachNita);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_ZIDONGTISHENG_CLICK,onAutoBreachNita);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_SKILL_DRAG_START,onStartDragSkill);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_CLOSE,onClosePanel);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_JIHUO_CLICK,jihuo);
            charAttribute.addEventListener(CharAttribute.UI_DANTIAN_JINJIE_CLICK,dantianJinjie);
            charAttribute.addEventListener(CharAttribute.UI_DANTIANJINJIE_JIHUO_CLICK,jinjieJihuo);
            charAttribute.addEventListener(CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            charAttribute.removeEventListener(CharAttribute.GETDANTIAN,onClickNitaPanel);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_SHANGYIYE_CLICK,onSelectNitaPrev);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_XIAYIYE_CLICK,onSelectNitaNext);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_DENGJITUPO_CLICK,onBreachNita);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_GOUMAI_CLICK,onBuyGoods);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_KAISHITISHENG_CLICK,onStartBreachNita);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_ZIDONGTISHENG_CLICK,onAutoBreachNita);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_SKILL_DRAG_START,onStartDragSkill);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_CLOSE,onClosePanel);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_JIHUO_CLICK,jihuo);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIAN_JINJIE_CLICK,dantianJinjie);
            charAttribute.removeEventListener(CharAttribute.UI_DANTIANJINJIE_JIHUO_CLICK,jinjieJihuo);
            charAttribute.removeEventListener(CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:* = undefined;
         switch(param1.type)
         {
            case CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG:
               _loc2_ = param1.data as Array;
               _loc3_ = [];
               _loc3_[0] = _loc2_[0];
               _loc4_ = _loc2_[1];
               _loc3_[1] = SpecialGoodsID.YN_QIXUAN_ARR[_loc4_ - 1];
               this.msgSendProxy.send_53169(_loc3_);
         }
      }
      
      private function jihuo(param1:Event) : void
      {
         this.showJihuoPanel();
      }
      
      private function dantianJinjie(param1:Event) : void
      {
         this.msgSendProxy.send_53163();
      }
      
      private function jinjieJihuo(param1:Event) : void
      {
         this.msgSendProxy.send_53163();
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.GOODS_CHANGED:
         }
      }
      
      private function onClickNitaPanel(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && !GameInstance.mainCharData.taskInfo.isEndTask(OtherConst.TASK_ID_DANTIAN) && !GameInstance.mainCharData.isDiZi)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"完成65级郭芙处的支线任务后可以开始修炼第一级丹田");
            NoticeManager.notify(NoticeManager.FOOT,"完成65级郭芙处的支线任务后可以开始修炼第一级丹田");
         }
         else
         {
            this.msgSendProxy.send_53151(-1);
            this.charAttribute.showDantian();
            this.charAttribute.onDantianShowLv(false);
            this.setBuff();
         }
      }
      
      private function onSelectNitaPrev(param1:Event) : void
      {
         if(this._curtPage > 1)
         {
            --this._curtPage;
            this.msgSendProxy.send_53151(this._curtPage);
         }
      }
      
      private function onSelectNitaNext(param1:Event) : void
      {
         if(this._curtPage < this._totalPage)
         {
            ++this._curtPage;
            this.msgSendProxy.send_53151(this._curtPage);
         }
      }
      
      private function onBreachNita(param1:Event) : void
      {
         this.msgSendProxy.send_53153();
      }
      
      private function onBuyGoods(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      private function onStartBreachNita(param1:Event) : void
      {
         this.msgSendProxy.send_53155(this.charAttribute.useDantianGoodsType);
      }
      
      private function onAutoBreachNita(param1:Event) : void
      {
         var str:String = null;
         var evt:Event = param1;
         var e:BaseEvent = evt as BaseEvent;
         if(e.data != null && e.data == false)
         {
            this.stopAutoCompose();
            return;
         }
         if(!this._isAutoCmp)
         {
            str = LanResManager.getLanTextWords(this,"开始自动突破",[StaticValue.RED_HTML,StaticValue.BLUE_HTML,GoodsResManager.getGoodsRes(this._curtStuffID).name]);
            FAlert.okLabel = LanResManager.getLanTextWords(this,"开始自动突破按钮");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _isAutoCmp = true;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已开始自动突破"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已开始自动突破"),false);
                  if(!_timer)
                  {
                     _timer = new Timer(500);
                  }
                  _timer.addEventListener(TimerEvent.TIMER,onTimer);
                  _timer.start();
                  onTimer();
                  charAttribute.setDantianZdtsBtnLabel(false);
               }
            });
         }
         else
         {
            this.stopAutoCompose();
         }
      }
      
      private function onTimer(param1:TimerEvent = null) : void
      {
         this._timer.stop();
         this.msgSendProxy.send_53155(this.charAttribute.useDantianGoodsType);
      }
      
      private function stopAutoCompose() : void
      {
         if(this._isAutoCmp)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动突破"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动突破!"),false);
            this._isAutoCmp = false;
         }
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
         }
         this.charAttribute.setDantianZdtsBtnLabel(true);
      }
      
      private function onStartDragSkill(param1:BaseEvent) : void
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
      
      private function onClosePanel(param1:BaseEvent) : void
      {
         this.stopAutoCompose();
      }
      
      public function updateNitaCyclonePanel(param1:NitaCycloneItemInfo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.charAttribute.chuandai(param1.jinglingDantian);
         if(param1.id == -1)
         {
            this._curtPage = param1.curtID;
         }
         else
         {
            this._curtPage = param1.id;
         }
         this._curtNitaID = param1.curtID;
         this.charAttribute.setDengji(this._curtPage);
         this.charAttribute.setDantianShuxing(param1.propertyDesList,param1.isQichendantian);
         this.charAttribute.setWuxue(param1.schoolCnt,param1.jianghuCnt,param1.othersCnt,param1.isQichendantian);
         this.charAttribute.setSkill(param1.skillList);
         this.charAttribute.setDantianMenghuanJindan(true);
         if(param1.curtID >= this._totalPage)
         {
            this.charAttribute.setTupoBtnEnabled(false);
            this.charAttribute.onDantianShowLv(false);
         }
         else if(param1.curtID == this._curtPage)
         {
            this.setDengjiTupoBtn(LanResManager.getLanCommonTextWords("等级突破"),true,true);
         }
         else
         {
            this.setDengjiTupoBtn(LanResManager.getLanCommonTextWords("等级突破"),true,false);
         }
         this.charAttribute.setTishi(param1.schoolList,param1.jianghuList,param1.othersList);
         this.charAttribute.setRightMc(param1.schoolID,this._curtPage,param1.wifeSchoolID,this._curtPage);
         if(this._curtNitaID == this._curtPage)
         {
            if(param1.wifeSchoolID == 0)
            {
               if(param1.schoolID <= 2)
               {
                  param1.wifeSchoolID = param1.schoolID + 2;
               }
               else
               {
                  param1.wifeSchoolID = param1.schoolID - 2;
               }
               param1.isWifePerforation = false;
            }
            if(param1.wifeNitaID == 0)
            {
               param1.wifeNitaID = 1;
               param1.isWifePerforation = false;
            }
            else
            {
               param1.isWifePerforation = true;
            }
            if(param1.jinjie > 1)
            {
            }
            _loc3_ = param1.curtID;
            _loc4_ = int(param1.wifeNitaID);
            if(param1.jinjie >= 1)
            {
               _loc3_ += param1.jinjie - 1;
            }
            if(param1.jinjiePeio >= 1)
            {
               _loc4_ += param1.jinjiePeio - 1;
            }
            this.charAttribute.setLeftMc(param1.schoolID,_loc3_,param1.wifeSchoolID,_loc4_,true,param1.isWifePerforation);
            this.charAttribute.showXunzhangYN_DT_SDXN(param1.isShowYN_sdxn);
            this.charAttribute.showXunzhangYN_DT_TJLY(param1.isShowYN_tjly);
            this.charAttribute.setXunzhangSelectYN_DT_TJLY(param1.yn_tjly);
            this.charAttribute.setXunzhangSelectYN_DT_SDXN(param1.yn_sdxn);
            this.charAttribute.setXunzhangYN_DT(this.selectXunzhang());
         }
      }
      
      public function selectXunzhang() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].res.position == ItemPositionRange.POSITION_TAIJILIANGYI)
            {
               _loc1_.push(_loc2_[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function setXunzhangSelectYN_DT(param1:int) : void
      {
         if(param1 == 1)
         {
            this.charAttribute.setXunzhangSelectYN_DT_TJLY(true);
         }
         else
         {
            this.charAttribute.setXunzhangSelectYN_DT_SDXN(true);
         }
      }
      
      public function updateComposePanel(param1:NitaCycloneCmpInfo) : void
      {
         this._curtNitaID = param1.curtNitaID;
         this._curtStuffID = param1.stuffID;
         if(param1.curtNitaID >= this._totalPage)
         {
            this.charAttribute.onDantianShowLv(false);
            this.charAttribute.setTupoBtnEnabled(false);
         }
         else
         {
            this.charAttribute.onDantianShowLv(true);
            this.setCompsePanelData(param1);
         }
      }
      
      public function setCompsePanelData(param1:NitaCycloneCmpInfo) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:uint = uint(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param1.stuffID,true));
         var _loc3_:Boolean = _loc2_ >= param1.stuffCnt ? true : false;
         var _loc4_:Goods = new Goods(param1.stuffID);
         _loc4_.count = _loc2_;
         if(_loc4_.id > 0)
         {
            this.charAttribute.setDantianPudidan(_loc4_);
         }
         if(GameInstance.mainCharData.buffInfo.hasBuff(1603) && param1.curtNitaID >= 3)
         {
            param1.luckCnt += 100;
         }
         this.charAttribute.setDantianZhufuzhi(param1.luckCnt,param1.luckAllCnt);
         this.charAttribute.setDantianChenggonglv(param1.stuffCnt,param1.probability,GoodsResManager.getGoodsRes(param1.stuffID).name,_loc3_);
         this.charAttribute.setDantianRTime(param1.daojishi);
      }
      
      public function composeSuccess(param1:NitaCycloneCmpResultInfo) : void
      {
         this._isAutoCmp = false;
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
         }
         this.charAttribute.setDantianZdtsBtnLabel(true);
         this.charAttribute.bofangYanhua();
         this.charAttribute.onDantianShowLv(false);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("丹田气旋突破成功"));
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("丹田气旋突破成功"));
         ++this._curtNitaID;
         this.msgSendProxy.send_53151(this._curtNitaID);
         this.msgSendProxy.send_53153();
      }
      
      public function composeFaile(param1:NitaCycloneCmpResultInfo) : void
      {
         if(param1.isSuccess == 2)
         {
            if(Boolean(this._timer) && this._isAutoCmp)
            {
               this._isAutoCmp = false;
               this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
               this._timer.stop();
            }
            this.charAttribute.setDantianZdtsBtnLabel(true);
         }
         else
         {
            if(Boolean(this._timer) && this._isAutoCmp)
            {
               this._timer.start();
            }
            this.msgSendProxy.send_53153();
         }
      }
      
      public function setDantianJihuo(param1:Boolean) : void
      {
         this.charAttribute.setDantianJihuo(param1);
      }
      
      public function jihuoComplete(param1:Boolean) : void
      {
         if(param1)
         {
            this.charAttribute.setDantianJihuo(true);
         }
      }
      
      private function setBuff() : void
      {
         var _loc1_:Array = [];
         if(GameState.gongneng156)
         {
            _loc1_.push(new Buff(OtherConst.BUFF_NITA_BLESS));
         }
         this.charAttribute.setDantianBuff(_loc1_);
      }
      
      private function showJihuoPanel() : void
      {
         var goods:Goods;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSendProxy.send_53013();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DANTIANMIJICANJUAN_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DANTIANMIJICANJUAN_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         this._jiuhoPanel.setDantianShuxing();
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      public function setJihuoDantianJinjieBtn(param1:int) : void
      {
         this.charAttribute.setJihuoDantianJinjieBtn(param1);
      }
      
      public function setDengjiTupoBtn(param1:String, param2:Boolean, param3:Boolean) : void
      {
         this.charAttribute.setDengjiTupoBtn(param1,param2,param3);
      }
      
      public function setDantianJinjieBuff(param1:Skill) : void
      {
         this.charAttribute.setDantianJinjieBuff(param1);
      }
      
      public function showJinjiePanel(param1:String, param2:String, param3:Array, param4:String) : void
      {
         var bo:Boolean = false;
         var goods:Goods = null;
         var bo1:Boolean = false;
         var str1:String = param1;
         var str2:String = param2;
         var ar:Array = param3;
         var btnStr:String = param4;
         if(this._jinjiePanel == null)
         {
            this._jinjiePanel = new JiHuoRouShenShuXingPanel();
            this._jinjiePanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSendProxy.send_53165();
            });
         }
         this._jinjiePanel.reItem();
         if(ar.length == 1)
         {
            bo == false;
            goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(ar[0].id,true);
            if(goods.count >= ar[0].shuliang)
            {
               bo1 = true;
            }
            else
            {
               bo1 = false;
            }
            this._jinjiePanel.setGoods3(goods,bo1);
         }
         else if(ar.length == 2)
         {
            bo == true;
            goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(ar[0].id,true);
            if(goods.count >= ar[0].shuliang)
            {
               bo1 = true;
            }
            else
            {
               bo1 = false;
            }
            this._jinjiePanel.setGoods1(goods,bo1);
            goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(ar[1].id,true);
            if(goods.count >= ar[1].shuliang)
            {
               bo1 = true;
            }
            else
            {
               bo1 = false;
            }
            this._jinjiePanel.setGoods2(goods,bo1);
         }
         this._jinjiePanel.x = (GameConfig.sceneWidth - this._jinjiePanel.width) / 2;
         this._jinjiePanel.y = (GameConfig.sceneHeight - this._jinjiePanel.height) / 2;
         this._jinjiePanel.setDantianJinjie(str1,str2,btnStr,bo);
         GameInstance.uiInstance.uiContainer.addChild(this._jinjiePanel);
      }
      
      public function closeJinjiePanel() : void
      {
         if(this._jinjiePanel != null && this._jinjiePanel.parent != null)
         {
            this._jinjiePanel.parent.removeChild(this._jinjiePanel);
         }
      }
      
      public function shuaxinAantian() : void
      {
         this.msgSendProxy.send_53151(this._curtNitaID);
      }
      
      public function menuDantianToolTip(param1:String) : void
      {
         this.charAttribute.menuDantianToolTip(param1);
      }
      
      public function setDantianJinduNum(param1:int, param2:Boolean) : void
      {
         this.charAttribute.setDantianJinduNum(param1,param2);
      }
      
      public function setXinFaSta(param1:int) : void
      {
         this.charAttribute.setDanTianXinFa(param1);
      }
   }
}

