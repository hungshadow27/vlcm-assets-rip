package com.tgame.moudels.cangjingge.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cangjingge.model.Cangjingge_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Cangjingge_PanelMediator extends Mediator
   {
      
      public static var lookPlayerID:int;
      
      public static const NAME:String = "Cangjingge_PanelMediator";
      
      public static var jingjie_name:Array = [];
      
      public static var jingjie_desc:Array = [];
      
      public static var current_jingjie:int = 0;
      
      private const JINGJIE_MAX:int = 10;
      
      private var current_loockID:int = 0;
      
      private var refreshDelayTimer:Timer = new Timer(400,1);
      
      private var _senderProxy:Cangjingge_MsgSenderProxy;
      
      public function Cangjingge_PanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Cangjingge_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Cangjingge_MsgSenderProxy.NAME) as Cangjingge_MsgSenderProxy;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETJINGJIE,requestCangjinggeInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINGJIE_LINGWU_SHOW,lingwuHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGJIE_EVENT_CLICK,arrowClickHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETJINGJIE,requestCangjinggeInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINGJIE_LINGWU_SHOW,lingwuHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGJIE_EVENT_CLICK,arrowClickHandler);
         });
      }
      
      private function requestCangjinggeInfoHandler(param1:Event) : void
      {
         this.senderProxy.send_52041(0);
      }
      
      private function arrowClickHandler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         this.current_loockID = _loc2_.data as int;
         this.senderProxy.send_52041(this.current_loockID);
         this.mainCharArrtibutePlane.onJingJieShowLv(false);
      }
      
      private function lingwuHandler(param1:Event) : void
      {
         if(this.current_loockID > current_jingjie + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不能越级领悟此式");
            NoticeManager.notify(NoticeManager.FOOT,"不能越级领悟此式");
            return;
         }
         if(this.current_loockID < current_jingjie + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"此式已经领悟");
            NoticeManager.notify(NoticeManager.FOOT,"此式已经领悟");
            return;
         }
         this.senderProxy.send_52043(this.current_loockID);
      }
      
      public function updateCangjinggeUI(param1:Boolean, param2:Boolean, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean, param8:Array = null) : void
      {
         var _loc12_:String = null;
         this.current_loockID = param5;
         this.mainCharArrtibutePlane.showJingJie();
         this.mainCharArrtibutePlane.setJingJieInitialize(param3,param4 + 1,param5);
         this.mainCharArrtibutePlane.setJingJieShuxing(param6,param8[0],param8[1],param8[2],param8[3],param8[4],param8[5],param8[6],param8[7]);
         var _loc9_:Array = new Array();
         var _loc10_:int = 0;
         while(_loc10_ < jingjie_name.length)
         {
            _loc12_ = "";
            _loc12_ = LanResManager.getLanCommonTextWords("境界名称：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + jingjie_name[_loc10_] + "</font><br>" + LanResManager.getLanCommonTextWords("境界状态：");
            if(_loc10_ < param4)
            {
               _loc12_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已突破") + "</font>";
            }
            else if(_loc10_ >= param4 && _loc10_ < param3)
            {
               _loc12_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("尚未突破") + "</font>";
            }
            else
            {
               _loc12_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("不可突破") + "</font>";
            }
            _loc12_ += "<br>" + LanResManager.getLanCommonTextWords("突破前提（副本）：");
            if(_loc10_ < param3)
            {
               _loc12_ += "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已达成") + "</font>";
            }
            else
            {
               _loc12_ += "<font color = \'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过藏经阁第") + (_loc10_ + 1) + LanResManager.getLanCommonTextWords("层") + "</font>";
            }
            _loc12_ += "<br>" + LanResManager.getLanCommonTextWords("突破前提（境界）：");
            if(_loc10_ < param4 + 1 || _loc10_ == 0)
            {
               _loc12_ += "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已达成") + "</font>";
            }
            else
            {
               _loc12_ += "<font color = \'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("领悟上一境界") + "</font>";
            }
            _loc12_ += "<br><font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破方法：") + jingjie_desc[_loc10_] + "</font>";
            _loc9_.push(_loc12_);
            _loc10_++;
         }
         this.mainCharArrtibutePlane.menuJingJieToolTip(_loc9_);
         var _loc11_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHAOFANTUOSU] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHAOFANTUOSU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_NIEPANCHONGSHENG] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_NIEPANCHONGSHENG]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JINGJIE_XUANYUANSHENJIAN] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JINGJIE_XUANYUANSHENJIAN]);
         }
         this.mainCharArrtibutePlane.set_TSJJ(_loc11_);
         this.mainCharArrtibutePlane.set_LYGG(param6);
         this.mainCharArrtibutePlane.setWeilieShuxing(param7);
         this.mainCharArrtibutePlane.setChuandai(param2,param1);
      }
   }
}

