package com.tgame.moudels.zixiashengong.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zixiashengong.ZiXia_ApplicationFacade;
   import com.tgame.moudels.zixiashengong.info.ZiXiaVO;
   import com.tgame.moudels.zixiashengong.model.ZiXia_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZiXia_PlaneMediator extends Mediator
   {
      
      public static var curLevel:int;
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "ZiXia_PlaneMediator";
      
      private var _senderProxy:ZiXia_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function ZiXia_PlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ZiXia_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZiXia_MsgSenderProxy.NAME) as ZiXia_MsgSenderProxy;
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
      
      protected function get tarCharArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZiXia_ApplicationFacade.REFRESH_ZIXIASHENGONG_INFO];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZiXia_ApplicationFacade.REFRESH_ZIXIASHENGONG_INFO:
               break;
            case ZiXia_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.zixiashengong.tupoBo)
               {
                  this.senderProxy.send_57383(ZiXia_PlaneMediator.curLevel + 1);
               }
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETZIXIASHENGONG,requestZixiaInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ,dengjitupoHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETZIXIASHENGONG,requestZixiaInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_DENGJITUPO_CLICKJ,dengjitupoHandler);
         });
      }
      
      public function setZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setZuoQiDaZuo(param1,param2);
      }
      
      public function refreshJianInfo(param1:Boolean, param2:Array, param3:Array, param4:int, param5:int, param6:Boolean, param7:int) : void
      {
         var _loc11_:int = 0;
         var _loc12_:ZiXiaVO = null;
         var _loc13_:Object = null;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:Object = null;
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         while(_loc10_ < param3.length)
         {
            _loc12_ = param3[_loc10_] as ZiXiaVO;
            _loc13_ = new Object();
            _loc13_.id = _loc12_.id;
            _loc13_.zhaoshi = _loc12_.name;
            _loc14_ = "";
            _loc15_ = 0;
            _loc16_ = [];
            _loc11_ = 0;
            while(_loc11_ < 5)
            {
               if(_loc11_ == 0)
               {
                  _loc14_ = LanResManager.getLanCommonTextWords("加攻击：");
               }
               else if(_loc11_ == 1)
               {
                  _loc14_ = LanResManager.getLanCommonTextWords("加防御：");
               }
               else if(_loc11_ == 2)
               {
                  _loc14_ = LanResManager.getLanCommonTextWords("加生命：");
               }
               else if(_loc11_ == 3)
               {
                  _loc14_ = LanResManager.getLanCommonTextWords("加内力：");
               }
               else
               {
                  _loc14_ = LanResManager.getLanCommonTextWords("加体力：");
               }
               if(_loc12_.shuxing[_loc11_] != 0)
               {
                  _loc16_[_loc15_] = _loc14_ + _loc12_.shuxing[_loc11_];
                  _loc15_++;
               }
               _loc11_++;
            }
            _loc17_ = _loc16_[0];
            _loc18_ = _loc16_[1];
            _loc19_ = _loc16_[2];
            _loc20_ = _loc16_[3];
            _loc13_.shuxing = [_loc17_,_loc18_,_loc19_,_loc20_];
            _loc13_.lingwu = _loc12_.isLingwu;
            _loc8_.push(_loc13_);
            if(_loc12_.isLingwu == 1)
            {
               _loc9_++;
            }
            _loc10_++;
         }
         _loc11_ = 0;
         while(_loc11_ < _loc8_.length)
         {
            _loc21_ = _loc8_[_loc11_];
            if(_loc11_ == _loc9_)
            {
               _loc21_.dangqian = true;
            }
            else
            {
               _loc21_.dangqian = false;
            }
            _loc11_++;
         }
         if(_loc9_ >= 12)
         {
            _loc9_ = 11;
         }
         this.mainCharArrtibutePlane.setZiXiaShenGongShuxingNum(param1,param2,param6,param7);
         this.mainCharArrtibutePlane.setZiXiaShenGongInitialize(_loc8_,_loc9_);
         this.setAvatar(param4,param5);
         this.mainCharArrtibutePlane.setZiXiaShenGongMc(_loc9_ + 1);
         this.mainCharArrtibutePlane.showZiXiaShenGong();
         curLevel = _loc9_;
         if(ReloginManager.isInKuafu)
         {
            this.mainCharArrtibutePlane.zixiashengong.setZiXiaEnabledFun();
         }
      }
      
      public function ZixiaEffectShow(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.ZixiaEffectShow(param1);
      }
      
      private function setAvatar(param1:int, param2:int) : void
      {
         var apd:AvatarParamData = null;
         var callBack:Function = null;
         var sex:int = 0;
         var goodsID:int = param1;
         var menpai:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != goodsID + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharArrtibutePlane.setZiXiaShenGongAvatar(param2);
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
         this.mainCharArrtibutePlane.setZiXiaShenGongAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
      
      private function zixiaPlaneHandle(param1:Event) : void
      {
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:AttributeInfo = _loc2_.attributeInfo;
         var _loc4_:String = param1.type;
         switch(_loc4_)
         {
            case CharAttribute.GETCHARATTRIBUTE:
         }
      }
      
      private function requestZixiaInfoHandler(param1:Event) : void
      {
         var _loc2_:ZiXia_LingwuPanelMediator = null;
         if(GameInstance.mainCharData.attributeInfo.lv < 50)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有级以上玩家才可以修炼紫霞神功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有级以上玩家才可以修炼紫霞神功"));
         }
         else
         {
            _loc2_ = facade.retrieveMediator(ZiXia_LingwuPanelMediator.NAME) as ZiXia_LingwuPanelMediator;
            _loc2_.yingcangLingwuPanel();
            this.senderProxy.send_57381();
         }
      }
      
      private function dengjitupoHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.mainCharArrtibutePlane.zixiashengong.tupoBo)
         {
            this.mainCharArrtibutePlane.onZiXiaShenGongShowLv(false);
            return;
         }
         if(_loc2_ != curLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("不能越级领悟紫霞神功"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("不能越级领悟紫霞神功"));
            this.mainCharArrtibutePlane.onZiXiaShenGongShowLv(false);
            return;
         }
         this.senderProxy.send_57383(_loc2_);
         this.mainCharArrtibutePlane.onZiXiaShenGongShowLv(true);
      }
      
      public function showJiuYangEffect(param1:Boolean) : void
      {
      }
      
      private function onJihuoYincang(param1:BaseEvent) : void
      {
      }
      
      public function jihuoResult() : void
      {
      }
      
      public function setJihuo(param1:Boolean) : void
      {
      }
   }
}

