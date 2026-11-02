package com.tgame.moudels.wangzhezhibang.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wangzhezhibang.Wangzhezhibang_ApplicationFacade;
   import com.tgame.moudels.wangzhezhibang.model.Wangzhezhibang_MsgSenderProxy;
   import com.tgame.moudels.wangzhezhibang.model.info.WangzhezhibangVO;
   import com.tgame.shell.view.components.WangzhezhibangPanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangGuizePanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangJifenPanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangLijiebazhuPanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangLingjiangPanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangTip;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangZhanchangGuizePanel;
   import com.tgame.shell.view.components.wangzhezhibang.WangzhezhibangZhuweiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wangzhezhibang_Mediator extends Mediator
   {
      
      public static const NAME:String = "Wangzhezhibang_Mediator";
      
      private var _senderProxy:Wangzhezhibang_MsgSenderProxy;
      
      private var zhuwei:WangzhezhibangZhuweiPanel;
      
      private var guize:WangzhezhibangGuizePanel;
      
      private var lingjiang:WangzhezhibangLingjiangPanel;
      
      private var lijiebazhu:WangzhezhibangLijiebazhuPanel;
      
      private var guizeTip:WangzhezhibangZhanchangGuizePanel;
      
      private var allTip:WangzhezhibangTip;
      
      private var jifen:WangzhezhibangJifenPanel;
      
      private var pageZhuwei:int = -1;
      
      private var char_avatar_zizeng:int = 0;
      
      public function Wangzhezhibang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Wangzhezhibang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wangzhezhibang_MsgSenderProxy.NAME) as Wangzhezhibang_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get wangzhezhibangPanel() : WangzhezhibangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wangzhezhibangPanel);
         }
         return viewComponent as WangzhezhibangPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Wangzhezhibang_ApplicationFacade.SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL,Wangzhezhibang_ApplicationFacade.SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL,Wangzhezhibang_ApplicationFacade.WANGZHEZHIBANG_TIP_CLICK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Wangzhezhibang_ApplicationFacade.SHOW_WANGZHEZHIBANG_LINGJIANG_PANEL:
               this.senderProxy.send_74557();
               break;
            case Wangzhezhibang_ApplicationFacade.SHOW_WANGZHEZHIBANG_ZHANCHANG_GUIZE_PANEL:
               this.showZhanchangGuize(1);
               break;
            case Wangzhezhibang_ApplicationFacade.WANGZHEZHIBANG_TIP_CLICK:
               _loc3_ = int(_loc2_);
               if(_loc3_ == 1)
               {
                  this.senderProxy.send_74543();
                  if(!Fun.isVisible(this.wangzhezhibangPanel))
                  {
                     this.senderProxy.send_74541();
                  }
               }
               else if(_loc3_ == 2)
               {
                  this.senderProxy.send_74547();
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
                  GameInstance.uiInstance.mainUI.showWZZBGuizeButton(false);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WangzhezhibangPanel,function():void
         {
            wangzhezhibangPanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BAOMING,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_GUIZESHUOMING,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_JINRUBISAI,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_KUAFUBAOGUO,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIJIEBAZHU,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGJIANG,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIUCHENGTU,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_MOBAI,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIBANGPAI,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIQUERY,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGQUJIANGLI,handler);
            wangzhezhibangPanel.addEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_TIP,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WangzhezhibangPanel,function():void
         {
            wangzhezhibangPanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BAOMING,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_GUIZESHUOMING,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_JINRUBISAI,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_KUAFUBAOGUO,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIJIEBAZHU,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGJIANG,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIUCHENGTU,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_MOBAI,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIBANGPAI,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIQUERY,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGQUJIANGLI,handler);
            wangzhezhibangPanel.removeEventListener(WangzhezhibangPanel.UI_WANGZHEZHIBANG_TIP,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_74541();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGPAIZHUWEIBANG:
               this.senderProxy.send_74549([1,""]);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_BAOMING:
               this.senderProxy.send_74543();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_GUIZESHUOMING:
               this.senderProxy.send_74551();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_JINRUBISAI:
               this.senderProxy.send_74547();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_KUAFUBAOGUO:
               PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIJIEBAZHU:
               this.senderProxy.send_74553(1);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGJIANG:
               this.senderProxy.send_74557();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_LIUCHENGTU:
               this.senderProxy.send_74545();
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_MOBAI:
               this.senderProxy.send_74571();
               break;
            case WangzhezhibangPanel.UI_WANGBANGZHIZHAN_FANYE:
               this.senderProxy.send_74553(_loc2_.data);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_BANGHUIZHUWEI_FANYE:
               this.senderProxy.send_74549([_loc2_.data,""]);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIBANGPAI:
               this.senderProxy.send_74573(_loc2_.data);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIWODEBANGPAI:
               this.senderProxy.send_74573([-1,-1,-1]);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_LINGQUJIANGLI:
               this.senderProxy.send_74569(_loc2_.data);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_ZHUWEIQUERY:
               this.senderProxy.send_74549(_loc2_.data);
               break;
            case WangzhezhibangPanel.UI_WANGZHEZHIBANG_TIP:
               _loc3_ = int(_loc2_.data);
               if(_loc3_ == 1)
               {
                  this.senderProxy.send_74543();
               }
               else if(_loc3_ == 2)
               {
                  this.senderProxy.send_74547();
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.LIKAI_KUAFU_LEITAI);
                  GameInstance.uiInstance.mainUI.showWZZBGuizeButton(false);
               }
         }
      }
      
      public function liucheng(param1:Array, param2:Array) : void
      {
         this.wangzhezhibangPanel.liuchengtu(param1,param2);
      }
      
      public function setMainPanel(param1:WangzhezhibangVO) : void
      {
         this.setPlayerAvatar(param1.playerArr);
         this.wangzhezhibangPanel.setData(param1);
      }
      
      public function setMainBaomingSta(param1:int) : void
      {
         this.wangzhezhibangPanel.setState(param1);
      }
      
      public function setPlayerAvatar(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:PurePlayer = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = new PurePlayer();
            _loc4_.isOnMount = false;
            _loc4_.id = _loc2_;
            if(_loc3_.name != null)
            {
               if(_loc3_.name != "")
               {
                  _loc4_ = this.setPurePlayer(_loc3_.partyID,_loc4_,_loc3_.equipArr);
                  this.setAvatar(_loc4_);
               }
            }
            _loc2_++;
         }
      }
      
      private function setPurePlayer(param1:int, param2:PurePlayer, param3:Array) : PurePlayer
      {
         var _loc7_:GoodsRes = null;
         var _loc4_:AttributeInfo = param2.attributeInfo;
         var _loc5_:AvatarInfo = param2.avatarInfo;
         _loc4_.partyID = param1;
         if(param3[0] == 0 || param3[1] == 0)
         {
            if(_loc4_.getSex() == 1)
            {
               param3[0] = 310027;
               param3[1] = 310026;
            }
            else
            {
               param3[0] = 310028;
               param3[1] = 310026;
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            _loc7_ = GoodsResManager.getGoodsRes(param3[_loc6_]);
            if(_loc7_ != null)
            {
               AvatarManager.dressAvatarData(_loc5_,_loc7_.position,_loc7_.id_m,_loc4_.getSex());
            }
            _loc6_++;
         }
         return param2;
      }
      
      private function setAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            wangzhezhibangPanel.setAvatar($pPlayer.id,param2,$pPlayer.avatarInfo.needChangeAvatarXY);
         };
         if(!$pPlayer)
         {
            return;
         }
         this.wangzhezhibangPanel.setAvatar($pPlayer.id,null);
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,$pPlayer.attributeInfo.getSex());
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      public function setZhuweiData(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(this.zhuwei == null)
         {
            this.zhuwei = new WangzhezhibangZhuweiPanel();
         }
         if(!Fun.isVisible(this.zhuwei))
         {
            this.zhuwei.x = (GameConfig.sceneWidth - this.zhuwei.width) / 2;
            this.zhuwei.y = (GameConfig.sceneHeight - this.zhuwei.height) / 2;
            this.zhuwei.$parent = GameInstance.uiInstance.wangzhezhibangPanel;
            GameInstance.uiInstance.uiContainer.addChild(this.zhuwei);
         }
         this.zhuwei.setData(param1,param4,param5,param2,param3);
         this.pageZhuwei = param4;
      }
      
      public function setGuizeTime(param1:String) : void
      {
         if(this.guize == null)
         {
            this.guize = new WangzhezhibangGuizePanel();
         }
         if(!Fun.isVisible(this.guize))
         {
            this.guize.x = (GameConfig.sceneWidth - this.guize.width) / 2;
            this.guize.y = (GameConfig.sceneHeight - this.guize.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.guize);
         }
         this.guize.setTime(param1);
      }
      
      public function setBazhuData(param1:int, param2:int, param3:Array) : void
      {
         if(this.lijiebazhu == null)
         {
            this.lijiebazhu = new WangzhezhibangLijiebazhuPanel();
         }
         if(!Fun.isVisible(this.lijiebazhu))
         {
            this.lijiebazhu.x = (GameConfig.sceneWidth - this.lijiebazhu.width) / 2;
            this.lijiebazhu.y = (GameConfig.sceneHeight - this.lijiebazhu.height) / 2;
            this.lijiebazhu.$parent = GameInstance.uiInstance.wangzhezhibangPanel;
            GameInstance.uiInstance.uiContainer.addChild(this.lijiebazhu);
         }
         this.lijiebazhu.setData(param3,param1,param2);
      }
      
      public function setLingjiang(param1:Array) : void
      {
         if(this.lingjiang == null)
         {
            this.lingjiang = new WangzhezhibangLingjiangPanel();
         }
         if(!Fun.isVisible(this.lingjiang))
         {
            this.lingjiang.x = (GameConfig.sceneWidth - this.lingjiang.width) / 2;
            this.lingjiang.y = (GameConfig.sceneHeight - this.lingjiang.height) / 2;
            this.lingjiang.$parent = GameInstance.uiInstance.wangzhezhibangPanel;
            GameInstance.uiInstance.uiContainer.addChild(this.lingjiang);
         }
         this.lingjiang.setData(param1);
      }
      
      public function showZhanchangGuize(param1:int) : void
      {
         if(this.guizeTip == null)
         {
            this.guizeTip = new WangzhezhibangZhanchangGuizePanel();
         }
         if(!Fun.isVisible(this.guizeTip))
         {
            this.guizeTip.x = (GameConfig.sceneWidth - this.guizeTip.width) / 2;
            this.guizeTip.y = (GameConfig.sceneHeight - this.guizeTip.height) / 2;
            if(param1 == 1)
            {
               GameInstance.uiInstance.uiContainer.addChild(this.guizeTip);
            }
         }
         GameInstance.uiInstance.mainUI.showWZZBGuizeButton(param1 == 1 ? true : false);
      }
      
      public function showAllTip(param1:int, param2:int, param3:int = 0) : void
      {
         if(this.allTip == null)
         {
            this.allTip = new WangzhezhibangTip();
         }
         if(!Fun.isVisible(this.allTip))
         {
            if(param2 == 0)
            {
               return;
            }
            this.allTip.x = (GameConfig.sceneWidth - this.allTip.width) / 2;
            this.allTip.y = (GameConfig.sceneHeight - this.allTip.height) / 2;
            this.allTip.$parent = GameInstance.uiInstance.wangzhezhibangPanel;
            POPWindowManager.showWindow(this.allTip);
         }
         if(Fun.isVisible(this.allTip) && param2 == 0)
         {
            POPWindowManager.closeWindow();
         }
         this.allTip.setData(param1,param3);
         if(param3 == 0)
         {
            GameInstance.uiInstance.mainUI.showWZZBGuizeButton(false);
         }
      }
      
      public function requestZhuweiRefresh() : void
      {
         this.senderProxy.send_74549([this.pageZhuwei,""]);
      }
      
      public function showJifen(param1:Array, param2:int, param3:int) : void
      {
         if(this.jifen == null)
         {
            this.jifen = new WangzhezhibangJifenPanel();
            GameInstance.uiInstance.mainUI.showBtnVisble(false);
         }
         if(!Fun.isVisible(this.jifen))
         {
            if(param3 == 0)
            {
               return;
            }
            this.jifen.x = GameConfig.sceneWidth - this.jifen.width - 20;
            this.jifen.y = 200;
            GameInstance.uiInstance.uiContainer.addChild(this.jifen);
         }
         if(Fun.isVisible(this.jifen) && param3 == 0)
         {
            GameInstance.uiInstance.uiContainer.removeChild(this.jifen);
         }
         this.jifen.setData(param1,param2);
      }
   }
}

