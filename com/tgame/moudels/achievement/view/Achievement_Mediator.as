package com.tgame.moudels.achievement.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.achieve.AchieveRes;
   import com.tgame.common.res.achieve.AchieveResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.info.AchieveInfo;
   import com.tgame.common.vo.character.info.data.AchieveData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.achievement.Achievement_ApplicationFacade;
   import com.tgame.moudels.achievement.model.Achievement_MsgSenderProxy;
   import com.tgame.shell.view.components.AccomplishmentPanel;
   import com.tgame.shell.view.components.AchieveAccomplishmentPanel;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Achievement_Mediator extends Mediator
   {
      
      public static const NAME:String = "Achievement_Mediator";
      
      public var kindid:int = 1;
      
      public var pagesize:int = 3;
      
      public var pageCount:int = 0;
      
      public var page:int = 0;
      
      public var load:LoadBuffer;
      
      public var oneormay:int;
      
      private var searchNowPage:int = 1;
      
      private var playerName:String = "";
      
      public var targetAchieveInfo:AchieveInfo;
      
      private var targetID:int = 0;
      
      private var targetName:String;
      
      private var targetCjPoint:int;
      
      private var targetCjNum:int;
      
      private var chengJiuArr:Array;
      
      public var achievefunc:AchieveAccomplishmentPanel;
      
      public function Achievement_Mediator()
      {
         super(NAME);
      }
      
      public function get achievePanel() : AccomplishmentPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.achievePanel);
         }
         return viewComponent as AccomplishmentPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Achievement_ApplicationFacade.SHOW_CHENGJIU_DUIBI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Array = null;
         switch(param1.getName())
         {
            case Achievement_ApplicationFacade.SHOW_CHENGJIU_DUIBI:
               _loc2_ = param1.getBody() as Array;
               this.achievePanel.SetInitializeContentRight([],"",0,0);
               this.MsgSend.send_51013({
                  "targetID":this.targetID = _loc2_[0],
                  "type":this.kindid
               });
         }
      }
      
      public function received_shuangxiu_query(param1:int, param2:Array) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         this.searchNowPage = param1;
         if(!(param1 == 1 && param2.length == 0))
         {
            if(param2.length == 0)
            {
               this.searchNowPage = param1 - 1;
            }
            else
            {
               _loc3_ = <list></list>;
               _loc4_ = [LanResManager.getLanCommonTextWords("少林"),LanResManager.getLanCommonTextWords("全真"),LanResManager.getLanCommonTextWords("古墓"),LanResManager.getLanCommonTextWords("桃花")];
               _loc5_ = 0;
               while(_loc5_ < param2.length)
               {
                  _loc3_.appendChild(<node label={param2[_loc5_][0]} number={(this.searchNowPage - 1) * 5 + _loc5_ + 1} playerName={param2[_loc5_][1]} level={param2[_loc5_][2]} party={_loc4_[param2[_loc5_][3] - 1]}/>);
                  _loc5_++;
               }
               this.achievePanel.setList(_loc3_,this.searchNowPage);
            }
         }
      }
      
      private function get maincharAttribut() : CharAttribute
      {
         return GameInstance.uiInstance.charAttribute;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            maincharAttribut.addEventListener(CharAttribute.GETACCOMPLISHMENT,onShowAchieve);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            maincharAttribut.removeEventListener(CharAttribute.GETACCOMPLISHMENT,onShowAchieve);
         });
         UIEventsRegisterManager.addUIRegisterEvent(AccomplishmentPanel,function():void
         {
            achievePanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_HIDE,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_LEFTNAV,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_EMPLOY,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_NEXTPAGE,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_PREVIOUSPAGE,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_REFURBISH,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_LISTREFURBISH,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_DUIBI_CLOSE,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_LOOK_INFO_BTN_CLICK,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK,onHandle);
            achievePanel.addEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_START_BTN_CLICK,onHandle);
            achievePanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AccomplishmentPanel,function():void
         {
            achievePanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_HIDE,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_LEFTNAV,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_EMPLOY,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_NEXTPAGE,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_PREVIOUSPAGE,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_REFURBISH,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_ACCOMPLISHMENT_LISTREFURBISH,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_DUIBI_CLOSE,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_LOOK_INFO_BTN_CLICK,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK,onHandle);
            achievePanel.removeEventListener(AccomplishmentPanel.UI_CHENGJIU_SEARCH_START_BTN_CLICK,onHandle);
            achievePanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         this.achievefunc = new AchieveAccomplishmentPanel();
         this.achievefunc.addEventListener(AchieveAccomplishmentPanel.UI_QIYONGCHENGHAO_CLICK,this.onHandle);
      }
      
      private function panelClose(param1:* = null) : *
      {
         this.targetAchieveInfo = null;
         this.playerName = "";
         this.targetID = 0;
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_HIDE:
               this.MsgSend.send_51011(0);
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_EMPLOY:
               this.MsgSend.send_51011(param1.data as int);
               break;
            case AchieveAccomplishmentPanel.UI_QIYONGCHENGHAO_CLICK:
               this.MsgSend.send_51011(param1.data as int);
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_LEFTNAV:
               this.kindid = param1.data as int;
               --this.kindid;
               this.MsgSend.send_51001(this.kindid);
               if(this.targetID != 0)
               {
                  this.MsgSend.send_51013({
                     "targetID":this.targetID,
                     "type":this.kindid
                  });
               }
               this.pageallshow(0);
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_NEXTPAGE:
               this.pageallshow(param1.data as int);
               if(this.targetAchieveInfo)
               {
                  this.pageallshow(param1.data as int,this.targetAchieveInfo,0,this.targetName,this.targetCjPoint,this.targetCjNum);
               }
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_PREVIOUSPAGE:
               this.pageallshow(param1.data as int);
               if(this.targetAchieveInfo)
               {
                  this.pageallshow(param1.data as int,this.targetAchieveInfo,0,this.targetName,this.targetCjPoint,this.targetCjNum);
               }
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_REFURBISH:
               this.load = LoadBuffer.show(this.achievePanel);
               this.MsgSend.send_51001(this.kindid);
               if(this.targetAchieveInfo)
               {
                  this.MsgSend.send_51013({
                     "targetID":this.targetID,
                     "type":this.kindid
                  });
               }
               this.pageallshow(this.page);
               break;
            case AccomplishmentPanel.UI_ACCOMPLISHMENT_LISTREFURBISH:
               this.load = LoadBuffer.show(this.achievePanel);
               this.pagesize = param1.data.meiye;
               this.oneormay = param1.data.xianshi;
               this.pageallshow(this.page);
               if(this.targetAchieveInfo)
               {
                  this.pageallshow(param1.data as int,this.targetAchieveInfo,0,this.targetName,this.targetCjPoint,this.targetCjNum);
               }
               break;
            case AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_NEXT_BTN_CLICK:
               ++this.searchNowPage;
               this.MsgSend.send_51005({
                  "name":this.playerName,
                  "pageNum":this.searchNowPage
               });
               break;
            case AccomplishmentPanel.UI_CHENGJIU_SEARCH_PAGE_PRE_BTN_CLICK:
               if(this.searchNowPage > 1)
               {
                  --this.searchNowPage;
               }
               this.MsgSend.send_51005({
                  "name":this.playerName,
                  "pageNum":this.searchNowPage
               });
               break;
            case AccomplishmentPanel.UI_CHENGJIU_SEARCH_SEARCH_BTN_CLICK:
               this.playerName = param1.data as String;
               this.searchNowPage = 1;
               this.MsgSend.send_51005({
                  "name":this.playerName,
                  "pageNum":this.searchNowPage
               });
               break;
            case AccomplishmentPanel.UI_CHENGJIU_SEARCH_START_BTN_CLICK:
               _loc2_ = param1.data as int;
               if(_loc2_ == 0)
               {
                  return;
               }
               this.targetID = _loc2_;
               this.MsgSend.send_51013({
                  "targetID":this.targetID,
                  "type":this.kindid
               });
               break;
            case AccomplishmentPanel.UI_CHENGJIU_SEARCH_LOOK_INFO_BTN_CLICK:
               _loc2_ = param1.data as int;
               if(_loc2_ == 0)
               {
                  return;
               }
               GameInstance.lookPlayerID = _loc2_;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case AccomplishmentPanel.UI_CHENGJIU_DUIBI_CLOSE:
               this.panelClose();
         }
      }
      
      private function get MsgSend() : Achievement_MsgSenderProxy
      {
         return facade.retrieveProxy(Achievement_MsgSenderProxy.NAME) as Achievement_MsgSenderProxy;
      }
      
      public function pageallshow(param1:int, param2:AchieveInfo = null, param3:int = 0, param4:String = "", param5:int = 0, param6:int = 0) : void
      {
         var _loc7_:Array = null;
         if(param2)
         {
            this.targetName = param4;
            this.targetCjPoint = param5;
            this.targetCjNum = param6;
            this.achievePanel.showDuiBi();
            _loc7_ = param2.getKindAchieves(this.kindid);
            _loc7_ = this.getAchievnData(_loc7_,1,false);
            this.achievePanel.SetInitializeContentRight(_loc7_.slice((this.page - 1) * this.pagesize,(this.page - 1) * this.pagesize + this.pagesize),param4,param5,param6);
            return;
         }
         this.page = param1 <= 0 ? 1 : param1;
         _loc7_ = GameInstance.mainCharData.achieveInfo.getKindAchieves(this.kindid);
         if(_loc7_.length <= 0)
         {
            this.MsgSend.send_51001(this.kindid);
            _loc7_ = AchieveResManager.getAchieveResListByKind(this.kindid);
            _loc7_ = this.getAchievnData(_loc7_);
         }
         else
         {
            _loc7_ = this.getAchievnData(_loc7_,1);
         }
         if(_loc7_.length % this.pagesize == 0)
         {
            this.pageCount = _loc7_.length / this.pagesize;
         }
         else
         {
            this.pageCount = _loc7_.length / this.pagesize + 1;
         }
         if(this.page > this.pageCount)
         {
            this.page = this.pageCount;
         }
         this.achievePanel.SetInitializeContent(_loc7_.slice((this.page - 1) * this.pagesize,(this.page - 1) * this.pagesize + this.pagesize));
         this.achievePanel.SetPage(this.page,this.pageCount);
         if(this.load)
         {
            this.load.close();
         }
      }
      
      private function onShowAchieve(param1:Event) : void
      {
         GameInstance.uiInstance.charAttribute.tabBar.recoverBtnState();
         if(!Fun.isVisible(GameInstance.uiInstance._achievePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[0,""]);
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.MsgSend.send_51001(this.kindid);
         this.MsgSend.send_51003();
         this.pageallshow(this.page);
         this.achievePanel.showPingtaiZhanyi();
      }
      
      private function getAchievnData(param1:Array, param2:int = 0, param3:Boolean = true) : Array
      {
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         var _loc7_:Goods = null;
         var _loc8_:String = null;
         param1.sortOn("id",Array.NUMERIC);
         if(param3)
         {
            this.chengJiuArr = [];
         }
         var _loc4_:Array = [];
         if(param2)
         {
            for each(_loc5_ in param1)
            {
               _loc5_ = AchieveData(_loc5_);
               _loc6_ = new Object();
               _loc6_.name = _loc5_.achieveRes.name;
               if(this.oneormay == 2 && _loc5_.progress < _loc5_.achieveRes.achieve_count)
               {
                  if(param3)
                  {
                     continue;
                  }
               }
               else if(this.oneormay == 3 && _loc5_.progress >= _loc5_.achieveRes.achieve_count)
               {
                  if(param3)
                  {
                     continue;
                  }
               }
               else if(param3)
               {
                  this.chengJiuArr.push(_loc5_.id);
               }
               if(!param3 && this.oneormay != 1)
               {
                  if(this.chengJiuArr.indexOf(_loc5_.id) >= 0)
                  {
                     if(_loc5_.progress == _loc5_.achieveRes.achieve_count)
                     {
                        _loc6_.isAccomplish = true;
                     }
                     else
                     {
                        _loc6_.isAccomplish = false;
                     }
                     _loc6_.CjMax = _loc5_.achieveRes.achieve_count;
                     _loc6_.CjNow = _loc5_.progress;
                     _loc6_.cjmb = _loc5_.achieveRes.desc;
                     _loc6_.cjds = _loc5_.achieveRes.point;
                     _loc6_.jlch = _loc5_.achieveRes.title;
                     _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc5_.achieveRes.goods_id,true);
                     _loc8_ = "";
                     if(_loc7_.res != null)
                     {
                        _loc8_ = LanResManager.getLanTextWords(this,"物品奖励",[_loc7_.res.name]);
                     }
                     if(_loc5_.achieveRes.point > 0)
                     {
                        _loc8_ += LanResManager.getLanTextWords(this,"物品奖励2",[_loc5_.achieveRes.point,_loc5_.achieveRes.point]);
                     }
                     _loc6_.tsjl = _loc8_;
                     _loc6_.jcxl = _loc5_.achieveRes.point;
                     _loc6_.jllj = _loc5_.achieveRes.point;
                     _loc6_.icoPath = ResPathManager.getBigICOPath(_loc5_.achieveRes.ico);
                     _loc4_.push(_loc6_);
                  }
               }
               else
               {
                  if(_loc5_.progress == _loc5_.achieveRes.achieve_count)
                  {
                     _loc6_.isAccomplish = true;
                  }
                  else
                  {
                     _loc6_.isAccomplish = false;
                  }
                  _loc6_.CjMax = _loc5_.achieveRes.achieve_count;
                  _loc6_.CjNow = _loc5_.progress;
                  _loc6_.cjmb = _loc5_.achieveRes.desc;
                  _loc6_.cjds = _loc5_.achieveRes.point;
                  _loc6_.jlch = _loc5_.achieveRes.title;
                  _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc5_.achieveRes.goods_id,true);
                  _loc8_ = "";
                  if(_loc7_.res != null)
                  {
                     _loc8_ = LanResManager.getLanTextWords(this,"物品奖励",[_loc7_.res.name]);
                  }
                  if(_loc5_.achieveRes.point > 0)
                  {
                     _loc8_ += LanResManager.getLanTextWords(this,"物品奖励2",[_loc5_.achieveRes.point,_loc5_.achieveRes.point]);
                  }
                  _loc6_.tsjl = _loc8_;
                  _loc6_.jcxl = _loc5_.achieveRes.point;
                  _loc6_.jllj = _loc5_.achieveRes.point;
                  _loc6_.icoPath = ResPathManager.getBigICOPath(_loc5_.achieveRes.ico);
                  _loc4_.push(_loc6_);
               }
            }
         }
         else
         {
            for each(_loc5_ in param1)
            {
               _loc5_ = AchieveRes(_loc5_);
               _loc6_ = new Object();
               _loc6_.name = _loc5_.name;
               _loc6_.isAccomplish = false;
               _loc6_.CjMax = _loc5_.achieve_count;
               _loc6_.CjNow = 0;
               _loc6_.cjmb = _loc5_.desc;
               _loc6_.cjds = _loc5_.point;
               _loc6_.jlch = _loc5_.title;
               _loc7_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc5_.goods_id,true);
               _loc8_ = "";
               if(_loc7_.res != null)
               {
                  _loc8_ = LanResManager.getLanTextWords(this,"物品奖励",[_loc7_.res.name]);
               }
               if(_loc5_.point > 0)
               {
                  _loc8_ += LanResManager.getLanTextWords(this,"物品奖励2",[_loc5_.point,_loc5_.point]);
               }
               _loc6_.tsjl = _loc8_;
               _loc6_.icoPath = ResPathManager.getBigICOPath(_loc5_.ico);
               _loc4_.push(_loc6_);
            }
         }
         return _loc4_;
      }
      
      public function setGetItemCount(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.achievePanel.SetInitializeBar(param1,param2,param3,param4);
      }
   }
}

