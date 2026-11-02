package com.tgame.moudels.jiuyinzhenjing.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongManager;
   import com.tgame.common.res.JiuYangShenGong.JiuYangShenGongRes;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade;
   import com.tgame.moudels.jiuyinzhenjing.model.JiuYinZhenJing_MsgSenderProxy;
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
   
   public class JiuYinZhenJing_PlaneMediator extends Mediator
   {
      
      public static var curLevel:int;
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "JiuYinZhenJing_PlaneMediator";
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _senderProxy:JiuYinZhenJing_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function JiuYinZhenJing_PlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiuYinZhenJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiuYinZhenJing_MsgSenderProxy.NAME) as JiuYinZhenJing_MsgSenderProxy;
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
         return [JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.JIUYINZHENJING,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYINZHENJING_DENGJITUPO_CLICKJ,dengjitupoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYINZHENJING_GOUMAI_CLICK,goumaiFun);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JIUYINZHENJING,requestDugujiujianInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYINZHENJING_DENGJITUPO_CLICKJ,dengjitupoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYINZHENJING_GOUMAI_CLICK,goumaiFun);
         });
      }
      
      public function refreshJianInfo(param1:Array, param2:int, param3:String, param4:int, param5:Boolean) : void
      {
         var _loc7_:int = 0;
         var _loc11_:JiuYangShenGongRes = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Skill = null;
         var _loc15_:Object = null;
         var _loc6_:Array = [];
         var _loc8_:int = 0;
         while(_loc8_ < param1.length)
         {
            _loc11_ = JiuYangShenGongManager.getJiuYangShenGongRes(String(_loc8_ + 1));
            _loc12_ = param1[_loc8_] as Object;
            _loc13_ = new Object();
            _loc13_.id = param1[_loc8_].id;
            _loc13_.zhaoshi = param1[_loc8_].name;
            _loc13_.shuxing = [param1[_loc8_].addAttack,param1[_loc8_].addDefend,param1[_loc8_].addLifeMax,param1[_loc8_].addNeiliMax,param1[_loc8_].addTiliMax];
            _loc13_.miaoshu = param1[_loc8_].miaosu;
            _loc13_.nanyidu = param1[_loc8_].nanyidu;
            _loc13_.nandu = param1[_loc8_].nandu;
            _loc13_.fengdu = param1[_loc8_].fengdu;
            _loc14_ = new Skill(_loc11_.ico);
            _loc14_.isLearn = param1[_loc8_].isLingwu;
            _loc13_.ico = param1[_loc8_].ico;
            _loc13_.lingwu = param1[_loc8_].isLingwu;
            _loc6_.push(_loc13_);
            if(param1[_loc8_].isLingwu == 1)
            {
               _loc7_++;
            }
            _loc8_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc15_ = _loc6_[_loc9_];
            if(_loc9_ == _loc7_)
            {
               _loc15_.dangqian = true;
            }
            else
            {
               _loc15_.dangqian = false;
            }
            _loc9_++;
         }
         this.mainCharArrtibutePlane.setJiuyinzhenjingInitialize(_loc6_);
         var _loc10_:Skill = new Skill(param2);
         if(param4 == 1)
         {
            _loc10_.isLearn = 1;
         }
         this.mainCharArrtibutePlane.setJiuyinzhenjingBuff(_loc10_,param3,param4);
         this.mainCharArrtibutePlane.setJiuyinzhenjingQiu(_loc7_);
         this.mainCharArrtibutePlane.showJiuyinZhenjing();
         curLevel = _loc7_;
         param1 = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JIUYINZHENJING_SHIHUNQI] != undefined)
         {
            param1.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JIUYINZHENJING_SHIHUNQI]);
         }
         this.mainCharArrtibutePlane.set_JiuYinZhenJing(param1);
         this.mainCharArrtibutePlane.isHuanZHuang(param5);
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
         var _loc2_:JiuYinZhenJing_LingwuPanelMediator = null;
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 64)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有64级及以上玩家才可以修炼九阴真经"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有64级及以上玩家才可以修炼九阴真经"));
         }
         else
         {
            _loc2_ = facade.retrieveMediator(JiuYinZhenJing_LingwuPanelMediator.NAME) as JiuYinZhenJing_LingwuPanelMediator;
            _loc2_.yingcangLingwuPanel();
            this.senderProxy.send_54101();
         }
      }
      
      private function dengjitupoHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.mainCharArrtibutePlane.jiuyin.tupoBo)
         {
            this.mainCharArrtibutePlane.onJiuyinzhenjingShowLv(false);
            return;
         }
         if(_loc2_ != curLevel + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟九阴真经");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟九阴真经");
            this.mainCharArrtibutePlane.onJiuyinzhenjingShowLv(false);
            return;
         }
         this.mainCharArrtibutePlane.onJiuyinzhenjingShowLv(true);
         this.senderProxy.send_54103(_loc2_);
      }
      
      private function goumaiFun(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      public function showJiuYangEffect(param1:Boolean) : void
      {
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
               _senderProxy.send_54101();
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
         this._senderProxy.send_54101();
      }
      
      public function setJihuo(param1:Boolean) : void
      {
      }
   }
}

