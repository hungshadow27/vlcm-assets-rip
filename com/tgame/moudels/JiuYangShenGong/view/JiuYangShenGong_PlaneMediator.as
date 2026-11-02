package com.tgame.moudels.JiuYangShenGong.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongManager;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongRes;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade;
   import com.tgame.moudels.JiuYangShenGong.info.JiuYangVO;
   import com.tgame.moudels.JiuYangShenGong.model.JiuYangShenGong_MsgSenderProxy;
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
   
   public class JiuYangShenGong_PlaneMediator extends Mediator
   {
      
      public static var curLevel:int;
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "JiuYangShenGong_PlaneMediator";
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _senderProxy:JiuYangShenGong_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function JiuYangShenGong_PlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiuYangShenGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiuYangShenGong_MsgSenderProxy.NAME) as JiuYangShenGong_MsgSenderProxy;
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
         return [JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO,JiuYangShenGong_ApplicationFacade.SHOW_DAZUO_WAIGUAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO:
               break;
            case JiuYangShenGong_ApplicationFacade.SHOW_DAZUO_WAIGUAN:
               this.setWaiguan(int(_loc2_));
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.DUGUJIUJIANJ,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ,dengjitupoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYANGSHENGONG_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYANG_YINCANGSHUXING_JIHUO_CLICK,onJihuoYincang);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.DUGUJIUJIANJ,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_DENGJITUPO_CLICKJ,dengjitupoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYANGSHENGONG_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_EFFECT_SHOW,showJiuyangOrDuguEffect);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYANG_YINCANGSHUXING_JIHUO_CLICK,onJihuoYincang);
         });
      }
      
      public function refreshJianInfo(param1:Array, param2:int, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc8_:JiuYangShenGongRes = null;
         var _loc9_:JiuYangVO = null;
         var _loc10_:Object = null;
         var _loc11_:Skill = null;
         var _loc12_:Object = null;
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc8_ = JiuYangShenGongManager.getJiuYangShenGongRes(String(_loc6_ + 1));
            _loc9_ = param1[_loc6_] as JiuYangVO;
            _loc10_ = new Object();
            _loc10_.id = _loc9_.id;
            _loc10_.zhaoshi = _loc8_.name;
            _loc10_.shuxing = [_loc9_.addAttack,_loc9_.addDefend,_loc9_.addLifeMax,_loc9_.addNeiliMax,_loc9_.addTiliMax];
            _loc10_.miaoshu = _loc8_.main_desc;
            _loc10_.nanyidu = _loc8_.degree;
            _loc10_.nandu = _loc8_.degree_xj;
            _loc10_.fengdu = _loc8_.rich_level;
            _loc11_ = new Skill(_loc8_.ico);
            _loc11_.isLearn = _loc9_.isLingwu;
            _loc10_.ico = _loc11_;
            _loc10_.lingwu = _loc9_.isLingwu;
            _loc4_.push(_loc10_);
            if(_loc9_.isLingwu == 1)
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
         this.mainCharArrtibutePlane.setDuguJiujianInitializeJ(_loc4_);
         this.setAvatar(param2,param3);
         this.mainCharArrtibutePlane.setDugujiujianMcJ(_loc5_);
         this.mainCharArrtibutePlane.showDugujiujianJ();
         curLevel = _loc5_;
         this.mainCharArrtibutePlane.setJiuYangJiHuo2(GameState.dictMainStatus[40738]);
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
            mainCharArrtibutePlane.setDuguJiujianAvatarJ(param2);
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
         this.mainCharArrtibutePlane.setDuguJiujianAvatarJ(null);
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
         var _loc2_:JiuYangShenGong_LingwuPanelMediator = null;
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 62)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有62级以上玩家才可以修炼九阳神功心诀");
            NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有62级以上玩家才可以修炼九阳神功心诀");
         }
         else
         {
            _loc2_ = facade.retrieveMediator(JiuYangShenGong_LingwuPanelMediator.NAME) as JiuYangShenGong_LingwuPanelMediator;
            _loc2_.yingcangLingwuPanel();
            this.senderProxy.send_53821();
         }
      }
      
      private function dengjitupoHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.mainCharArrtibutePlane.jiuyang.tupoBo)
         {
            this.mainCharArrtibutePlane.onDuguJiujianShowLvJ(false);
            return;
         }
         if(_loc2_ != curLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟九阳神功");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟九阳神功");
            this.mainCharArrtibutePlane.onDuguJiujianShowLvJ(false);
            return;
         }
         this.mainCharArrtibutePlane.onDuguJiujianShowLvJ(true);
         this.senderProxy.send_53823(_loc2_);
      }
      
      public function showJiuyangOrDuguEffect(param1:BaseEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.data);
         switch(param1.type)
         {
            case CharAttribute.UI_DUGUJIUJIAN_EFFECT_SHOW:
               if(_loc2_)
               {
                  this.showJiuYangEffect(false);
                  this.mainCharArrtibutePlane.ZixiaEffectShow(false);
                  this.senderProxy.send_53829(1);
               }
               else
               {
                  this.senderProxy.send_53829(0);
               }
               break;
            case CharAttribute.UI_JIUYANGSHENGONG_EFFECT_SHOW:
               if(_loc2_)
               {
                  this.mainCharArrtibutePlane.DugujiujianEffectShow(false);
                  this.mainCharArrtibutePlane.ZixiaEffectShow(false);
                  this.senderProxy.send_53829(2);
               }
               else
               {
                  this.senderProxy.send_53829(0);
               }
               break;
            case CharAttribute.UI_ZIXIASHENGONG_EFFECT_SHOW:
               if(_loc2_)
               {
                  this.showJiuYangEffect(false);
                  this.mainCharArrtibutePlane.DugujiujianEffectShow(false);
                  this.senderProxy.send_53829(3);
               }
               else
               {
                  this.senderProxy.send_53829(0);
               }
         }
      }
      
      public function showJiuYangEffect(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.JiuyangEffectShow(param1);
      }
      
      private function onJihuoYincang(param1:BaseEvent) : void
      {
         var goods:Goods;
         var evt:BaseEvent = param1;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.setJiuYangShuxing();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               _senderProxy.send_53831();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JYSG_MJCJ_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JYSG_MJCJ_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      public function jihuoResult() : void
      {
         this._senderProxy.send_53821();
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setJiuYangJihuo(param1);
      }
      
      private function setWaiguan(param1:int) : void
      {
         this.senderProxy.send_53829(param1);
      }
   }
}

