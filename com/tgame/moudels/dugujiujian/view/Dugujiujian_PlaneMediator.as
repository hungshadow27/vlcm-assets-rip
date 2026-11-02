package com.tgame.moudels.dugujiujian.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.dugujiujian.DugujiujianManager;
   import com.tgame.common.res.dugujiujian.DugujiujianRes;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.Dugujiujian_ApplicationFacade;
   import com.tgame.moudels.dugujiujian.info.JianVO;
   import com.tgame.moudels.dugujiujian.model.Dugujiujian_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Dugujiujian_PlaneMediator extends Mediator
   {
      
      public static var curLevel:int;
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "Dugujiujian_PlaneMediator";
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _senderProxy:Dugujiujian_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function Dugujiujian_PlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Dugujiujian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Dugujiujian_MsgSenderProxy.NAME) as Dugujiujian_MsgSenderProxy;
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
         return [Dugujiujian_ApplicationFacade.REFREASH_DUGUJIUJIAN_INFO];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Dugujiujian_ApplicationFacade.REFREASH_DUGUJIUJIAN_INFO:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.DUGUJIUJIAN,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICK,dengjitupoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_YINCANGSHUXING_JIHUO_CLICK,onJihuoYincang);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.DUGUJIUJIAN,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICK,dengjitupoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_YINCANGSHUXING_JIHUO_CLICK,onJihuoYincang);
         });
      }
      
      public function refreshJianInfo(param1:Array, param2:int, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc8_:DugujiujianRes = null;
         var _loc9_:JianVO = null;
         var _loc10_:Object = null;
         var _loc11_:Skill = null;
         var _loc12_:Object = null;
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc8_ = DugujiujianManager.getDugujiujianRes(String(_loc6_ + 1));
            _loc9_ = param1[_loc6_] as JianVO;
            _loc10_ = new Object();
            _loc10_.id = _loc9_.id;
            _loc10_.zhaoshi = _loc8_.name;
            _loc10_.shuxing = [_loc9_.addAttack,_loc9_.addDefend,_loc9_.addLifeMax,_loc9_.addNeiliMax,_loc9_.addTiliMax];
            _loc10_.miaoshu = _loc8_.main_desc;
            _loc10_.nanyidu = _loc8_.degree;
            _loc10_.nandu = _loc8_.degree_xj;
            _loc10_.fengdu = _loc8_.rich_level;
            _loc10_.gongjijianpu = _loc9_.gongjijianpu;
            _loc10_.fangyujianpu = _loc9_.fangyujianpu;
            _loc10_.xueliangjianpu = _loc9_.xueliangjianpu;
            _loc11_ = new Skill(_loc8_.ico);
            _loc11_.isLearn = _loc9_.isLingwu;
            _loc10_.ico = _loc11_;
            _loc10_.lingwu = _loc9_.isLingwu;
            _loc4_.push(_loc10_);
            if(_loc9_.isLingwu >= 1)
            {
               _loc5_++;
            }
            _loc6_++;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc12_ = _loc4_[_loc7_];
            if(_loc7_ == _loc5_)
            {
               _loc12_.dangqian = true;
            }
            else
            {
               _loc12_.dangqian = false;
            }
            _loc7_++;
         }
         this.mainCharArrtibutePlane.setDuguJiujianInitialize(_loc4_);
         this.setAvatar(param2,param3);
         this.mainCharArrtibutePlane.setDugujiujianMc(_loc5_);
         this.mainCharArrtibutePlane.showDugujiujian();
         curLevel = _loc5_;
         param1 = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN] != undefined)
         {
            param1.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DUGUJIUJIAN_SHOUWEIHUDUN] != undefined)
         {
            param1.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DUGUJIUJIAN_SHOUWEIHUDUN]);
         }
         this.mainCharArrtibutePlane.set_DuGuJiuJian(param1);
      }
      
      public function showDuguEffect(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.DugujiujianEffectShow(param1);
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
            mainCharArrtibutePlane.setDuguJiujianAvatar(param2);
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
         this.mainCharArrtibutePlane.setDuguJiujianAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
      
      private function dugujiujianPlaneHandle(param1:Event) : void
      {
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:AttributeInfo = _loc2_.attributeInfo;
         var _loc4_:String = param1.type;
         switch(_loc4_)
         {
            case CharAttribute.GETCHARATTRIBUTE:
               break;
            case CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK:
         }
      }
      
      private function requestDugujiujianInfoHandler(param1:Event) : void
      {
         var _loc2_:Dugujiujian_LingwuPanelMediator = null;
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 62)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有62级以上玩家才可以修炼独孤九剑心诀");
            NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有62级以上玩家才可以修炼独孤九剑心诀");
         }
         else
         {
            _loc2_ = facade.retrieveMediator(Dugujiujian_LingwuPanelMediator.NAME) as Dugujiujian_LingwuPanelMediator;
            _loc2_.yingcangLingwuPanel();
            this.senderProxy.send_53261();
         }
      }
      
      private function dengjitupoHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.mainCharArrtibutePlane.dugujiujian.tupoBo)
         {
            this.mainCharArrtibutePlane.onDuguJiujianShowLv(false);
            return;
         }
         if(_loc2_ != curLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟独孤九剑");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟独孤九剑");
            this.mainCharArrtibutePlane.onDuguJiujianShowLv(false);
            return;
         }
         this.mainCharArrtibutePlane.onDuguJiujianShowLv(true);
         this.senderProxy.send_53263(_loc2_);
      }
      
      private function onJihuoYincang(param1:BaseEvent) : void
      {
         var goods:Goods;
         var evt:BaseEvent = param1;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.setDuGuJiuJianShuxing();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               _senderProxy.send_53269();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DUGUJIUJIAN_MJCJ_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DUGUJIUJIAN_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      public function jihuoResult() : void
      {
         this._senderProxy.send_53261();
      }
      
      public function setJihuo(param1:Boolean, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setJiuJianJihuo(param1,param2);
      }
   }
}

