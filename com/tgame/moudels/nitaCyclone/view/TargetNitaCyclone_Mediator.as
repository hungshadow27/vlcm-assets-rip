package com.tgame.moudels.nitaCyclone.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.nitaCyclone.info.NitaCycloneItemInfo;
   import com.tgame.moudels.nitaCyclone.model.NitaCyclone_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TargetNitaCyclone_Mediator extends Mediator
   {
      
      public static const NAME:String = "TargetNitaCyclone_Mediator";
      
      private var _msgSendProxy:NitaCyclone_MsgSenderProxy;
      
      public function TargetNitaCyclone_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get targetAttribute() : TargetAttribute
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
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
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
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetAttribute.addEventListener(TargetAttribute.GETDANTIAN,onClickNitacyclone);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetAttribute.removeEventListener(TargetAttribute.GETDANTIAN,onClickNitacyclone);
         });
      }
      
      private function onClickNitacyclone(param1:BaseEvent) : void
      {
         if(GameInstance.lookPlayerID != -1)
         {
            this.msgSendProxy.send_53157(GameInstance.lookPlayerID);
         }
      }
      
      public function setDantianJihuo(param1:Boolean) : void
      {
         this.targetAttribute.setDantianJihuo(param1);
      }
      
      public function updateNitaCyclonePanel(param1:NitaCycloneItemInfo) : void
      {
         this.targetAttribute.jingling(param1.jinglingDantian);
         this.targetAttribute.showDantian();
         this.targetAttribute.setDengji(param1.curtID);
         this.targetAttribute.setDantianShuxing(param1.propertyDesList,param1.isQichendantian);
         this.targetAttribute.setWuxue(param1.schoolCnt,param1.jianghuCnt,param1.othersCnt,param1.isQichendantian);
         this.targetAttribute.setSkill(param1.skillList);
         this.targetAttribute.setTupoBtnEnabled(false);
         this.targetAttribute.onDantianShowLv(false);
         this.targetAttribute.setTishi(param1.schoolList,param1.jianghuList,param1.othersList);
         this.targetAttribute.setDantianMenghuanJindan(false);
         this.targetAttribute.setRightMc(param1.schoolID,param1.curtID,param1.wifeSchoolID,param1.wifeNitaID);
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
         var _loc2_:int = param1.curtID;
         var _loc3_:int = int(param1.wifeNitaID);
         if(param1.jinjie >= 1)
         {
            _loc2_ += param1.jinjie - 1;
         }
         if(param1.jinjiePeio >= 1)
         {
            _loc3_ += param1.jinjiePeio - 1;
         }
         this.targetAttribute.setLeftMc(param1.schoolID,_loc2_,param1.wifeSchoolID,_loc3_,true,param1.isWifePerforation);
         this.targetAttribute.showXunzhangYN_DT_SDXN(param1.isShowYN_sdxn);
         this.targetAttribute.showXunzhangYN_DT_TJLY(param1.isShowYN_tjly);
         this.setXunzhangSelectYN_DT(param1.isSelectYN);
         this.targetAttribute.setXunzhangYN_DT(this.selectXunzhang());
      }
      
      public function selectXunzhang() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:Array = GameInstance.lookPlayerData.goodsInfo.goodsBagArr;
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
            this.targetAttribute.setXunzhangSelectYN_DT_TJLY(true);
         }
         else
         {
            this.targetAttribute.setXunzhangSelectYN_DT_SDXN(true);
         }
      }
      
      public function setDantianEnabledFun() : void
      {
         this.targetAttribute.setDantianEnabledFun();
      }
      
      public function setJihuoDantianJinjieBtn(param1:int) : void
      {
         this.targetAttribute.setJihuoDantianJinjieBtn(param1);
      }
      
      public function setDengjiTupoBtn(param1:String, param2:Boolean, param3:Boolean) : void
      {
         this.targetAttribute.setDengjiTupoBtn(param1,param2,param3);
      }
      
      public function setDantianJinjieBuff(param1:Skill) : void
      {
         this.targetAttribute.setDantianJinjieBuff(param1);
      }
      
      public function menuDantianToolTip(param1:String) : void
      {
         this.targetAttribute.menuDantianToolTip(param1);
      }
      
      public function setDantianJinduNum(param1:int, param2:Boolean) : void
      {
         this.targetAttribute.setDantianJinduNum(param1,param2);
      }
      
      public function setXinFaSta(param1:int) : void
      {
         this.targetAttribute.setDanTianXinFa(param1);
      }
   }
}

