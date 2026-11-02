package com.tgame.moudels.meiren.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.monster.MonsterRes;
   import com.tgame.common.res.monster.MonsterResManager;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PureGirl;
   import com.tgame.common.vo.character.info.GirlAttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.meiren.model.MeiRen_MsgSenderProxy;
   import com.tgame.shell.view.components.MeiRenPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MeiRen_Mediator extends Mediator
   {
      
      public static const NAME:String = "MeiRen_Mediator";
      
      private var mid:int = -1;
      
      private var state:int = -1;
      
      private var mrArr:Array = [];
      
      private var index:int = -1;
      
      private var midArr:Array = [];
      
      private var copperBo:Boolean = false;
      
      private var mrLS:int = 0;
      
      private var _senderProxy:MeiRen_MsgSenderProxy;
      
      public function MeiRen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : MeiRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MeiRen_MsgSenderProxy.NAME) as MeiRen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get meirenPanel() : MeiRenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.meiren);
         }
         return viewComponent as MeiRenPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(MeiRenPanel,function():void
         {
            meirenPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_SHOW_MEIRENPANEL,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MeiRenPanel_LIST_CLICK,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MeiRenPanel_QINDIAN_CLICK,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MeiRenPanel_CHUZHAN_CLICK,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MEIRENRESKILL_CLICK,handler);
            meirenPanel.addEventListener(MeiRenPanel.UI_MEIRENSKILLPANEL_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MeiRenPanel,function():void
         {
            meirenPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_SHOW_MEIRENPANEL,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MeiRenPanel_LIST_CLICK,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MeiRenPanel_QINDIAN_CLICK,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MeiRenPanel_CHUZHAN_CLICK,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MEIRENRESKILL_CLICK,handler);
            meirenPanel.removeEventListener(MeiRenPanel.UI_MEIRENSKILLPANEL_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Player = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.data;
         }
         switch(_loc2_)
         {
            case MeiRenPanel.UI_SHOW_MEIRENPANEL:
               this.senderProxy.send_60051();
               break;
            case MeiRenPanel.UI_MeiRenPanel_CHANMIAN_SHUXING_CLICK:
               _loc5_ = _loc4_ as Array;
               this.senderProxy.send_60061(_loc5_[0]);
               this.setSelectItem(int(_loc5_[1]));
               break;
            case MeiRenPanel.UI_MeiRenPanel_LIST_CLICK:
               _loc5_ = _loc4_ as Array;
               this.mid = int(_loc5_[0]);
               this.state = int(_loc5_[1]);
               this.index = int(_loc5_[2]);
               GameInstance.mainCharData.girlInfo.selectedGirlID = this.mid;
               this.meirenPanel.setMR(this.mid,this.index,0);
               this.senderProxy.send_60053(_loc5_[0]);
               break;
            case MeiRenPanel.UI_MeiRenPanel_QINDIAN_CLICK:
               _loc5_ = _loc4_ as Array;
               this.mid = int(_loc5_[0]);
               this.index = int(_loc5_[1]);
               this.senderProxy.send_60059(this.mid);
               this.setSelectItem1(int(_loc5_[1]));
               break;
            case MeiRenPanel.UI_MeiRenPanel_CHUZHAN_CLICK:
               _loc6_ = _loc4_ as Array;
               this.mid = int(_loc6_[0]);
               this.index = int(_loc6_[2]);
               if(_loc6_[1] == "2")
               {
                  _loc6_[1] = "1";
               }
               else
               {
                  _loc6_[1] = "2";
               }
               _loc7_ = GameInstance.mainCharData as Player;
               if(_loc7_.avatarInfo.isYouyong)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("在水中禁止此操作！"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("在水中禁止此操作！"));
               }
               else
               {
                  this.senderProxy.send_60055(_loc6_);
                  this.setChuzhanBtn();
                  this.setSelectItem1(this.index);
               }
               break;
            case MeiRenPanel.UI_MEIRENRESKILL_CLICK:
               this.senderProxy.send_60087(_loc4_);
               this.showMeirenAllSkill();
               break;
            case MeiRenPanel.UI_MEIRENSKILLPANEL_CLICK:
               _loc5_ = _loc4_ as Array;
               this.senderProxy.send_60089(_loc5_);
         }
      }
      
      public function initMeiren(param1:Array) : void
      {
         var _loc6_:XML = null;
         var _loc2_:XML = <list/>;
         var _loc3_:GirlAttributeInfo = new GirlAttributeInfo();
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_] as GirlAttributeInfo;
            this.mrArr[_loc5_] = _loc3_;
            this.midArr[_loc5_] = _loc3_.mid;
            _loc6_ = <node time={_loc3_.mTime} yb={_loc3_.mqindianYB} maxTime={_loc3_.mTimeMax} index={_loc5_} kq={_loc3_.mkq} id={_loc3_.mid} name={_loc3_.mname} headImg={_loc3_.mhead} state={_loc3_.mstate} color={_loc3_.mnameColor} mRes={_loc3_.mResId} mIsHave={_loc3_.mIsHave}/>;
            _loc2_.appendChild(_loc6_);
            _loc5_++;
         }
         if(this.index == -1)
         {
            this.index = 0;
         }
         else
         {
            this.requestMeiren(this.midArr[this.index]);
         }
         this.meirenPanel.onShowList1(_loc2_,this.index);
      }
      
      public function ListClick(param1:GirlAttributeInfo, param2:int) : void
      {
         this.meirenPanel.setExp(param1.mlv,param1.mexpNow,param1.mexpMax);
         this.meirenPanel.setMeiRenjineng(param1.mSkill,param1.mSkillKQ);
         this.meirenPanel.setMeirenShuXing(param1.mhp,param1.matk,param1.matkspeed,param1.mcritical,param1.mevasion,10,param1.mshiju);
         this.meirenPanel.setShuXing(param1.mchanmianArrBC[0].name,param1.mchanmianArr[0],param1.mchanmianArrBC[1].name,param1.mchanmianArr[1],param1.mchanmianArrBC[2].name,param1.mchanmianArr[2],param1.mname,param1.mchanmianNumToday,param1.mchanmianCopper,param1.mchanmianNumTMax,param1.mchanmianNumNow,param1.mchanmianNumMax,param1.mid);
         this.meirenPanel.setBenCi(param1.mchanmianArrBC[0].value,param1.mchanmianArrBC[1].value,param1.mchanmianArrBC[2].value,param1.mIsHave);
         this.meirenPanel.setItem(GameInstance.mainCharData.goodsInfo.goodsMeirenArr);
         this.mrLS = param1.mSkillKQ;
      }
      
      public function setSelectItem(param1:int) : void
      {
         this.meirenPanel.setListSelect(param1);
         this.requestMeiren(int(this.midArr[param1]));
      }
      
      public function setChuzhanBtn() : void
      {
         this.meirenPanel.setChuzhanBtn();
      }
      
      public function setSelectItem1(param1:int) : void
      {
         this.meirenPanel.setListSelect(param1);
      }
      
      public function ListClickS(param1:GirlAttributeInfo) : void
      {
         var _loc8_:GirlAttributeInfo = null;
         var _loc15_:Object = null;
         var _loc16_:Goods = null;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         if(param1.mqindianMID > 0)
         {
            _loc2_ = true;
         }
         if(param1.mqindiLV > 0)
         {
            _loc3_ = true;
         }
         _loc6_ = int(param1.mqindianCailiaoArr.length);
         if(param1.mqindianCopper > 0)
         {
            _loc4_ = true;
         }
         if(param1.mqindianYB > 0)
         {
            _loc5_ = true;
         }
         var _loc7_:Array = [];
         _loc8_ = new GirlAttributeInfo();
         var _loc9_:int = 0;
         while(_loc9_ < this.mrArr.length)
         {
            _loc8_ = this.mrArr[_loc9_] as GirlAttributeInfo;
            if(_loc8_.mid == param1.mqindianMID)
            {
               if(_loc8_.mIsHave)
               {
                  _loc7_[0] = 1;
               }
               else
               {
                  _loc7_[0] = 0;
               }
            }
            _loc9_++;
         }
         if(GameInstance.mainCharData.attributeInfo.lv >= param1.mqindiLV)
         {
            _loc7_[1] = 1;
         }
         else
         {
            _loc7_[1] = 0;
         }
         var _loc10_:String = "";
         var _loc11_:int = 0;
         while(_loc11_ < param1.mqindianCailiaoArr.length)
         {
            _loc15_ = param1.mqindianCailiaoArr[_loc11_] as Object;
            _loc16_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc15_.cid,true);
            if(_loc16_.count >= _loc15_.num)
            {
               _loc10_ += "1,";
            }
            _loc11_++;
         }
         _loc10_ = _loc10_.substr(0,_loc10_.length - 1);
         _loc7_[2] = _loc10_;
         if(GameInstance.mainCharData.moneyInfo.copper >= param1.mqindianCopper)
         {
            _loc7_[3] = 1;
            this.copperBo = true;
         }
         else
         {
            _loc7_[3] = 0;
            this.copperBo = false;
         }
         if(GameInstance.mainCharData.moneyInfo.gold >= param1.mqindianYB)
         {
            _loc7_[4] = 1;
         }
         else
         {
            _loc7_[4] = 0;
         }
         var _loc12_:PureGirl = new PureGirl(param1.mqindianMID);
         var _loc13_:MonsterRes = MonsterResManager.getMonsterRes(param1.mqindianMID);
         var _loc14_:String = "";
         if(_loc12_.res != null)
         {
            _loc14_ = _loc12_.res.name;
         }
         this.meirenPanel.setQinDian(_loc2_,_loc14_,_loc3_,param1.mqindiLV,_loc6_,param1.mqindianCailiaoArr,_loc4_,param1.mqindianCopper,_loc5_,param1.mqindianYB,_loc7_);
      }
      
      public function showSprite(param1:int) : void
      {
         this.meirenPanel.setRight(param1);
      }
      
      public function setListBtn(param1:int) : void
      {
         this.senderProxy.send_60051();
      }
      
      public function requestMeiren(param1:int = -1) : void
      {
         if(param1 != -1)
         {
            this.mid = param1;
         }
         this.senderProxy.send_60053(this.mid);
         GameInstance.mainCharData.girlInfo.selectedGirlID = this.mid;
      }
      
      public function zp(param1:int) : void
      {
         FightManager.screen_shake(param1,60);
      }
      
      public function cmBtn(param1:Boolean) : void
      {
         this.meirenPanel.setChanMIAN(param1);
      }
      
      public function lianziMc(param1:int) : void
      {
         this.meirenPanel.lianziMc(param1);
      }
      
      public function setMeiRenSkill(param1:Array) : void
      {
         this.meirenPanel.setMeiRenjineng(param1,this.mrLS);
      }
      
      public function showMeirenAllSkill(param1:Array = null) : void
      {
         if(param1 == null)
         {
            param1 = new Array();
         }
         if(!ReloginManager.isInKuafu)
         {
            this.meirenPanel.ShowMeiRenSkillPanel(param1);
            return;
         }
         NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
      }
   }
}

