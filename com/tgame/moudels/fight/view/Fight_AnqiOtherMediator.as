package com.tgame.moudels.fight.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.anqi.AnQiRes;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.info.AnQiInfo;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.model.Fight_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fight_AnqiOtherMediator extends Mediator
   {
      
      public static const NAME:String = "Fight_AnqiOtherMediator";
      
      private var _senderProxy:Fight_MsgSenderProxy;
      
      private var _anqiInfo:AnQiInfo;
      
      public function Fight_AnqiOtherMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function get senderProxy() : Fight_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fight_MsgSenderProxy.NAME) as Fight_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get charAttribute() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            charAttribute.addEventListener(TargetAttribute.UI_TARGETATTRIBUTE_ANQI_SHOW,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            charAttribute.removeEventListener(TargetAttribute.UI_TARGETATTRIBUTE_ANQI_SHOW,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
      }
      
      private function handle(param1:*) : void
      {
         switch(param1.type)
         {
            case TargetAttribute.UI_TARGETATTRIBUTE_ANQI_SHOW:
               if(!ReloginManager.isInKuafu && GameInstance.lookPlayerData.attributeInfo.lv < 14)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有14级以上玩家才可以获得暗器"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有14级以上玩家才可以获得暗器"));
                  this.charAttribute.tabBar.recoverBtnState();
                  return;
               }
               this.senderProxy.send_52017(GameInstance.lookPlayerID);
               this.charAttribute.showAnqi(true);
         }
      }
      
      public function showAnqiInfo(param1:AnQiInfo) : void
      {
         var _loc4_:Skill = null;
         this._anqiInfo = param1;
         var _loc2_:AnQiInfo = this._anqiInfo;
         var _loc3_:AnQiRes = _loc2_.getCurrentAnqiRes();
         this.charAttribute.setAnqiBtnFun(_loc2_.have);
         this.charAttribute.setDangqianInitialize([_loc3_.name,_loc2_.shulian + "/" + _loc3_.mastery,_loc2_.xiulian + "/" + _loc2_.xiulianMax,_loc3_.tribLv / 100,_loc2_.tangMenMiJi,_loc2_.zhongJiAnqi]);
         this.showAnqi(_loc3_.grade - 1);
         this.charAttribute.setBierenAnqiBunFun();
         this.charAttribute.SetkfSkillContentFalse(_loc2_.isKf);
         if(_loc2_.isKf)
         {
            this.charAttribute.SetkfSkillContent(_loc2_.isNowKf);
            if(_loc2_.isNowKf)
            {
               _loc4_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc2_.skillId);
               this.charAttribute.setAnqiKfSkill(_loc4_);
            }
         }
      }
      
      public function anqiZuoQi(param1:Boolean) : void
      {
         this.charAttribute.anqiZuoQi(param1);
      }
      
      private function showAnqi(param1:int) : void
      {
         var _loc3_:AnQiRes = null;
         var _loc2_:AnQiInfo = this._anqiInfo;
         var _loc4_:AnQiRes = _loc3_;
         var _loc5_:AnQiRes = _loc2_.getCurrentAnqiRes();
         _loc3_ = _loc2_.getCurrentAnqiRes();
         _loc4_ = _loc3_;
         this.charAttribute.setAnqiInitialize([_loc3_.name,_loc2_.shulian,_loc3_.mastery,_loc2_.xiulian,_loc2_.xiulianMax,_loc3_.method,Math.round(_loc2_.ap * _loc3_.hidden_weaponscol / 10000) + "(" + _loc3_.hidden_weaponscol / 100 + LanResManager.getLanTextWords(Fight_AnqiMediator,"人物攻击力") + ")",_loc3_.attackDis,_loc3_.tribLv / 100,_loc3_.spcialDesc,_loc3_.grade,_loc3_.attackTargets,true]);
         if(_loc4_.grade == 7 && _loc2_.isActiveAnqi == 1)
         {
            this.charAttribute.setYincangshuxing(true,true,1000);
         }
         else if(_loc4_.grade == 7 && _loc2_.isActiveAnqi == 0)
         {
            this.charAttribute.setYincangshuxing(true,false,1000);
         }
         else
         {
            this.charAttribute.setYincangshuxing(false,false,1000);
         }
         this.setSpecialSkillArr(_loc3_);
         this.charAttribute.setPageInitialize(param1 + 1,7,_loc3_.getBigICOPath());
         this.charAttribute.setAnQiZhuangBei(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
      
      private function setSpecialSkillArr(param1:AnQiRes) : void
      {
         var _loc3_:String = null;
         var _loc5_:Skill = null;
         var _loc2_:Array = param1.spcialType.split(",");
         var _loc4_:Array = [];
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_)
            {
               _loc5_ = new Skill(Number(_loc3_));
               _loc5_.isLearn = 1;
               _loc5_.isAnqiSkill = 1;
               _loc4_.push(_loc5_);
            }
         }
         this.charAttribute.setSkillTeshunengli(_loc4_);
      }
      
      public function showNoInfo() : void
      {
         this.charAttribute.setAnqiBtnFun(0);
         this.charAttribute.setSkillTeshunengli([]);
         this.charAttribute.setDangqianInitialize([]);
         this.charAttribute.setAnqiInitialize(["",0,0,0,0,"","",0,0,"",0,0,false]);
         this.charAttribute.setPageInitialize(1,1,"");
      }
   }
}

